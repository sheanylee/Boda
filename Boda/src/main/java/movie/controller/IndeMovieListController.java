package movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.IndeMovieBean;
import movie.model.MovieDao;

@Controller
public class IndeMovieListController {
	final String command = "indeMovieList.look";
	final String command2 = "indeLikes.look";
	String getPage = "/indeMovie_List";
	
	@Autowired
	MovieDao mdao;
	
	@RequestMapping(command)
	public String list(Model model) {
		
		List<IndeMovieBean>lists = mdao.getIndeMovieList();
		
		model.addAttribute("lists",lists);
		return getPage;
	}
	
	@RequestMapping(command2)
	public String likes(@RequestParam int num) {
		System.out.println(num);
		mdao.likesPlusByNum(num);
		return "redirect:indeMovieList.look";
		
	}
	
}
