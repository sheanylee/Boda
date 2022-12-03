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
public class MovieSelectController {
	
	private final String command="selectMovie.look";
	private String getPage="/movie_select";
	
	@Autowired
	private MovieDao movieDao;
	
	@RequestMapping(command)
	public ModelAndView selectMovie(
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request) {
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount=movieDao.selectTotalCount(map);
		String url=request.getContextPath()+"/"+command;
		Paging pageInfo=new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword, null);
		
		List<MovieBean> movieList=new ArrayList<MovieBean>();
		movieList=movieDao.selectMovie(pageInfo, map);
		
		mav.addObject("movieList", movieList);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalCount", totalCount);
		
		mav.setViewName(getPage);
		
		return mav;
		
	}
}