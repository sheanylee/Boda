package movie.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import movie.model.IndeMovieBean;
import movie.model.IndeMovieDao;

@Controller
public class IndeMovieUpdateController {
	private final String command="updateIndeMovie.look";
	private String getPage="/indeMovie_update";
	private String gotoPage="redirect:/selectIndeMovie.look";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private IndeMovieDao indeMovieDao;

	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView updateIndeMovie(@RequestParam("num") int num,
			@RequestParam("pageNumber") String pageNumber, HttpSession session) {
		/*
		if(httpSession.getAttribute("loginInfo")==null) {
			httpSession.setAttribute("destination", "redirect:/insertMovie.look");
			
			return "redirect:/login.look";
		}
		else {
			return getPage;
		}
		*/
		ModelAndView mav = new ModelAndView();
		IndeMovieBean indeMovieBean = indeMovieDao.selectIndeMovieByNum(num);
		
		mav.addObject("indeMovie", indeMovieBean);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String updateMovie(
			@ModelAttribute("indeMovie") @Valid IndeMovieBean indeMovieBean,
			BindingResult result,
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			@RequestParam("originalImg") String originalImg,
			@RequestParam("originalImg1") String originalImg1,
			@RequestParam("originalImg2") String originalImg2,
			Model model) {

		System.out.println("indeMovieBean.getUpload():"+indeMovieBean.getUpload()); //새로운 이미지 파일 이름
		System.out.println("originalImg:"+originalImg); //원래 이미지 파일 이름

		if(result.hasErrors()) {
			model.addAttribute("pageNumber",pageNumber);
			return getPage;
		}

		//원래 이미지 삭제
		String originalPath = servletContext.getRealPath("/resources/movie_image/Independent_film/")+originalImg;
		File file = new File(originalPath);
		file.delete();
		String originalPath1 = servletContext.getRealPath("/resources/movie_image/Independent_film/direc/")+originalImg1;
		File file1 = new File(originalPath1);
		file1.delete();
		String originalPath2 = servletContext.getRealPath("/resources/movie_image/Independent_film/direc/")+originalImg2;
		File file2 = new File(originalPath2);
		file2.delete();
		
		//새로운 이미지 등록
		MultipartFile multipartFile = indeMovieBean.getUpload();
		MultipartFile multipartFile1 = indeMovieBean.getUpload1();
		MultipartFile multipartFile2 = indeMovieBean.getUpload2();
		String uploadPath=servletContext.getRealPath("/resources/movie_image/Independent_film");
		String uploadPath1=servletContext.getRealPath("/resources/movie_image/Independent_film/direc");
		String uploadPath2=servletContext.getRealPath("/resources/movie_image/Independent_film/direc");
		File file00 = new File(uploadPath+"/"+multipartFile.getOriginalFilename()); //파일로 만들기
		File file11 = new File(uploadPath1+"/"+multipartFile1.getOriginalFilename()); //파일로 만들기
		File file22 = new File(uploadPath2+"/"+multipartFile2.getOriginalFilename()); //파일로 만들기
		indeMovieDao.updateIndeMovie(indeMovieBean);
		
		try {
			multipartFile.transferTo(file00); //파일 업로드
			multipartFile1.transferTo(file11); //파일 업로드
			multipartFile2.transferTo(file22); //파일 업로드
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		

		model.addAttribute("pageNumber",pageNumber);
		return gotoPage;
		
	}
	
	
}
