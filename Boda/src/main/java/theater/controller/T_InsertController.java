package theater.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import theater.model.TheaterBean;
import theater.model.TheaterDao;

@Controller
public class T_InsertController {
	final String command = "insert.th";
	final String command2 = "TheaterInsertCheck.th";
	String getPage = "/a_theater_insert";
	String goToPage = "redirect:admin_list.th";
	
	@Autowired
	TheaterDao tdao;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping(value=command2,method = RequestMethod.GET)
	@ResponseBody
	public String check(
			@RequestParam(value = "cinema") String cinema,@RequestParam(value = "theater") String theater) {
		
		System.out.println("cinema="+cinema);
		System.out.println("theater="+theater);
		String check = "";
		List<TheaterBean> clists = tdao.getCinemaByTheater(theater);
		System.out.println("ccc="+clists.size());
		
		if(clists.size()==0) {
			check="Y";
		}
		else {
			for(TheaterBean bean : clists) {
				System.out.println(bean.getT_name());
				if(bean.getT_name().equals(cinema)) {
					check="N";
					break;
				}
				else if(bean.getT_name().equals(cinema) == false) {
					check="Y";
				}
			}
		}
		System.out.println("check="+check);
		
		return check;
	}
	
	
	
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String insert(@RequestParam(required = false) String pageNumber,Model model) {
		System.out.println("444pageNumber="+pageNumber);
		model.addAttribute("pageNumber",pageNumber);
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String insert(@Valid TheaterBean tb, BindingResult result,Model model,@RequestParam(required = false) String pageNumber){
		System.out.println("Upload="+tb.getUpload());
		System.out.println("timg="+tb.getT_img());
		System.out.println("getT_location="+tb.getT_location());
		
		if(result.hasErrors()) {
			return getPage;
		}
		
		MultipartFile mf = tb.getUpload();
		String url = application.getRealPath("/resources/극장 이미지");
		
		File file = new File(url+"/"+mf.getOriginalFilename());
		System.out.println("file="+file);
		
		try {
			mf.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		tdao.insertTheater(tb);
		model.addAttribute("pageNumber",pageNumber);
		return goToPage;
	}
	
}
