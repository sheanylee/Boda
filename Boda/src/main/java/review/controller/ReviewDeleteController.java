package review.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import review.model.ReviewDao;

@Controller
public class ReviewDeleteController {
	
	private final String command="deleteReview.look";
	private String gotoPage="redirect:/review.look";
	
	@Autowired
	private ReviewDao reviewDao;
	
	@RequestMapping(command)
	public String deleteReview(
			@RequestParam("r_movieName") String r_movieName,
			@RequestParam("r_num") int r_num,
			@RequestParam(value="pageNumber", required=false) String pageNumber) {

		/*
		if(httpSession.getAttribute("loginInfo")==null) {
			httpSession.setAttribute("destination", "redirect:/insertMovie.look");
			
			return "redirect:/login.look";
		}
		else {
			return getPage;
		}
		*/		
		
		String encodeResult = null;
		try {
			encodeResult = URLEncoder.encode(r_movieName, "utf-8");
			System.out.println(encodeResult);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int result=reviewDao.deleteReview(r_num);
		System.out.println("deleteReview:"+result);
		return gotoPage+"?r_movieName="+encodeResult+"&pageNumber="+pageNumber;
		
	}
	
}
