package theater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import theater.model.TheaterDao;

@Controller
public class Admin_T_DeleteController {
	final String command = "admin_delete.th";
	String goToPage="redirect:admin_list.th";
	
	@Autowired
	TheaterDao tdao;
	
	@RequestMapping(command)
	public String delete(@RequestParam int t_num, @RequestParam(required = false) String pageNumber,Model model) {
		System.out.println("num="+t_num);
		System.out.println("pageNumber="+pageNumber);
		
		tdao.deleteTheater(t_num);
		model.addAttribute("pageNumber",pageNumber);
		return goToPage;
	}
	
}
