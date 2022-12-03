package review.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boda.member.model.MemberBean;
import review.model.ReviewBean;
import review.model.ReviewDao;
import utility.Paging_review;

@Controller
public class ReviewController {
	
	public final String command="review.look";
	public String getPage="/review";
	private String gotoPage="redirect:/review.look";
	
	@Autowired
	ReviewDao reviewDao;
	
	@RequestMapping(command)
	public ModelAndView review(
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			@RequestParam(value="r_movieName",required=false) String r_movieName,
			HttpServletRequest request,
		HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("r_movieName", r_movieName);
		
		int totalCount=reviewDao.selectReviewCount(map);
		String url=request.getContextPath()+"/"+command;
		
		Paging_review pageInfo=new Paging_review(pageNumber, "10", totalCount, url, r_movieName, null, null, null);
		
		List<ReviewBean> reviewList=new ArrayList<ReviewBean>();
		reviewList=reviewDao.selectReview(pageInfo, map);
		
		
		
		//아이디 하나당 관람평 하나
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		if(mb != null) {
			String id =  mb.getId();
			ReviewBean rebean = new ReviewBean();
			rebean.setR_memberId(id);
			rebean.setR_movieName(r_movieName);
			int countReview = reviewDao.getCountById(rebean);
			mav.addObject("countReview", countReview);
			//session.setAttribute("destination", "mav.setViewName(redirect:review.look)");
		}
		double avgR_star = reviewDao.avgR_star(r_movieName);
		mav.addObject("avgR_star", avgR_star);
		
		mav.addObject("reviewList", reviewList);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalCount", totalCount);
		mav.addObject("r_movieName", r_movieName);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView insertReview(
			@ModelAttribute("review") @Valid ReviewBean reviewBean, 
			@RequestParam(value="r_movieName") String r_movieName, 
			BindingResult bindingResult, 
			HttpServletResponse response,HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		System.out.println("r_movieName : " +  r_movieName);
		System.out.println("bindingResult.hasErrors():"+bindingResult.hasErrors());
		
		
		if(bindingResult.hasErrors()) {
			
			List<ObjectError> list = bindingResult.getAllErrors();
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			mav.setViewName(getPage);
			return mav;
		}
		
		int result=reviewDao.insertReview(reviewBean);
		System.out.println("insertReview:"+result);
		
		String encodeResult = null;
		try {
			encodeResult = URLEncoder.encode(r_movieName, "utf-8");
			System.out.println(encodeResult);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//session.removeAttribute("destination");
		
		mav.setViewName(gotoPage + "?r_movieName=" + encodeResult);
		return mav;	
	}
	
}
