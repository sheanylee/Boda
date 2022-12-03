package event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import event.model.EventBean;
import event.model.EventDao;

@Controller
public class EventUpdateFormController {
	private final String command="event_update_form.et";
	private final String getPage="/event_update_form";
	
	@Autowired
	EventDao eventDao;
	
	@RequestMapping(command)
	public String update(@RequestParam("no") int no,
			Model model) {
		
		EventBean event=eventDao.getEventByNo(no);
		model.addAttribute("event", event);
		return getPage;
	}
}
