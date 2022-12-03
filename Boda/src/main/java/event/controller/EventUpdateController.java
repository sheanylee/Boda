package event.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import event.model.EventBean;
import event.model.EventDao;

@Controller
public class EventUpdateController {
	private final String command="event_update.et";
	private final String getPage="/event_update_form";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	EventDao eventDao;
	
	@RequestMapping(command)
	public String update(@ModelAttribute("event") @Valid EventBean eb,
			BindingResult result,
			@RequestParam("origin_main_img") String origin_main_img,
			@RequestParam("origin_contents_img") String origin_contents_img,
			HttpServletResponse response) throws IllegalStateException, IOException {
		
		if(result.hasErrors()) {
			return getPage;
		}
		System.out.println("수정할 main_img:"+origin_main_img);
		System.out.println("수정할 origin_contents_img:"+origin_contents_img);
		
		String originalPath1 = servletContext.getRealPath("/resources/event_Image/")+origin_main_img;
		String originalPath2 = servletContext.getRealPath("/resources/event_Image/")+origin_contents_img;
		
		File file1 = new File(originalPath1);
		file1.delete();
		
		File file2 = new File(originalPath2);
		file2.delete();
		
		MultipartFile multi1 = eb.getUpload1();
		String newPath1 = servletContext.getRealPath("/resources/event_Image/")+eb.getMain_img();
		File new_file1 = new File(newPath1);
		
		MultipartFile multi2 = eb.getUpload2();
		String newPath2 = servletContext.getRealPath("/resources/event_Image/")+eb.getContents_img();
		File new_file2 = new File(newPath2);
		
		multi1.transferTo(new_file1);
		multi2.transferTo(new_file2);
		
		eventDao.updateEvent(eb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script> alert('이벤트 수정이 완료되었습니다.'); </script>");
		writer.println("<script> location.href='event.et' </script>");
		return null;
	}
}

