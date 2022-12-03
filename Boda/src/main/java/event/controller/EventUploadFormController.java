package event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventUploadFormController {
	private final String command="event_upload_form.et";
	private final String getPage="/event_upload_form";
	
	@RequestMapping(command)
	public String upload_form() {
		return getPage;
	}
}
