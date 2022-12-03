package store.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import store.model.StoreBean;
import store.model.StoreDao;

@Controller
public class DirectBuyController {
   private final String command="direct_buy.st"; 
   private final String getPage="/store_direct_bill";
   
   private final String command2="gift.st"; 
   private final String getPage2="/gift";

   @Autowired
   StoreDao storeDao;

   @RequestMapping(command)
   public String direct_buy(@RequestParam("s_num") int s_num,
         @RequestParam(value="order",required = false) int order,
         @RequestParam(value="id",required = false) String id, 
         HttpSession session, HttpServletResponse response) throws IOException {
	  
	  response.setContentType("text/html; charset=UTF-8");
	  PrintWriter writer=response.getWriter();
	   
      if(session.getAttribute("loginInfo")==null) { 
         session.setAttribute("destination", "redirect:/detail.st?s_num="+s_num);
         writer.println("<script> alert('로그인 후 이용 가능합니다.'); </script>");
	     writer.println("<script> location.href='login.bd' </script>");
	     writer.flush();
         return null;
      }
      else {
         if(id!=null) {
            session.setAttribute("gift_id", id); 
            session.setAttribute("gift_s_num", s_num);
            session.setAttribute("gift_order", order);
         }
         
         if(session.getAttribute("direct_buy_sb")!=null) {
            session.removeAttribute("direct_buy_sb");
            session.removeAttribute("order");
         }
         StoreBean sb=storeDao.getStoreByS_num(s_num);
         session.setAttribute("direct_buy_sb", sb);
         session.setAttribute("order", order);

         return getPage;
      }
   }//
   
   @RequestMapping(command2)
   public String gift(@RequestParam("s_num") int s_num,
         @RequestParam(value="order",required = false) int gift_order,
         HttpSession session, Model model, HttpServletResponse response) throws IOException {
	   
	  response.setContentType("text/html; charset=UTF-8");
	  PrintWriter writer=response.getWriter();
      
      if(session.getAttribute("loginInfo")==null) { 
         session.setAttribute("destination", "redirect:/detail.st?s_num="+s_num);
         writer.println("<script> alert('로그인 후 이용 가능합니다.'); </script>");
	     writer.println("<script> location.href='login.bd' </script>");
	     writer.flush();
         return null;
      }
      StoreBean sb=storeDao.getStoreByS_num(s_num);
      model.addAttribute("sb", sb);
      model.addAttribute("gift_order", gift_order);
      return getPage2;
   }
}