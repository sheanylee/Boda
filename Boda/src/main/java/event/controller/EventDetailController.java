package event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import event.model.EventBean;
import event.model.EventDao;

@Controller
public class EventDetailController {
	private final String command="detail.et";
	private final String getPage="/detail_event";
	
	@Autowired
	EventDao eventDao;
	
	@RequestMapping(command)
	public String detail(@RequestParam("no") int no, Model model) {
		System.out.println("no="+no);
		EventBean eb=eventDao.getEventByNo(no);
		model.addAttribute("eb", eb);
		return getPage;
	}
}
