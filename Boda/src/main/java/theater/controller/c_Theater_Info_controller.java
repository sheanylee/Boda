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

@Controller
public class c_Theater_Info_controller {
   final String command = "theater_Info.th";
   String getPage = "/c_Theater_Info";
   
   @Autowired
   TheaterDao tdao;
   
   @RequestMapping(command)
   public String info(@RequestParam(required = false,value = "t_num") Integer t_num,@RequestParam(required = false) String t_region,
         @RequestParam(required = false) String t_theater, @RequestParam(required = false) String t_region2,@RequestParam(required = false) String t_region3, Model model) {
      System.out.println("ttttttt_num="+t_num );
      System.out.println("t_region="+t_region );
      System.out.println("t_region2="+t_region2 );
      System.out.println("t_region3="+t_region3 );
      System.out.println("t_theater="+t_theater );

      if(t_region == null) {
         t_region = "서울";
      }
      if(t_theater == null) {
         t_theater = "Boda강남";
      }
      
      System.out.println("aaa");
      Map<String,String>map = new HashMap<String,String>();
      map.put("t_region", "%"+t_region+"%");
      map.put("t_region2", "%"+t_region2+"%");
      map.put("t_region3", "%"+t_region3+"%");

      System.out.println("bbb");
      List<TheaterBean>rlists = tdao.getRegions();
      List<TheaterBean>lists = tdao.getTheater(map);

      System.out.println("ccc");
      TheaterBean tbean = tdao.getInfoByregion(t_theater);

      TheaterBean thbean = tdao.getMax(t_theater);
      System.out.println("ddd");
      System.out.println("ttttttt_num="+t_num );
      TheaterBean tb = tdao.getDetail(t_num);
      System.out.println(tb.getT_location());
      
      model.addAttribute("t_region",t_region);
      model.addAttribute("t_region2",t_region2);
      model.addAttribute("t_region3",t_region3);      
      model.addAttribute("t_theater",t_theater);
      model.addAttribute("thbean",thbean);
      model.addAttribute("tbean",tbean);
      model.addAttribute("rlists",rlists);
      model.addAttribute("lists",lists);
      model.addAttribute("tb",tb);
      return getPage;
   }
   
}


//   d037c141a0bf3d1354b3664020d19979