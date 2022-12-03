package store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.OrderBean;
import order.model.OrderDao;

@Controller
@ComponentScan("order.*")
public class SearchController {
	private final String command="search_paylist.st";
	private final String getPage="/store_paylist_search_admin";
	
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(command)
	public String search(@RequestParam(value = "whatcolumn",required = false) String whatcolumn,
			@RequestParam(value = "search",required = false) String search,
			HttpSession session, Model model) {
		
		System.out.println("whatcolumn:"+whatcolumn);
		System.out.println("search:"+search);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatcolumn", whatcolumn);
		map.put("search", "%"+search+"%");
		List<OrderBean> lists=orderDao.selectBySearch(map);
		model.addAttribute("lists", lists);
		return getPage;
	}
}
