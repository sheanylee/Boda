package store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import store.model.StoreBean;
import store.model.StoreDao;

@Controller
public class StoreDetailController {
	private final String command="detail.st";
	private final String getPage="/store_detail";
	
	@Autowired
	StoreDao storeDao;
	
	@RequestMapping(command)
	public String detail(@RequestParam("s_num") int s_num, Model model,
			HttpSession session) {
		
		session.removeAttribute("destination");
		StoreBean store=storeDao.getStoreByS_num(s_num);
		model.addAttribute("store", store);
		return getPage;
	}
}
