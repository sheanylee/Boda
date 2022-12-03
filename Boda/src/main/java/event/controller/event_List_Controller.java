package event.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import event.model.EventBean;
import event.model.EventDao;

@Controller
public class event_List_Controller {
	final String command = "event.et";
	String getPage = "/eventList";
	
	@Autowired
	EventDao eventDao;
	
	@RequestMapping(command)
	public String event(HttpSession session) {
		List<EventBean> event_lists=eventDao.getAllData();
		session.setAttribute("event_lists", event_lists);
		
		return getPage;
	}
	
}
