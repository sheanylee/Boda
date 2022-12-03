package ask.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ask.model.AskBean;
import ask.model.AskDao;

@Controller
public class AskInsertController {
	private final String command="insertAsk.ask";
	private String getPage="/askInsert_admin";
	private String gotoPage="redirect:/selectAsk.ask";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private AskDao askDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String insertAsk(HttpSession session) {
		/*
		if(httpSession.getAttribute("loginInfo")==null) {
			httpSession.setAttribute("destination", "redirect:/insertMovie.look");
			
			return "redirect:/login.look";
		}
		else {
			return getPage;
		}
		*/
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView insertAsk(
			@ModelAttribute("ask") @Valid AskBean askBean, BindingResult bindingResult) {
		
		System.out.println("bindingResult.hasErrors():"+bindingResult.hasErrors());
		ModelAndView mav=new ModelAndView();
		
		if(bindingResult.hasErrors()) {
			
			List<ObjectError> list = bindingResult.getAllErrors();
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			mav.setViewName(getPage);
			return mav;
		}
		
		int result=askDao.insertAsk(askBean);
		System.out.println("insertMovie:"+result);
		
		mav.setViewName(gotoPage);
		return mav;
		
	}
}
