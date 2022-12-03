package book.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookDao;
import theater.model.TheaterBean;
import theater.model.TheaterDao;
import time.model.TimeTableBean;

@Controller
@ComponentScan("theater.*")
public class BookMainController {

   private final String booking = "booking.bk";
   private String getPage = "/movie_booking";
   
   @Autowired
   BookDao bookDao;
   
   @Autowired
   TheaterDao theaterDao;
   
   //movie_detail,movie.jsp의 예매 혹은 사진 클릭하면 빠른예매로 넘어옴(movie_booking.jsp로 이동)
   @RequestMapping(value=booking, method=RequestMethod.GET)
   public String booking(@RequestParam(value="currentDate",required=false) String currentDate,
                  @RequestParam(value="mname",required=false) String mname,
                  @RequestParam(value="selectRg",required=false) String selectRg,
                  @RequestParam(value="selectCn",required=false) String selectCn, //영화관이름
                  Model model){
      
	  
      if(currentDate != null) { //날짜를 누르면 해당날짜의 영화리스트와 대지역이 뜨도록
         System.out.println("currentDate : " + currentDate);
         List<TimeTableBean> GetMovieLists = bookDao.getAllMovieForBooking(currentDate);
         List<TimeTableBean> GetIndeMovieLists = bookDao.getAllIndeMovieForBooking(currentDate);
         model.addAttribute("GetMovieLists",GetMovieLists);
         model.addAttribute("GetIndeMovieLists",GetIndeMovieLists);
         System.out.println("1");
      }
      
      if(mname != null) { //영화를 클릭하면 대지역 출력
         System.out.println("mname : " + mname);
         List<TheaterBean> getRegionList = bookDao.getRegionList(mname);
         model.addAttribute("getRegionList",getRegionList);
         System.out.println("2");
      }

      if(selectRg != null) { //대지역을 클릭하면 극장이름 출력, 영화가 상영되는 시네마만 출력하기
         System.out.println("selectRg : " + selectRg + " mname : " + mname);
         Map<String, String>map = new HashMap<String, String>();
         map.put("selectRg", selectRg);
         map.put("mname", mname);
         List<TheaterBean> TheaterLists =  bookDao.getAllTheaterForBooking(map);
         model.addAttribute("TheaterLists",TheaterLists);
         System.out.println("3");
      }
      
      if(selectCn != null) { //극장이름을 클릭하면 날짜와 영화와 극장에 맞는 시간 출력하기

         System.out.println("selectCn : " + selectCn + " mname : " + mname + "currentDate : " + currentDate);
         
         TimeTableBean tbean = new TimeTableBean(selectCn,currentDate,mname);
         List<TimeTableBean> TimeTableLists =  bookDao.getAllTimeTableForBooking(tbean);
         List<TimeTableBean> IndeTimeTableLists =  bookDao.getAllIndeTimeTableForBooking(tbean);
         //TimeTableLists.t_seat
         //TimeTableLists.bookingSeat
         model.addAttribute("TimeTableLists",TimeTableLists);
         model.addAttribute("IndeTimeTableLists",IndeTimeTableLists);
         System.out.println("4");
      }
      
      model.addAttribute("currentDate",currentDate);
      model.addAttribute("mname",mname);
      model.addAttribute("selectRg",selectRg);
      model.addAttribute("selectCn",selectCn);
      return getPage;
   }
}