package movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class MovieEndController {
	
	private final String command="movie_end.look";
	private String getPage="/movie_end";

	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(command)
	public ModelAndView movie(
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request) {
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount=movieDao.selectEndMovieCount(map);
		String url=request.getContextPath()+"/"+command;
		Paging pageInfo=new Paging(pageNumber, "8", totalCount, url, whatColumn, keyword, null);
		
		List<MovieBean> endMovieList=new ArrayList<MovieBean>();
		endMovieList=movieDao.selectEndMovie(pageInfo, map);
		
		mav.addObject("endMovieList", endMovieList);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalCount", totalCount);
		mav.setViewName(getPage);
		
		return mav;
		
	}	
	
}
