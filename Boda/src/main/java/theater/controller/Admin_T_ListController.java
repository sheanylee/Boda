package theater.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieDao;
import theater.model.TheaterBean;
import theater.model.TheaterDao;
import utility.Paging;

@Controller
public class Admin_T_ListController {
	final String command = "admin_list.th";
	String getPage = "/a_theater_list";
	
	@Autowired
	TheaterDao tdao;
	
	@RequestMapping(command)
	public String list(Model model,@RequestParam(required = false) String whatColumn,@RequestParam(required = false) String keyword,
			@RequestParam(required = false) String pageNumber, HttpServletRequest request) {
		
		System.out.println("whatColumn="+whatColumn);
		System.out.println("keyword="+keyword);
		System.out.println("234pageNumber="+pageNumber);
		
		Map<String,String>map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = tdao.getTotalCount(map);
		
		String path = request.getContextPath();
		String url = path+"/"+command;
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
		
		List<TheaterBean> lists = tdao.getAllTheater(map,pageInfo);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("lists",lists);
		return getPage;
	}
}
