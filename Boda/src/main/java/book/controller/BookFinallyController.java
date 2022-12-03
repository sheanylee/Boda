package book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import boda.member.model.MemberBean;
import book.model.BookBean;
import book.model.BookDao;
import seat.model.SeatBean;
import store.model.MyTicketBean;
import store.model.MyTicketDao;

@Controller
public class BookFinallyController {
   private final String command = "bookFinal.bk";
   private final String ticket = "ticket.bk";
   private final String point = "point.bk";
   private String getPage = "/bookFinal";
   //private String gotoMainPage = "redirect:/movie.mv";
   int r_price;
   int r_point=0;
   String ticketDiscount="0";
   int pp=0;
   
   @Autowired
   BookDao bookDao;
   
   //open page
   @RequestMapping(value=command, method=RequestMethod.GET)
   public String bookFinal(@RequestParam(value="tnum") String tnum,
                       @RequestParam(value="scode") String scode,
                       @RequestParam(value="person") String person,
                       @RequestParam(value="mname") String mname,
                       @RequestParam(value="theater") String theater,
                       @RequestParam(value="cinema") String cinema,
                       @RequestParam(value="day") String day,
                       @RequestParam(value="mstart") String mstart,
                       @RequestParam(value="checkedSeat") String checkedSeat,
                       @RequestParam(value="premium") String premium,
                       @RequestParam(value="adult", required=false) String adult,
                       @RequestParam(value="stud", required=false) String stud,
                       @RequestParam(value="old", required=false) String old,
                       @RequestParam(value="point", required=false) String point,
                       @RequestParam(value="r_price", required=false) String r_price,
                       Model model, HttpSession session){
     session.removeAttribute("destination");
      
      //premium
      if(premium.equals("screenX")) {
         r_price = "14000";
      }
      else if(premium.equals("4DX")) {
         r_price = "16000";
      }
      else if(premium.equals("recline")) {
         r_price = "16000";
      }
      else {
         r_price = "10000";
      }
      
      //get point
      MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
      System.out.println("point : " + mb.getPoint());
      point = String.valueOf(mb.getPoint());
      
      //get ticket
      List<MyTicketBean> ticketList = new ArrayList<MyTicketBean>();
      ticketList = bookDao.getAllTicketById(mb.getId());
      System.out.println("ticketList size : " + ticketList.size());
      model.addAttribute("ticketList",ticketList);
     
      model.addAttribute("tnum",tnum);
      model.addAttribute("scode",scode);
      model.addAttribute("person",person);
      model.addAttribute("mname",mname);
      model.addAttribute("theater",theater);
      model.addAttribute("cinema",cinema);
      model.addAttribute("day",day);
      model.addAttribute("mstart",mstart);
      model.addAttribute("checkedSeat",checkedSeat);
      model.addAttribute("premium",premium);
      model.addAttribute("adult",adult);
      model.addAttribute("stud",stud);
      model.addAttribute("old",old);
      model.addAttribute("point",point);
      model.addAttribute("r_price",r_price);
      model.addAttribute("r_point",r_point);
      return getPage;
   }

   //use ticket
   @RequestMapping(value=ticket, method=RequestMethod.GET)
   public String ticket(@RequestParam(value="tnum") String tnum,
                       @RequestParam(value="scode") String scode,
                       @RequestParam(value="person") String person,
                       @RequestParam(value="mname") String mname,
                       @RequestParam(value="theater") String theater,
                       @RequestParam(value="cinema") String cinema,
                       @RequestParam(value="day") String day,
                       @RequestParam(value="mstart") String mstart,
                       @RequestParam(value="checkedSeat") String checkedSeat,
                       @RequestParam(value="premium") String premium,
                       @RequestParam(value="adult", required=false) String adult,
                       @RequestParam(value="stud", required=false) String stud,
                       @RequestParam(value="old", required=false) String old,
                       @RequestParam(value="point", required=false) String point,//ticket
                       @RequestParam(value="r_price", required=false) String r_price,//ticket
                       @RequestParam(value="usingticket", required=false) String usingticket,//ticket
                       @RequestParam(value="usingticketCount", required=false) String usingticketCount,//ticket
                       @RequestParam(value="ticketDiscount", required=false) String ticketDiscount,//ticket
                       @RequestParam(value="totalprice", required=false) String totalprice,//r_price-discountTicket
                       @RequestParam(value="rr_point", required=false) String rr_point,//usingpoint
                       @RequestParam(value="pp", required=false) String pd,//usingpoint
                       Model model, HttpSession session){

      r_point=0;
      ticketDiscount="0";

      System.out.println("usingticket : " + usingticket);
      System.out.println("usingticketCount : " + usingticketCount);

      //get point
      MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
      System.out.println("point : " + mb.getPoint());
      point = String.valueOf(mb.getPoint());
      
      //get ticket
      List<MyTicketBean> ticketList = new ArrayList<MyTicketBean>();
      ticketList = bookDao.getAllTicketById(mb.getId());
      System.out.println("ticketList size : " + ticketList.size());
      model.addAttribute("ticketList",ticketList);
      
      System.out.println("r_price : " + r_price);
      //price adjustment cased on ticket type
      if(usingticket.equals("일반 관람권")||usingticket.equals("골드 관람권")||usingticket.equals("프리미엄 관람권")) {
         System.out.println("usingticket : " + usingticket);
         System.out.println("usingticketCount : " + usingticketCount);
         
         if(usingticket.equals("일반 관람권")) {
            String abc = String.valueOf(10000 * Integer.parseInt(usingticketCount));
            ticketDiscount = abc;
         }
         else if(usingticket.equals("골드 관람권")) {
            ticketDiscount = String.valueOf(14000 * Integer.parseInt(usingticketCount));
         }
         else if(usingticket.equals("프리미엄 관람권")) {
            ticketDiscount = String.valueOf(16000 * Integer.parseInt(usingticketCount));
         }
         
         int rprice = Integer.parseInt(r_price);
         int stc = Integer.parseInt(usingticketCount);
         int td = Integer.parseInt(ticketDiscount);
         int rp_stc = rprice*stc;
         
          if(rp_stc < td) { 
             ticketDiscount = String.valueOf(rp_stc); 
          }
         
         
         System.out.println("ticketDiscount : " + ticketDiscount);
         model.addAttribute("usingticket",usingticket);
         model.addAttribute("usingticketCount",usingticketCount);
         
      }
      else {
         //personDiscount
         if(stud != null && old == null) {
            pp = (int)(Integer.parseInt(stud) * Integer.parseInt(r_price) * 0.2);
            model.addAttribute("pp",pp);
         }
         else if(stud == null && old != null) {
            pp = (int)(Integer.parseInt(old) * Integer.parseInt(r_price) * 0.2);;
            model.addAttribute("pp",pp);
         }
         else if(stud != null && old != null) {
            pp = (int)((Integer.parseInt(old)+Integer.parseInt(stud)) * Integer.parseInt(r_price) * 0.2);;
            model.addAttribute("pp",pp);
         }
      }
      
      if(rr_point != null) {
         model.addAttribute("r_point",rr_point);//usingpoint
      }
      else if(rr_point == null) {
         model.addAttribute("r_point",r_point);//usingpoint
      }
      
     model.addAttribute("ticketDiscount",ticketDiscount);
      model.addAttribute("tnum",tnum);
      model.addAttribute("scode",scode);
      model.addAttribute("person",person);
      model.addAttribute("mname",mname);
      model.addAttribute("theater",theater);
      model.addAttribute("cinema",cinema);
      model.addAttribute("day",day);
      model.addAttribute("mstart",mstart);
      model.addAttribute("checkedSeat",checkedSeat);
      model.addAttribute("premium",premium);
      model.addAttribute("point",point);
      model.addAttribute("r_price",r_price);
      model.addAttribute("adult",adult);
      model.addAttribute("stud",stud);
      model.addAttribute("old",old);
      return getPage;
   }
   
   //use point
   @RequestMapping(value=point, method=RequestMethod.GET)
   public String point(@RequestParam(value="tnum") String tnum,
                       @RequestParam(value="scode") String scode,
                       @RequestParam(value="person") String person,
                       @RequestParam(value="mname") String mname,
                       @RequestParam(value="theater") String theater,
                       @RequestParam(value="cinema") String cinema,
                       @RequestParam(value="day") String day,
                       @RequestParam(value="mstart") String mstart,
                       @RequestParam(value="checkedSeat") String checkedSeat,
                       @RequestParam(value="premium") String premium,
                       @RequestParam(value="adult", required=false) String adult,
                       @RequestParam(value="stud", required=false) String stud,
                       @RequestParam(value="old", required=false) String old,
                       @RequestParam(value="point", required=false) String point,//ticket
                       @RequestParam(value="r_price", required=false) String r_price,//ticket
                       @RequestParam(value="usingticket", required=false) String usingticket,//ticket
                       @RequestParam(value="usingticketCount", required=false) String usingticketCount,//ticket
                       @RequestParam(value="ticketDiscount", required=false) String ticketDiscount,//ticket
                       @RequestParam(value="totalprice", required=false) String totalprice,//r_price-discountTicket
                       @RequestParam(value="rr_point", required=false) String rr_point,//usingpoint
                       @RequestParam(value="pp", required=false) String pd,//usingpoint
                       Model model, HttpSession session){

      r_point=0;
   
      System.out.println("usingticket : " + usingticket);
      System.out.println("usingticketCount : " + usingticketCount);
      System.out.println("ticketDiscount : " + ticketDiscount);

      //get point
      MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
      System.out.println("point : " + mb.getPoint());
      point = String.valueOf(mb.getPoint());
      
      //get ticket
      List<MyTicketBean> ticketList = new ArrayList<MyTicketBean>();
      ticketList = bookDao.getAllTicketById(mb.getId());
      System.out.println("ticketList size : " + ticketList.size());
      model.addAttribute("ticketList",ticketList);
      
      //price adjustment cased on ticket type
      if(usingticket.equals("일반 관람권")||usingticket.equals("골드 관람권")||usingticket.equals("프리미엄 관람권")) {
         System.out.println("usingticket : " + usingticket);
         System.out.println("usingticketCount : " + usingticketCount);
         
         if(usingticket.equals("일반 관람권")) {
            String abc = String.valueOf(10000 * Integer.parseInt(usingticketCount));
            ticketDiscount = abc;
         }
         else if(usingticket.equals("골드 관람권")) {
            String abc = String.valueOf(14000 * Integer.parseInt(usingticketCount));
            ticketDiscount = abc;
         }
         else if(usingticket.equals("프리미엄 관람권")) {
            String abc = String.valueOf(16000 * Integer.parseInt(usingticketCount));
            ticketDiscount = abc;
         }
         
         int rprice = Integer.parseInt(r_price);
         int stc = Integer.parseInt(usingticketCount);
         int td = Integer.parseInt(ticketDiscount);
         int rp_stc = rprice*stc;
         
          if(rp_stc < td) { 
             ticketDiscount = String.valueOf(rp_stc); 
          }
         
         System.out.println("ticketDiscount : " + ticketDiscount);
         model.addAttribute("usingticket",usingticket);
         model.addAttribute("usingticketCount",usingticketCount);
         
      }
      else {
         //personDiscount
         if(stud != null && old == null) {
            pp = (int)(Integer.parseInt(stud) * Integer.parseInt(r_price) * 0.2);
            model.addAttribute("pp",pp);
         }
         else if(stud == null && old != null) {
            pp = (int)(Integer.parseInt(old) * Integer.parseInt(r_price) * 0.2);;
            model.addAttribute("pp",pp);
         }
         else if(stud != null && old != null) {
            pp = (int)((Integer.parseInt(old)+Integer.parseInt(stud)) * Integer.parseInt(r_price) * 0.2);;
            model.addAttribute("pp",pp);
         }
      }
      
      if(rr_point != null) {
         model.addAttribute("r_point",rr_point);//usingpoint
      }
      else if(rr_point == null) {
         model.addAttribute("r_point",r_point);//usingpoint
      }
      
     model.addAttribute("ticketDiscount",ticketDiscount);
      model.addAttribute("tnum",tnum);
      model.addAttribute("scode",scode);
      model.addAttribute("person",person);
      model.addAttribute("mname",mname);
      model.addAttribute("theater",theater);
      model.addAttribute("cinema",cinema);
      model.addAttribute("day",day);
      model.addAttribute("mstart",mstart);
      model.addAttribute("checkedSeat",checkedSeat);
      model.addAttribute("premium",premium);
      model.addAttribute("point",point);
      model.addAttribute("r_price",r_price);
      model.addAttribute("adult",adult);
      model.addAttribute("stud",stud);
      model.addAttribute("old",old);
      return getPage;
   }
   
   @RequestMapping(value=command, method=RequestMethod.POST)
   public String bookFinal(BookBean bbean,
                     @RequestParam(value="tnum") String tnum,
                     @RequestParam(value="scode") String scode,
                     @RequestParam(value="person") String person,
                     @RequestParam(value="point") int point,
                     @RequestParam(value="totalPrice") int totalPrice,
                     @RequestParam(value="usingticket",required=false) String usingticket,
                     @RequestParam(value="usingticketCount",required=false) String usingticketCount,
                     Model model,
                     HttpServletResponse response) throws IOException {
      
      System.out.println("bookFinal post paying : " + bbean.getR_paying());
      System.out.println("bookFinal post getR_point : " + bbean.getR_point());
      System.out.println("totalPrice : " + totalPrice);
      System.out.println("usingticket : " + usingticket);
      System.out.println("usingticketCount : " + usingticketCount);
      
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
      
      String[] sNo = bbean.getR_sno().split(",");
      String sno;
      String userno = bbean.getR_userId();
      
      //SeatDao sd;
      for(int i=0;i<sNo.length;i++) {
         sno = sNo[i];
         //System.out.println(sno);
        // System.out.println(Integer.parseInt(scode));
        // System.out.println(userno);
        // System.out.println(Integer.parseInt(tnum));
         SeatBean sb = new SeatBean(sno, Integer.parseInt(scode), userno, 0, Integer.parseInt(tnum));
         //seatDao = new SeatDao();
         bookDao.UpdateSeat(sb);
      } //reservation seat
   
      Date now = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      String r_reserDay = sdf.format(now);
      
      
    //input reservation DB
      BookBean bb = new BookBean(0,bbean.getR_userId(),totalPrice,
            r_reserDay,bbean.getR_mname(),bbean.getR_theater(),
            bbean.getR_cinema(),bbean.getR_day(),bbean.getR_mstart(),
            bbean.getR_sno(),bbean.getR_paying(),bbean.getR_point(),
            usingticket+"/"+usingticketCount);
      
      int cnt = bookDao.insertBookData(bb); 
      System.out.println("insert success : " + cnt);
      
    //minus point
      Map<String, String> map = new HashMap<String, String>();
      map.put("r_point", String.valueOf(bbean.getR_point()));
      map.put("id", bbean.getR_userId());
      bookDao.updatePoint(map); 
    
    //minus ticket
      if(usingticket != "") {
         System.out.println("usingticket/usingticketCount : " + usingticket + "/" + usingticketCount);
         MyTicketBean mt = new MyTicketBean(bbean.getR_userId(),usingticket,Integer.parseInt(usingticketCount));
          bookDao.updateTicket(mt);
      }
    //fresh ticket
     bookDao.refreshTicket(bbean.getR_userId());
      
    //minus seat count 
      System.out.println("tnum/person : "+tnum+"/"+person);
      Map<String,String> map2 = new HashMap<String,String>();
      map2.put("tnum", tnum);
      map2.put("person", person);
      int bookingseat = bookDao.insertBookingSeatCount(map2); 
      System.out.println("bookingseat : " +bookingseat);
      
      if(cnt>=1) {
    	  writer.print("<script> alert('예약 완료') </script>");
         writer.print("<script> location.href='movie.look' </script>");
         writer.flush();
         
      }
      else {
    	  writer.print("<script> alert('예약 실패') </script>");
         writer.print("<script> location.href='/bookFinal' </script>");
         writer.flush();
      }
      return null;
   }
}