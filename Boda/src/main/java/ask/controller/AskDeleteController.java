package ask.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ask.model.AskDao;

@Controller
public class AskDeleteController {
	private final String command="deleteAsk.ask";
	private String gotoPage="redirect:/selectAsk.ask";
	
	@Autowired
	private AskDao askDao;

	@Autowired
	ServletContext servletContext;	
	
	@RequestMapping(command)
	public String deleteMovie(@RequestParam("ask_num") int ask_num){
		
		
		int result=askDao.deleteAsk(ask_num);
		System.out.println(result);
		return gotoPage;
				
	}
}
