package event.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import event.model.EventBean;
import event.model.EventDao;

@Controller
public class EventUploadController {
	private final String command="event_upload.et";
	private final String getPage="/event_upload_form";
	
	@Autowired
	EventDao eventDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String upload(@ModelAttribute("event") @Valid EventBean eb,
			BindingResult result, HttpSession session,
			HttpServletResponse response) throws IllegalStateException, IOException {
		
		System.out.println("시작 날짜:"+eb.getSday());
		System.out.println("종료 날짜:"+eb.getEday());
		if(result.hasErrors()) {
			return getPage;
		}
		MultipartFile multi1=eb.getUpload1();
		MultipartFile multi2=eb.getUpload2();
		eventDao.insertData(eb);
		
		String uploadPath=servletContext.getRealPath("/resources/event_Image");
		File file1=new File(uploadPath+"/"+multi1.getOriginalFilename());
		File file2=new File(uploadPath+"/"+multi2.getOriginalFilename());
		multi1.transferTo(file1);
		multi2.transferTo(file2);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script> alert('이벤트 등록이 완료되었습니다.'); </script>");
		writer.println("<script> location.href='event.et' </script>");
		return null;
	}
}
