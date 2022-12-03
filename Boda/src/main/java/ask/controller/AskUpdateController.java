package ask.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ask.model.AskBean;
import ask.model.AskDao;

@Controller
public class AskUpdateController {
	private final String command="updateAsk.ask";
	private String getPage="/askUpdate_admin";
	private String gotoPage="redirect:/selectAsk.ask";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private AskDao askDao;

	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView updateAsk(
			@RequestParam("ask_num") int ask_num,
			HttpSession session) {
		/*
		if(httpSession.getAttribute("loginInfo")==null) {
			httpSession.setAttribute("destination", "redirect:/insertMovie.look");
			
			return "redirect:/login.look";
		}
		else {
			return getPage;
		}
		*/
		ModelAndView mav = new ModelAndView();
		AskBean askBean = askDao.selectAskByAsk_num(ask_num);
		
		mav.addObject("ask_num",ask_num);
		mav.addObject("ask", askBean);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String updateAsk(
			@ModelAttribute("ask") @Valid AskBean askBean,
			@RequestParam("ask_num") int ask_num,
			BindingResult result,
			Model model) {

		if(result.hasErrors()) {
			return getPage;
		}
		
		askBean.setAsk_num(ask_num);
		System.out.println(askBean.getAsk_num());
		askDao.updateAsk(askBean);
		return gotoPage;
		
	}
}
