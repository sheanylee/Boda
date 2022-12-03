package movie.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import movie.model.IndeMovieBean;
import movie.model.IndeMovieDao;

@Controller
public class IndeMovieInsertController {
	
	private final String command="insertIndeMovie.look";
	private String getPage="/indeMovie_insert";
	private String gotoPage="redirect:/selectIndeMovie.look";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private IndeMovieDao indeMovieDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String insertIndeMovie(HttpSession session) {
		/*
		if(httpSession.getAttribute("loginInfo")==null) {
			httpSession.setAttribute("destination", "redirect:/insertMovie.look");
			
			return "redirect:/login.look";
		}
		else {
			return getPage;
		}
		*/
		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView insertIndeMovie(
			@ModelAttribute("indeMovie") @Valid IndeMovieBean indeMovieBean, BindingResult bindingResult) {
		
		System.out.println("bindingResult.hasErrors():"+bindingResult.hasErrors());
		ModelAndView mav=new ModelAndView();
		
		if(bindingResult.hasErrors()) {
			
			List<ObjectError> list = bindingResult.getAllErrors();
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			mav.setViewName(getPage);
			return mav;
		}

		MultipartFile multipartFile=indeMovieBean.getUpload();
		MultipartFile multipartFile1=indeMovieBean.getUpload1();
		MultipartFile multipartFile2=indeMovieBean.getUpload2();
		
		indeMovieDao.insertIndeMovie(indeMovieBean);
		
		String uploadPath=servletContext.getRealPath("/resources/movie_image/Independent_film/");
		String uploadPath1=servletContext.getRealPath("/resources/movie_image/Independent_film/direc/");
		String uploadPath2=servletContext.getRealPath("/resources/movie_image/Independent_film/direc/");
		
		File file=new File(uploadPath+"/"+multipartFile.getOriginalFilename());
		File file1=new File(uploadPath1+"/"+multipartFile1.getOriginalFilename());
		File file2=new File(uploadPath2+"/"+multipartFile2.getOriginalFilename());
		
		try {
			multipartFile.transferTo(file);
			multipartFile1.transferTo(file1);
			multipartFile2.transferTo(file2);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.setViewName(gotoPage);
		return mav;
		
	}
	
}
