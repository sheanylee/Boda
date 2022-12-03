package movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.model.MovieBean;
import movie.model.MovieDao;
import review.model.ReviewDao;

@Controller
public class MovieEndDetailController {
	
	private final String command="movie_end_detail.look";
	private String getPage="/movie_end_detail";

	@Autowired
	MovieDao movieDao;
	@Autowired
	ReviewDao reviewDao;
	
	@RequestMapping(command)
	public ModelAndView movie_End_detail(
			@RequestParam("m_num") int m_num,
			@RequestParam("m_name") String r_movieName,
			@RequestParam("pageNumber") String pageNumber) {
		
		MovieBean movieBean=movieDao.selectMovieDetail(m_num);
		
		ModelAndView mav=new ModelAndView();
		
			double avgR_star = reviewDao.avgR_star(r_movieName);
			mav.addObject("avgR_star", avgR_star);

			mav.addObject("movieBean", movieBean);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName(getPage);
		
		return mav;
		
	}
}
