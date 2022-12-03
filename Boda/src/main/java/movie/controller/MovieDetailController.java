package movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import movie.model.MovieBean;
import movie.model.MovieDao;
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
@ComponentScan({"movie.*","review.*"})
public class MovieDetailController {
	
	private final String command="movie_detail.look";
	private String getPage="/movie_detail";

	@Autowired
	MovieDao movieDao;
	@Autowired
	ReviewDao reviewDao;
	
	@RequestMapping(command)
	public ModelAndView movie_detail(
			@RequestParam(value="m_num",required=false) int m_num,
			@RequestParam(value="m_name",required=false) String r_movieName,
			@RequestParam(value="pageNumber",required=false) String pageNumber) {
		
		MovieBean movieBean=movieDao.selectMovieDetail(m_num);
		
		ModelAndView mav=new ModelAndView();
	
		double avgR_star = reviewDao.avgR_star(r_movieName);
		mav.addObject("avgR_star", avgR_star);
		mav.addObject("movieBean", movieBean);
		if(pageNumber != null) {
			mav.addObject("pageNumber", pageNumber);
		}
		
		mav.setViewName(getPage);
		
		return mav;
		
	}
}
