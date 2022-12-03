package event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class coffee_Controller {
	final String command = "coffe.et";
	String getPage = "/coffeeEvent";
	
	@RequestMapping(command)
	public String coffee() {
		
		return getPage;
	}
	
}
