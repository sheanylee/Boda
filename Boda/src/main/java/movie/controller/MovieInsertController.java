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

import movie.model.MovieBean;
import movie.model.MovieDao;

@Controller
public class MovieInsertController {
	
	private final String command="insertMovie.look";
	private String getPage="/movie_insert";
	private String gotoPage="redirect:/selectMovie.look";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private MovieDao movieDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String insertMovie(HttpSession session) {
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
	public ModelAndView insertMovie(
			@ModelAttribute("movie") @Valid MovieBean movieBean, BindingResult bindingResult) {
		
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
		
		MultipartFile multipartFile=movieBean.getUpload();
		System.out.println("multipartFile.getName():"+multipartFile.getName());
		System.out.println("multipartFile.getOriginalFilename():"+multipartFile.getOriginalFilename());
		System.out.println("movieBean.getM_img():"+movieBean.getM_img());
		
		int result=movieDao.insertMovie(movieBean);
		System.out.println("insertMovie:"+result);
		
		String uploadPath=servletContext.getRealPath("/resources/movie_image/");
		System.out.println("uploadPath:"+uploadPath);
		
		File file=new File(uploadPath+"/"+multipartFile.getOriginalFilename());
		
		try {
			multipartFile.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.setViewName(gotoPage);
		return mav;
		
	}
			
}
