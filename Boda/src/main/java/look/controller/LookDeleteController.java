package look.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import look.model.LookBean;
import look.model.LookDao;

@Controller
public class LookDeleteController {
	final String command = "delete.board";
	String goToPage ="redirect:list.board";
	
	@Autowired
	LookDao ldao;
	
	@RequestMapping(command)
	public String delete(@RequestParam int num, @RequestParam(required = false) String pageNumber,Model model) {
		System.out.println("num="+num);
		System.out.println("pageNumber="+pageNumber);
		
		ldao.deleteLook(num);
		model.addAttribute("pageNumber",pageNumber);
		return goToPage;
	}
	
	
}
