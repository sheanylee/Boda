package look.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
public class LookUpdateContoller {
	final String command = "update.board";
	String getPage = "/updateLookForm";
	String goToPage="redirect:list.board";
	
	@Autowired
	LookDao ldao;
	
	private String lookpw = null;
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String update(@RequestParam int num, @RequestParam(required = false) String pageNumber,Model model) {
		   LookBean look = ldao.getByNum(num);
		   lookpw = look.getPasswd();
		      
		
		System.out.println("Unum="+num);
		System.out.println("UpageNumber="+pageNumber);
		
		LookBean lb = ldao.getByNum(num);
		
		model.addAttribute("lb",lb);
		model.addAttribute("pageNumber",pageNumber);
		return getPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String update(@ModelAttribute("lb") @Valid LookBean lb,BindingResult result, 
			@RequestParam(required = false) String pageNumber,Model model,HttpServletResponse response ) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(result.hasErrors()) {
			model.addAttribute("pageNumber",pageNumber);
			return getPage;
		}
		
		
		
		if(lb.getPasswd().equals(lookpw)) {
			ldao.updateLook(lb);
	         model.addAttribute("pageNumber",pageNumber);
	         model.addAttribute("num",lb.getNum());
	         return goToPage;
	      }
		
		
	      else {
	         writer.print("<script> alert('내가 쓴글 아님'); </script>");
	         writer.flush();
	         model.addAttribute("lb",lb);
	         model.addAttribute("pageNumber",pageNumber);
	         return getPage;
	      }
	}
}
