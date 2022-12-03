package event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class coupon_Controller {
	final String command = "coupon.et";
	String getPage = "/couponEvent";
	
	@RequestMapping(command)
	public String coupon() {
		
		return getPage;
	}
}
