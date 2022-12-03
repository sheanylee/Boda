
package theater.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.IndeMovieBean;
import movie.model.MovieBean;
import movie.model.MovieDao;
import theater.model.TheaterBean;
import theater.model.TheaterDao;
import time.model.TimeTableBean;

@Controller
public class Admin_TimeTable_UpdateController {
	final String command = "updateTable.th";
	final String command2 = "timeupdate.th";
	String getPage = "/a_theater_TimeTable_Update";
	String goToPage = "redirect:timeList.th";
	
	@Autowired
	TheaterDao tdao;
	
	@Autowired
	MovieDao mdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String update(@RequestParam(value="num",required = false) String num,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			@RequestParam(value="theater",required = false) String theater, 
			@RequestParam(value="mname",required = false) String mname, 
			Model model) {
		System.out.println("num="+num);
		System.out.println("pageNumber="+pageNumber);
		System.out.println("theater="+theater);
		System.out.println("mname="+mname);
		TimeTableBean tb = null;
		MovieBean mb = null;
		
		mb = mdao.findMnameByNum(mname);
		if(mb == null) {
			tb = tdao.getTimeTableIndeByNum(num);
			model.addAttribute("tb",tb);
		}
		else {
			tb = tdao.getTimeTableByNum(num);	
			model.addAttribute("tb",tb);
		}
		
		List<TheaterBean> tlists = tdao.getTheater();
		
		
		if(theater == null) {
			theater = tb.getTheater();
			List<TheaterBean> clists = tdao.getCinemaByTheater(theater);
			model.addAttribute("clists",clists);
		}
		else {
			List<TheaterBean> clists = tdao.getCinemaByTheater(theater);
			model.addAttribute("clists",clists);
		}
		
		List<MovieBean> mlists = tdao.getMovie();
		List<IndeMovieBean> indeLists = mdao.getMovie();
		
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("indeLists",indeLists);
		model.addAttribute("tlists",tlists);
		model.addAttribute("mlists",mlists);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String update(@ModelAttribute("tb") @Valid TimeTableBean tb, BindingResult result, @RequestParam(required = false) String pageNumber,@RequestParam(required = false) String theater, Model model) {
		System.out.println("pageNumber="+pageNumber);
		System.out.println("theater="+theater);
		System.out.println("tb2.="+tb.getMname());
		System.out.println("tb2.="+tb.getTheater());
		System.out.println("tb2.="+tb.getCinema());
		System.out.println("tb.mstart="+tb.getMstart());
		System.out.println("tb.day="+tb.getDay());
		
		tdao.updateTimeTable(tb);
		
		model.addAttribute("pageNumber",pageNumber);
		return goToPage;
	}
	
	@RequestMapping(value = command2)
	public String time(Model model, @RequestParam(required = false) String theater, @RequestParam(required = false) String pageNumber, 
			@RequestParam(required = false) String cinema,@RequestParam(required = false) String day,@RequestParam(required = false) String num) {
		System.out.println("tpageNumber="+pageNumber);
		System.out.println("ttheater="+theater);
		System.out.println("tcinema="+cinema);
		System.out.println("day="+day);
		System.out.println("num="+num);
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
		map.put("num", num);
		List<TimeTableBean> timelists = tdao.searchTimeDupl(map);
		System.out.println("timelists.size="+timelists.size());
		for(TimeTableBean timetable :timelists) {
			System.out.println("tb.get1="+timetable.getMstart());
			/*
			tb.get1=13
			tb.get2=12
			tb.get3=15
			tb.get1=14
			tb.get2=13
			tb.get3=15
			tb.get1=09
			tb.get2=08
			tb.get3=11
			*/
		}
		List<TheaterBean> tlists = tdao.getTheater();
		
		
		List<TheaterBean> clists = tdao.getCinemaByTheater(theater);
		model.addAttribute("clists",clists);
		
		
		List<IndeMovieBean> upindelists =mdao.getMovie(); 
		System.out.println("updateindelists.size="+upindelists.size());
		model.addAttribute("upindelists",upindelists);
		List<MovieBean> mlists =tdao.getMovie();
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("theater",theater);
		model.addAttribute("cinema",cinema);
		model.addAttribute("day",day);
		model.addAttribute("num",num);
		model.addAttribute("tlists",tlists);
		model.addAttribute("mlists",mlists);
		model.addAttribute("timelists",timelists);
		return getPage;
	}
	
	
	
}
	
	
