package movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TimeTableController {
	final String command = "table.mv";
	String getPage="/c_theater_List";
	
	@RequestMapping(command)
	public String table() {
		
		return getPage;
	}
	
}
