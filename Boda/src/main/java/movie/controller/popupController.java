package movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class popupController {
	final String command = "popup.look";
	String getPage= "/popup";
	
	@RequestMapping(command)
	public String popup() {
		
		return getPage;
	}
	
}
