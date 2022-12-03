package look.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import look.model.LookBean;
import look.model.LookDao;

@Controller
public class LookDetailController {
	final String command = "detail.board";
	String getPage = "/lookDetail";
	
	@Autowired
	LookDao ldao;
	
	@RequestMapping(command)
	public String detail(@RequestParam(required = false) int num, @RequestParam(required = false) String pageNumber, @RequestParam(required = false) int readcount, Model model) {
		System.out.println("num="+num+"/pageNumber="+pageNumber+"/readcount="+readcount);
		
		
		ldao.plusReadCount(num,readcount);
		
		
		LookBean lb = ldao.getByNum(num);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("lb",lb);
		return getPage;
	}

}
