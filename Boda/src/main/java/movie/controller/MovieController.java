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
public class MovieController {
	
	private final String command="movie.look";
	private String getPage="/movie";

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
		
		int totalCount=movieDao.selectBoxofficeCount(map);
		String url=request.getContextPath()+"/"+command;
		Paging pageInfo=new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword, null);
		
		List<MovieBean> movieList=new ArrayList<MovieBean>();
		movieList=movieDao.selectBoxoffice(pageInfo, map);
		
		mav.addObject("movieList", movieList);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalCount", totalCount);
		mav.setViewName(getPage);
		
		
		int visitCnt = movieDao.getVisitorCountToday();
        if(visitCnt == 0) {
        	movieDao.insertVisitorCount(); //가영 추가
        }
        else {
        	movieDao.updateTodayVisitorCount();
        }
		
		return mav;
		
	}
}
