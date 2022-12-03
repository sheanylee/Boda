package movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.IndeMovieBean;
import movie.model.MovieDao;

@Controller
public class IndeMovieDetailController {
	final String command = "indeMovieDetail.look";
	String getPage = "/indeMovie_Detail";
	
	@Autowired
	MovieDao mdao;
	
	@RequestMapping(command)
	public String detail(@RequestParam int num, Model model) {
		System.out.println("indeDetailnum="+num);
		IndeMovieBean ib = mdao.getIndeMovieDetailByNum(num);
		
		model.addAttribute("ib",ib);
		return getPage;
	}
			
}
