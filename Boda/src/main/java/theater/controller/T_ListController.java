package theater.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import theater.model.TheaterBean;
import theater.model.TheaterDao;
import time.model.TimeTableBean;

@Controller
public class T_ListController {
   final String command = "list.th";
   String getPage = "/c_theater_List";

   @Autowired
   TheaterDao tdao;

   @RequestMapping(command)
   public String list(@RequestParam(required = false) String day,@RequestParam(required = false) String t_region,
         @RequestParam(required = false) String t_theater, @RequestParam(required = false) String t_region2,@RequestParam(required = false) String t_region3, Model model) {
      System.out.println("t_region="+t_region );
      System.out.println("t_region2="+t_region2 );
      System.out.println("t_region3="+t_region3 );
      System.out.println("t_theater="+t_theater );
      System.out.println("day="+day );

      if(t_region == null) {
         t_region = "서울";
      }
      if(t_theater == null) {
         t_theater = "Boda강남";
      }
      if(day == null) {
         LocalDate now = LocalDate.now(); // 器杆 沥狼        
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");// 器杆 利侩        
         day = now.format(formatter);
      }

      Map<String,String>map = new HashMap<String,String>();
      map.put("t_region", "%"+t_region+"%");
      map.put("t_region2", "%"+t_region2+"%");
      map.put("t_region3", "%"+t_region3+"%");

      List<TheaterBean>rlists = tdao.getRegions();
      List<TheaterBean>lists = tdao.getTheater(map);

      TheaterBean tbean = tdao.getInfoByregion(t_theater);

      TheaterBean thbean = tdao.getMax(t_theater);

      System.out.println(123);
      TimeTableBean tt = new TimeTableBean ();
      tt.setDay(day);
      tt.setTheater(t_theater);

      System.out.println(tt.getDay());
      System.out.println(tt.getTheater());

      List<TimeTableBean> ttlists = tdao.getTableByTheater(tt);
      List<TimeTableBean> indelists = tdao.getIndeTableByTheater(tt);

      model.addAttribute("t_region",t_region);
      model.addAttribute("t_region2",t_region2);

      model.addAttribute("t_region3",t_region3);         

      model.addAttribute("day",day);
      model.addAttribute("t_theater",t_theater);
      model.addAttribute("indelists",indelists);
      model.addAttribute("ttlists",ttlists);
      model.addAttribute("thbean",thbean);
      model.addAttribute("tbean",tbean);
      model.addAttribute("rlists",rlists);
      model.addAttribute("lists",lists);
      return getPage;
   }



}
