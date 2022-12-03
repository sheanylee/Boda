package movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.model.MovieBean;
import movie.model.MovieDao;
import utility.Paging;

@Controller
public class MovieReopeningController {
	
	private final String command="movie_reopening.look";
	private String getPage="/movie_reopening";

	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(command)
	public ModelAndView movie_reopening(HttpServletRequest request) {
		
		ModelAndView mav=new ModelAndView();
		
		String url=request.getContextPath()+"/"+command;
		
		List<MovieBean> reopeningMovieList=new ArrayList<MovieBean>();
		reopeningMovieList=movieDao.selectReopening();
		
		mav.addObject("reopeningMovieList", reopeningMovieList);
		mav.setViewName(getPage);
		
		return mav;
		
	}
}
