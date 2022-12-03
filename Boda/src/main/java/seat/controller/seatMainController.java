package seat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import boda.member.model.MemberBean;
import book.model.BookBean;
import seat.model.SeatBean;
import seat.model.SeatDao;
import time.model.TimeTableBean;

@Controller
public class seatMainController {
   private final String seatForm = "seatForm.se";
   private final String seatNo = "seat.se";
   private String getPage = "/seatForm";
   private String gotoFinalBook = "bookFinal.bk";
   int num;
   int r_price;
   TimeTableBean timeTableRecord;
   
   @Autowired
   SeatDao seatDao;

@RequestMapping(value=seatForm, method=RequestMethod.GET)
   public String seatForm(@RequestParam(value="mstart",required=false) String mstart, 
                  @RequestParam(value="mname",required=false) String mname,
                  @RequestParam(value="selectCn",required=false) String selectCn, 
                  @RequestParam(value="selectRg",required=false) String selectRg, 
                  @RequestParam(value="currentDate",required=false) String currentDate, 
                  @RequestParam(value="cinema",required=false) String cinema, 
                  @RequestParam(value="runtime",required=false) String runtime, 
                  @RequestParam(value="premium",required=false) String premium, 
                  Model model,
                  HttpSession session,
                  HttpServletResponse response) throws IOException {
     
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
      
            //�α��� �������� �α����ϰ� �ٽ� ���ƿͶ�
         if(session.getAttribute("loginInfo")==null) {
            writer.print("<script> alert('로그인 후 좌석 예약 가능합니다.')");
            writer.flush();
            //session.setMaxInactiveInterval(60*30);
            session.setAttribute("destination", "redirect:/booking.bk");
            writer.print("<script> location.href='login.bd' </script>"); 
            writer.flush();
            return null;
            
         }
         else {
            
            System.out.println("selectCn/cinema/currentDate/mstart/mname : " + selectCn+"/"+cinema +"/"+currentDate+"/"+mstart+"/"+mname);
            //Ÿ�����̺�������
             TimeTableBean tbean = new TimeTableBean(selectCn,cinema,currentDate,mstart,mname);
             num = seatDao.getTimeTableNum(tbean);
             System.out.println("num : " + num);
             
             //�¼����밡������ �󿵰��� �� �¼���
             timeTableRecord = new TimeTableBean(num,selectCn,cinema,currentDate,mstart,mname,runtime);
             String scode  = seatDao.getSeatCode(timeTableRecord.getTheater(),timeTableRecord.getCinema()); 
             System.out.println("seatcontroller seatForm getSeatCode return scode : " + scode);
         
             //����� �¼���ȣ ��������
             List<SeatBean> snoList = new ArrayList<SeatBean>();
             System.out.println("timetable num : " + num);
             snoList = seatDao.getReservationNum(num );//timetable num
             String snumber="";
             for(SeatBean sb : snoList) {
                snumber += sb.getSno() + "/";
             }
             model.addAttribute("snumber",snumber);
             model.addAttribute("premium",premium);
             model.addAttribute("snoList",snoList);
             model.addAttribute("scode",scode); 
             model.addAttribute("selectRg",selectRg); 
             model.addAttribute("timeTableRecord",timeTableRecord);
             return getPage;
             
         }

   }

   @RequestMapping(value=seatNo, method=RequestMethod.GET)
   public String seat(@RequestParam("checkedSeat") String checkedSeat,
                  @RequestParam("person") int person,
                  @RequestParam(value="adult", required=false) int adult,
                  @RequestParam(value="stud", required=false) int stud,
                  @RequestParam(value="old", required=false) int old,
                  @RequestParam("num") int num,
                  @RequestParam("theater") String theater,
                  @RequestParam("cinema") String cinema,
                  @RequestParam("day") String day,
                  @RequestParam("mstart") String mstart,
                  @RequestParam("mname") String mname,
                  @RequestParam("m_runtime") String m_runtime,
                  @RequestParam("selectRg") String selectRg,
                  @RequestParam("scode") String scode,
                  @RequestParam("premium") String premium,
                  Model model,
                  HttpSession session,
                  HttpServletResponse response) throws IOException {
   
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();

      System.out.println("checkedSeat : " + checkedSeat);
      System.out.println("num : " + num);
      System.out.println("day : " + day);
      System.out.println("theater : " + theater);
      System.out.println("scode : " + scode);
      System.out.println("premium : " + premium);
      //System.out.println("adult : "+adult);
      //System.out.println("stud : " + stud);
      //System.out.println("old : " + old);

      MemberBean loginMb = (MemberBean)session.getAttribute("loginInfo");
      //System.out.println("getName : " + loginMb.getName());
      System.out.println("getId : " + loginMb.getId());
      //System.out.println("getPw : " + loginMb.getPw());
      
      String[] sNo = checkedSeat.split(",");
   
      for(int i=0;i<sNo.length;i++) {
         
         String sno = sNo[i];
         System.out.println(sno);
         System.out.println(scode);
         
         System.out.println(num);
         SeatBean sb = new SeatBean(sno, Integer.parseInt(scode), 0, num);
         
         String status = seatDao.getStatus(sb);
         if(status == null) {
            seatDao.insertTnum(sb);
            status = seatDao.getStatus(sb);
         }
         //System.out.println("������ sno/status : " + sno + "/" + status);
         
         if(Integer.parseInt(status)==1) { 
            writer.print("<script>alert('"+sno+" 좌석은 이미 예약되었습니다</script>");
            writer.flush();
            System.out.println("1");
            model.addAttribute("scode",scode); //theater �� t_seat, seat �� scode
            model.addAttribute("premium",premium); //theater �� t_seat, seat �� scode
            model.addAttribute("selectRg",selectRg); 
            model.addAttribute("timeTableRecord",timeTableRecord);
            return getPage;
         }
         
      }
      System.out.println("2");
      model.addAttribute("tnum",num);
      model.addAttribute("premium",premium);
      model.addAttribute("checkedSeat",checkedSeat);
      model.addAttribute("scode",scode);
      model.addAttribute("person",person);
      model.addAttribute("mname",mname);
      model.addAttribute("theater",theater);
      model.addAttribute("cinema",cinema);
      model.addAttribute("day",day);
      model.addAttribute("mstart",mstart);
      model.addAttribute("adult",adult);
      model.addAttribute("stud",stud);
      model.addAttribute("old",old);
      return "redirect:/"+gotoFinalBook;
   }
         
   
}