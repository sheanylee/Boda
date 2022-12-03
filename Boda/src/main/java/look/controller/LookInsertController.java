package look.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import look.model.LookBean;
import look.model.LookDao;

@Controller
public class LookInsertController {
	final String command = "insert.board";
	String getPage = "/insertLookForm";
	String goToPage = "redirect:list.board";
	String gotoLogin = "redirect:login.bd";
	
	
	@Autowired
	LookDao ldao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String insert(HttpSession session) {
		
		session.removeAttribute("destination");
		
		if(session.getAttribute("loginInfo")==null) {
			session.setAttribute("destination","redirect:/"+command);
			//로그인 성공하면 글쓰기 작업 할 수 있도록 목적지 설정
			return gotoLogin;
		}
		else {
			return getPage;
		}
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String insert(@Valid LookBean lbean,BindingResult result, HttpServletRequest request) {
		
		
		
		
		if(result.hasErrors()) {
			return getPage;
		}
		
		lbean.setReg_date(new Timestamp(System.currentTimeMillis()));
		lbean.setIp(request.getRemoteAddr());
		lbean.setRe_step(0);
		lbean.setRe_level(0);
		ldao.insertLook(lbean);
		
		return goToPage;
	}
	
}
