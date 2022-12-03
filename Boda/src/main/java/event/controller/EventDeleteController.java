package event.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import event.model.EventDao;

@Controller
public class EventDeleteController {
	private final String command="event_delete.et";
	
	@Autowired
	EventDao eventDao;
	
	@RequestMapping(command)
	public void delete(@RequestParam("no") int no,
			HttpServletResponse response) throws IOException {
		
		eventDao.deleteEvent(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script> alert('이벤트가 삭제되었습니다.'); </script>");
		writer.println("<script> location.href='event.et' </script>");
	}
}
