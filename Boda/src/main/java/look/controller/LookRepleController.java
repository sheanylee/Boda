package look.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import look.model.LookBean;
import look.model.LookDao;

@Controller
public class LookRepleController {
	final String command = "reple.board";
	String getPage = "/repleLookForm";
	String goToPage = "redirect:list.board";
	
	@Autowired
	LookDao ldao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String reple(@RequestParam int num, @RequestParam(required = false) String pageNumber,
			@RequestParam(required = false) int ref,@RequestParam(required = false) int re_step,
			@RequestParam(required = false) int re_level,
			Model model) {
		
		model.addAttribute("num",num);
		model.addAttribute("ref",ref);
		model.addAttribute("re_step",re_step);
		model.addAttribute("re_level",re_level);
		model.addAttribute("pageNumber",pageNumber);
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String reple(@ModelAttribute("lb") @Valid LookBean lb,BindingResult result, @RequestParam(required = false) String pageNumber,Model model,HttpServletRequest request) {
		
		System.out.println("Rnum="+lb.getNum());
		System.out.println("RpageNumber="+pageNumber);
		
		if(result.hasErrors()) {
			System.out.println(result.hasErrors());
			model.addAttribute("num",lb.getNum());
			model.addAttribute("ref",lb.getRef());
			model.addAttribute("re_step",lb.getRe_step());
			model.addAttribute("re_level",lb.getRe_level());
			model.addAttribute("pageNumber",pageNumber);
			return getPage;
		}
		else {
		
		System.out.println("Aaaaaaaaa");
		lb.setReg_date(new Timestamp(System.currentTimeMillis()));
		lb.setIp(request.getRemoteAddr());

		ldao.repleUpdate(lb);
		
		ldao.repleInsert(lb);
		model.addAttribute("pageNumber",pageNumber);
		return goToPage;
		}
	}
	
}
