package theater.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import theater.model.TheaterBean;
import theater.model.TheaterDao;

@Controller
public class Admin_T_DetailController {
   final String command = "a_detail.th";
   String getPage = "/a_theater_Detail";
   
   @Autowired
   TheaterDao tdao;
   
   @RequestMapping(command)
   public String v(@RequestParam int t_num,@RequestParam(required=false) String t_theater,@RequestParam(required=false) String visit_date,@RequestParam(required = false) String pageNumber, Model model) {
      System.out.println(t_num);
      System.out.println(t_theater);
      TheaterBean tb = tdao.getDetail(t_num);
      model.addAttribute("tb",tb);
      model.addAttribute("pageNumber",pageNumber);
      
      TheaterBean theaterBean = tdao.getIncome(t_theater);
      model.addAttribute("theaterBean",theaterBean);
      
      
      return getPage;
   }
   
   
   @RequestMapping(value="/visit.th", method =RequestMethod.POST)
   public @ResponseBody Map<String,Object> visitDate(@RequestParam(value="visit_date",required=false) String visit_date) throws ParseException {
      SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
      Map<String,Object> map = new HashMap<String,Object>();
      System.out.println("visit_date="+visit_date);
      String day = null;
      if(visit_date == null) {
         Date now = new Date();
         day = simpleDateFormat.format(now);
      }
      else {
         Date v_date = simpleDateFormat.parse(visit_date);
         day = simpleDateFormat.format(v_date);
      }
      System.out.println("visit.th day="+day);
      List<TheaterBean> vlist = (List<TheaterBean>)tdao.getVisitData(day);
      for(TheaterBean tb : vlist) {
         System.out.println(tb.getCnt());
         System.out.println(tb.getVisit_date());
      }
      map.put("visit", vlist);
      System.out.println(map.get("visit"));
      
      return map;
   }
   
   @RequestMapping(value="/moviebooking.th", method =RequestMethod.POST)
   public @ResponseBody Map<String,Object> moviebooking(@RequestParam(value="reserve_date",required=false) String reserve_date
                        ,@RequestParam(value="t_name",required=false) String t_name) throws ParseException {
      SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
      Map<String,Object> map = new HashMap<String,Object>();
      System.out.println("reserve_date="+reserve_date);
      System.out.println("t_name="+t_name);
      String day = null;
      if(reserve_date == null) {
         Date now = new Date();
         day = simpleDateFormat.format(now);
      }
      else {
         Date r_date = simpleDateFormat.parse(reserve_date);
         day = simpleDateFormat.format(r_date);
      }
      System.out.println("moviebooking.th day="+day);
      map.put("t_name", t_name);
      map.put("day", day);
      System.out.println("123");
      List<TheaterBean> rlist = tdao.getReserveData(map);
      System.out.println("rs="+rlist.size());
      for(TheaterBean tb : rlist) {
         System.out.println(tb.getRcnt());
         System.out.println(tb.getRday());
      }
      map.put("rlist", rlist);
      System.out.println(map.get("rlist"));
      
      return map;
   }
   
}