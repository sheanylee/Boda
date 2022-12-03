package boda.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boda.member.model.MemberBean;
import boda.member.model.MemberDao;

@Controller
public class LoginController {
   private final String command1="login.bd";
   private final String getPage1="/login";
   
   private final String command2="findid.bd";
   private final String getPage2="/findid";
   
   private final String command3="findpw.bd";
   private final String getPage3="/findpw";
   
   private final String command4="join.bd";
   private final String getPage4="/join";
   
   private final String command5="join_proc.bd";
   
   private final String command6="login_proc.bd";
   private final String getPage6="redirect:/movie.look";
   
   private final String command7="findid_proc.bd";
   
   private final String command8="findpw_proc.bd";
   
   private final String logout="logout.bd";
   private final String gotoMain="redirect:/movie.look";
   
   @Autowired
   MemberDao memberDao;
   
   @RequestMapping(command1)
   public String login() {
      return getPage1;
   }
   @RequestMapping(command2)
   public String findid() {
      return getPage2;
   }
   @RequestMapping(command3)
   public String findpw() {
      return getPage3;
   }
   @RequestMapping(command4)
   public String join() {
      return getPage4;
   }
   
   @RequestMapping(command5)
   public String join_proc(@ModelAttribute("member") MemberBean mb,
         HttpServletResponse response) throws IOException {
      memberDao.insertMember(mb);
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer=response.getWriter();
      writer.println("<script> alert('회원가입 성공하였습니다!'); </script>");
      writer.flush();
      return getPage1;
   }
   
   @RequestMapping(command6)
   public String login_proc(@RequestParam("id") String id,
         @RequestParam("pw") String pw, HttpSession session,
         HttpServletResponse response) throws IOException {
      int cnt=-1;
      cnt=memberDao.logincheck(id,pw);
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer=null;
      if(cnt==1) {
         MemberBean mb=memberDao.getMemberById(id);
         session.setAttribute("loginInfo", mb);
         session.setMaxInactiveInterval(60*60) ; //가영 로그인 유지시간 설정.
         
         if(session.getAttribute("destination")!=null) {
            return (String)session.getAttribute("destination");
         }
         else {
            return getPage6;
            
         }
      }
      else {
         writer=response.getWriter();
         writer.println("<script> alert('아이디/비밀번호가 틀리거나 가입하지 않은 회원입니다.'); </script>");
         writer.flush();
         return getPage1;
      }
   }
   
   @RequestMapping(value=logout)
   public String logout(HttpSession session,HttpServletResponse response) throws IOException {
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer=response.getWriter();

      session.removeAttribute("loginInfo");
      writer.println("<script> alert('로그아웃 되었습니다.')</script>");
      writer.println("<script> location.href='movie.look' </script>");
      writer.flush();
      return null;
   }
   
   @RequestMapping(command7)
   public void findid(@RequestParam("name") String name,
         @RequestParam("ph0") String ph0,
         @RequestParam("ph1") String ph1,
         @RequestParam("ph2") String ph2,
         HttpServletResponse response) throws IOException {
      
      System.out.println("name:"+name);
      System.out.println("ph0:"+ph0);
      System.out.println("ph1:"+ph1);
      System.out.println("ph2:"+ph2);
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer=null;
      MemberBean mb=new MemberBean();
      mb.setName(name);
      mb.setPh0(ph0);
      mb.setPh1(ph1);
      mb.setPh2(ph2);
      
      MemberBean mbean=memberDao.FindId(mb);
      
      if(mbean !=null) {
         writer=response.getWriter();
         writer.println("<script> alert('찾으시는 아이디는 "+mbean.getId()+"입니다.'); </script>");
         writer.flush();
         writer.println("<script> location.href='login.bd' </script>");
         
      }
      
      else if(mbean==null) {
         writer=response.getWriter();
         writer.println("<script> alert('찾으시는 아이디가 없습니다.'); </script>");
         writer.flush();
         writer.println("<script> location.href='login.bd' </script>");
      }
   }//
   
   @RequestMapping(command8)
   public void login(@RequestParam("name") String name,
         @RequestParam("id") String id,
         @RequestParam("ph0") String ph0,
         @RequestParam("ph1") String ph1,
         @RequestParam("ph2") String ph2,
         HttpServletResponse response) throws IOException {
      
      System.out.println("name:"+name);
      System.out.println("ph0:"+ph0);
      System.out.println("ph1:"+ph1);
      System.out.println("ph2:"+ph2);
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer=null;
      MemberBean mb=new MemberBean();
      mb.setName(name);
      mb.setId(id);
      mb.setPh0(ph0);
      mb.setPh1(ph1);
      mb.setPh2(ph2);
      
      MemberBean mbean=memberDao.FindPw(mb);
      
      if(mbean !=null) {
         writer=response.getWriter();
         writer.println("<script> alert('찾으시는 비밀번호는 "+mbean.getPw()+"입니다.'); </script>");
         writer.flush();
         writer.println("<script> location.href='login.bd' </script>");
         
      }
      
      else if(mbean==null) {
         writer=response.getWriter();
         writer.println("<script> alert('찾으시는 비밀번호가 없습니다.'); </script>");
         writer.flush();
         writer.println("<script> location.href='login.bd' </script>");
      }
   }//
   
}