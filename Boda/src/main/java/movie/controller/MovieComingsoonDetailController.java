package movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.model.MovieBean;
import movie.model.MovieDao;

@Controller
public class MovieComingsoonDetailController {
	
	private final String command="movie_comingsoon_detail.look";
	private String getPage="/movie_comingsoon_detail";

	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(command)
	public ModelAndView movie_comingsoon_detail(
			@RequestParam("m_num") int m_num,
			@RequestParam("pageNumber") String pageNumber) {
		
		MovieBean movieBean=movieDao.selectMovieDetail(m_num);
		
		ModelAndView mav=new ModelAndView();
	
		mav.addObject("movieBean", movieBean);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName(getPage);
		
		return mav;
		
	}
}
