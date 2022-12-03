package ask.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ask.model.AskBean;
import ask.model.AskDao;

@Controller
public class AskController {
	
	final String command  = "askList.ask";
	String getPage = "/askList";
	
	@Autowired
	AskDao askDao;
	
	@RequestMapping(command)
	public String ask(
			@RequestParam(required = false) String whatColumn,
			@RequestParam(required = false) String keyword, Model model, HttpServletRequest request) {
		
		Map<String,String>map = new HashMap<String,String>();
		
		System.out.println("whatColumn="+whatColumn);
		System.out.println("keyword="+keyword);
		
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = askDao.getTotalCount(map);
		System.out.println("totalCount = "+totalCount);
		
		String context = request.getContextPath();
		String url = context +"/"+command;

		List<AskBean> lists = askDao.selectAsk(map);
			System.out.println("lists.size="+lists.size());//lists.size=10
	
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("lists",lists);
		
		return getPage;
	}
}
