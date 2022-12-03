package book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boda.member.model.MemberBean;
import book.model.BookBean;
import book.model.BookDao;
import time.model.TimeTableBean;

@Controller
public class BookDeleteController {

   private final String command = "bookDelete.bk";
   private String getPage = "redirect:/mybooklist.bd";
   
   @Autowired
   BookDao bookDao;
   
   @RequestMapping(value=command)
   public String delete(@RequestParam("r_num") int r_num,
                  @RequestParam("r_day") String r_day,
                  @RequestParam("r_mname") String r_mname,
                  @RequestParam("r_theater") String r_theater,
                  @RequestParam("r_cinema") int r_cinema,
                  @RequestParam("r_sno") String r_sno,
                  Model model, HttpSession session){
      System.out.println(r_num);
      System.out.println(r_day);
      System.out.println(r_mname);
      System.out.println(r_theater);
      System.out.println(r_cinema);
      System.out.println(r_sno);
      
      
      
      BookBean bb = new BookBean(r_num,r_mname,r_theater,r_cinema,r_day,r_sno);
      String tnum = bookDao.getTnum(bb);
      
      String[] rsno = r_sno.split(",");
      for(int i=0;i<rsno.length;i++) {
         System.out.println(rsno[i]);
         bookDao.cancelSeat(rsno[i],tnum);
      }
      
      String snoCount = String.valueOf(rsno.length);
      TimeTableBean tb = new TimeTableBean(r_theater,r_cinema,r_day,r_mname,snoCount);
      bookDao.resetSeatCount(tb);
      
      bookDao.deleteBook(r_num);
      
      MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
      String userId = mb.getId();
      
      model.addAttribute("userId",userId);
      return getPage;
   }
}