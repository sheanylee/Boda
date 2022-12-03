package theater.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import movie.model.IndeMovieBean;
import movie.model.MovieBean;
import movie.model.MovieDao;
import theater.model.TheaterBean;
import theater.model.TheaterDao;
import time.model.TimeTableBean;

@Controller
@ComponentScan({"theaer.*","movie.*"})
public class Admin_T_timetableInsertController {
	final String command = "timetableInsert.th";
	final String command2 = "timetableInsertCheck.th";
	final String command3 = "timeselect.th";
	String getPage = "/a_TimeTableInsert";
	String goToPage="redirect:timeList.th";
	
	@Autowired
	TheaterDao tdao;
	
	@Autowired
	MovieDao mdao;
	
	@RequestMapping(command2)
	@ResponseBody
	public String check(@RequestParam(value = "time") String time,
			@RequestParam(value = "day") String day,
			@RequestParam(value = "cinema") String cinema,
			@RequestParam(value = "theater") String theater) {
		System.out.println("cinema="+cinema);
		System.out.println("theater="+theater);
		System.out.println("time="+time);
		System.out.println("day="+day);
		String check = "";
		Map<String,String>map = new HashMap<String,String>();
		map.put("cinema", cinema);
		map.put("theater", theater);
		map.put("time", time);
		map.put("day", day);
		
		TimeTableBean tb = tdao.tableInsertCheck(map);
		
		if(tb == null) {
			check="Y";
		}
		else {
			check="N";
		}
		System.out.println("check="+check);
		
		return check;
	}
	
	
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String insert(Model model, @RequestParam(required = false) String theater, @RequestParam(required = false) String pageNumber, 
						@RequestParam(required = false) String cinema,
						@RequestParam(required = false) String day
						) {
		
		System.out.println("pageNumber="+pageNumber);
		System.out.println("theater="+theater);
		System.out.println("cinema="+cinema);
		System.out.println("day="+day);
		
		List<TheaterBean> tlists = tdao.getTheater();
		
		if(theater != null) {
		List<TheaterBean> clists = tdao.getCinemaByTheater(theater);
		model.addAttribute("clists",clists);
		}
		
		
		List<MovieBean> mlists =tdao.getMovie();
		List<IndeMovieBean> indelists =mdao.getMovie(); 
		
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("cinema",cinema);
		model.addAttribute("theater",theater);
		model.addAttribute("day",day);
		model.addAttribute("indelists",indelists);
		model.addAttribute("tlists",tlists);
		model.addAttribute("mlists",mlists);
		return getPage;
	}
	
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String insert(Model model,@RequestParam(required = false) String pageNumber,@ModelAttribute("ttb") @Valid TimeTableBean tb, BindingResult result) {
		
		System.out.println(tb.getTheater()+"/"+tb.getCinema()+"/"+tb.getDay()+"/"+tb.getMname()+"/"+tb.getMstart());
		String day = tb.getDay();
		day =  String.format(day,"yyyy-MM-DD");
		System.out.println("day="+day);
		tb.setDay(day);
		tb.setMstart(day+" "+tb.getMstart());
		System.out.println(tb.getMstart());

		
		if(result.hasErrors()) {
			List<TheaterBean> tlists = tdao.getTheater();
			List<MovieBean> mlists =tdao.getMovie();
			List<IndeMovieBean> indelists =mdao.getMovie(); 
			List<TheaterBean> clists = tdao.getCinemaByTheater(tb.getTheater());
			model.addAttribute("mlists",mlists);
			model.addAttribute("indelists",indelists);
			model.addAttribute("clists",clists);
			model.addAttribute("tlists",tlists);
			return getPage;
		}
		
		//Boda강남/1/2022-09-26/한산: 용의 출현/2022-09-26 23:00:00
		//Boda강남/2/2022-09-27/헌트/11:00
		String run = mdao.getMovieRuntime(tb.getMname());
		System.out.println("run="+run);
		if(run == null) {
			run = "60";
		}
		tb.setM_runtime(run);
		tb.setMstart(tb.getMstart()+":00");
		System.out.println(tb.getMstart()+"/"+tb.getM_runtime());
		
		tdao.insertTimeTable(tb);
		model.addAttribute("pageNumber",pageNumber);
		return goToPage;
	}
	
	@RequestMapping(value = command3)
	public String time(Model model, @RequestParam(required = false) String theater, @RequestParam(required = false) String pageNumber, 
			@RequestParam(required = false) String cinema,@RequestParam(required = false) String day) {
		System.out.println("tpageNumber="+pageNumber);
		System.out.println("ttheater="+theater);
		System.out.println("tcinema="+cinema);
		System.out.println("day="+day);
		/*
		tpageNumber=null
		ttheater=Boda강남
		tcinema=1
		day=2022-09-27
		 */
		Map<String, String>map = new HashMap<String,String>();
		map.put("theater", theater);
		map.put("cinema", cinema);
		map.put("day", day);
		List<TimeTableBean> timelists = tdao.searchTimeDupl(map);
		System.out.println("timelists.size="+timelists.size());
		
		List<TheaterBean> tlists = tdao.getTheater();
		
		if(theater != null) {
		List<TheaterBean> clists = tdao.getCinemaByTheater(theater);
		model.addAttribute("clists",clists);
		}
		
		List<MovieBean> mlists =tdao.getMovie();
		List<IndeMovieBean> indelists =mdao.getMovie(); 
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("theater",theater);
		model.addAttribute("cinema",cinema);
		model.addAttribute("day",day);
		model.addAttribute("indelists",indelists);
		model.addAttribute("tlists",tlists);
		model.addAttribute("mlists",mlists);
		model.addAttribute("timelists",timelists);
		return getPage;
	}
	
	
	
}
