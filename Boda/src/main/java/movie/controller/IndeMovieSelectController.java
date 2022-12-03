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

import movie.model.IndeMovieBean;
import movie.model.IndeMovieDao;
import utility.Paging;

@Controller
public class IndeMovieSelectController {
	
	private final String command="selectIndeMovie.look";
	private String getPage="/indeMovie_select";
	
	@Autowired
	private IndeMovieDao indeMovieDao;
	
	@RequestMapping(command)
	public ModelAndView selectIndeMovie(
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request) {
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount=indeMovieDao.selectTotalCount(map);
		String url=request.getContextPath()+"/"+command;
		Paging pageInfo=new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword, null);
		
		List<IndeMovieBean> indeMovieList=new ArrayList<IndeMovieBean>();
		indeMovieList=indeMovieDao.selectIndeMovie(pageInfo, map);
		
		mav.addObject("indeMovieList", indeMovieList);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalCount", totalCount);
		
		mav.setViewName(getPage);
		
		return mav;
		
	}
			
}
