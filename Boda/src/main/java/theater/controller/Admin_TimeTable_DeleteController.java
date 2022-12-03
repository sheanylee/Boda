package theater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import theater.model.TheaterDao;

@Controller
public class Admin_TimeTable_DeleteController {
	final String command = "deleteTable.th";
	String goToPage = "redirect:timeList.th";
	
	@Autowired
	TheaterDao tdao;
	
	@RequestMapping(command)
	public String delete(@RequestParam int num, @RequestParam(required = false) String pageNumber,Model model) {
		System.out.println("num="+num);
		System.out.println("pageNumber="+pageNumber);
		
		tdao.deleteTable(num);
		model.addAttribute("pageNumber",pageNumber);
		return goToPage;
	}
	
	
}
