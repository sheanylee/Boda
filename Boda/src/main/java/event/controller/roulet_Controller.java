package event.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boda.member.model.MemberBean;
import boda.member.model.MemberDao;

@Controller
public class roulet_Controller {
   final String command = "roulet.et";
   String getPage = "/roultEvent";

   @Autowired
   MemberDao mdao;

   @RequestMapping(command)
   public String roulet(@RequestParam(required=false) String userId,@RequestParam(required = false) String gain, HttpSession session, HttpServletResponse response) throws IOException  {

      MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
      
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
      
       if(mb==null) {
    	    writer.print("<script> alert('Boda회원만 참여 가능합니다.'); </script>");
            writer.flush();
            session.setAttribute("destination", "redirect:roulet.et");
            writer.print("<script> location.href='login.bd' </script>"); 
            writer.flush();
            return null;
            
         }
       else {
          System.out.println("userId="+mb.getId());
          userId = mb.getId();
          System.out.println("gain="+gain);
          if(gain == null|| gain.equals("다음기회에")) {
            return getPage;
          }

         if(gain != null) {
            //young - roulet point plus
   
            if(userId != null && gain != null) {
               System.out.println("gain="+gain);
               int kor = gain.indexOf("포");
               System.out.println(kor);
   
   
               String point = gain.substring(0,kor);
               System.out.println("aaa:"+point);
   
               Map<String,String>map = new HashMap<String,String>();
               map.put("point", point);
               map.put("id", userId);
   
               int cnt = mdao.plusPointByRoulet(map);
               System.out.println("pointUpdate="+cnt);
               
               return "redirect:myBodapage.bd";
            }
         }
       }
      return getPage;

   }
}