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

import movie.model.MovieBean;
import movie.model.MovieDao;

@Controller
public class MovieUpdateController {
	
	private final String command="updateMovie.look";
	private String getPage="/movie_update";
	private String gotoPage="redirect:/selectMovie.look";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private MovieDao movieDao;

	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView updateMovie(@RequestParam("m_num") int m_num,
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
		MovieBean movieBean = movieDao.selectMovieByM_num(m_num);
		
		mav.addObject("movie", movieBean);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String updateMovie(
			@ModelAttribute("movie") @Valid MovieBean movieBean,
			BindingResult result,
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			@RequestParam("originalImg") String originalImg,
			Model model) {

		System.out.println("movieBean.getUpload():"+movieBean.getUpload()); //새로운 이미지 파일 이름
		System.out.println("originalImg:"+originalImg); //원래 이미지 파일 이름

		if(result.hasErrors()) {
			model.addAttribute("pageNumber",pageNumber);
			
			return getPage;
		}

		//원래 이미지 삭제
		String originalPath = servletContext.getRealPath("/resources/movie_image/")+originalImg;
		File file1 = new File(originalPath);
		file1.delete();
		
		//새로운 이미지 등록
		MultipartFile multipartFile = movieBean.getUpload();
		String uploadPath=servletContext.getRealPath("/resources/movie_image");
		File file2 = new File(uploadPath+"/"+multipartFile.getOriginalFilename()); //파일로 만들기
		movieDao.updateMovie(movieBean);
		
		try {
			multipartFile.transferTo(file2); //파일 업로드
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		model.addAttribute("pageNumber",pageNumber);
		return gotoPage;
		
	}
}
