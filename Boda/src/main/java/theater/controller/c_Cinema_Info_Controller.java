package theater.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class c_Cinema_Info_Controller {
	final String command = "c_Cinema_Info.th";
	String getPage = "/c_Cinema_Info";
	
	@RequestMapping(command)
	public String info() {
		
		return getPage;
	}
}
