package look.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import look.model.LookBean;
import look.model.LookDao;
import utility.Paging;

@Controller
public class LookListController {
	final String command  = "list.board";
	String getPage = "/lookList";
	
	@Autowired
	LookDao ldao;
	
	@RequestMapping(command)
	public String list(@RequestParam(required = false) String pageNumber,
			@RequestParam(required = false) String whatColumn,
			@RequestParam(required = false) String keyword, Model model, HttpServletRequest request) {
		
		Map<String,String>map = new HashMap<String,String>();
		
		System.out.println("pageNumber="+pageNumber);
		System.out.println("whatColumn="+whatColumn);
		System.out.println("keyword="+keyword);
		
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = ldao.getTotalCount(map);
		System.out.println("totalCount = "+totalCount);
		
		String context = request.getContextPath();
		String url = context +"/"+command;
		
		Paging pageInfo = new Paging(pageNumber,"10",totalCount,url,whatColumn,keyword,null);

		if(pageNumber == null){
			pageNumber="1";
		}
		
		List<LookBean> lists = ldao.getArticles(pageInfo,map);
			System.out.println("lists.size="+lists.size());//lists.size=10
	
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("lists",lists);
		model.addAttribute("pageInfo",pageInfo);
		
		return getPage;
	}
	
	
	
	
}
