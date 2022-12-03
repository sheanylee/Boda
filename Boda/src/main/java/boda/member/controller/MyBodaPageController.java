package boda.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boda.member.model.D_MemberBean;
import boda.member.model.D_MemberDao;
import boda.member.model.MemberBean;
import boda.member.model.MemberDao;
import look.model.LookBean;
import look.model.LookDao;
import store.model.MyTicketDao;

@Controller
@ComponentScan("look.*")
public class MyBodaPageController {
	private final String command1="myBodapage.bd";
	private final String getPage1="/mypage/myBodapage";
	
	private final String command2="modify_member.bd";
	private final String getPage2="/mypage/mypage_pw_confirm";
	
	private final String command3="pw_confirm_proc.bd";
	
	private final String getPage3="/mypage/mypage_modify"; 
	
	private final String command4="modify_member_proc.bd";
	
	private final String command5="delete_member_pw_confirm.bd"; 
	private final String getPage4="/mypage/mypage_delete_pw_confirm";
	
	private final String command6="delete_member.bd"; 
	
	private final String command8="myboard.bd"; 
	private final String getPage5="/mypage/myboard"; 
	
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	D_MemberDao d_memberDao;
	
	@Autowired
	LookDao lookDao;
	
	@Autowired
	MyTicketDao myticketDao;
	
	@RequestMapping(command1) 
	   public String mypage(@RequestParam(required=false) String userId, Model model, HttpSession session) {
	      System.out.println("userId="+userId);
	      MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
	      userId = mb.getId();
	      if(userId != null) {
	         String plusPoint = memberDao.getPointByIdgainByRoulet(userId);
	         model.addAttribute("plusPoint",plusPoint);
	      }
	      int count=myticketDao.getMyTicketCountById(userId);
	      session.setAttribute("Myticket_count", count);
	      
	      int mypoint=memberDao.getPointById(userId);
	      session.setAttribute("Mypoint", mypoint);
	      session.removeAttribute("destination");
	      return getPage1;
	   }

	@RequestMapping(command2)
	public String mypage_modify() {
		return getPage2;
	}
	
	@RequestMapping(command3)
	public String mypage_pw_confirm_proc(@RequestParam("pw_confirm") String pw_confirm,
			HttpSession session,HttpServletResponse response) throws IOException {
		MemberBean mb=(MemberBean)session.getAttribute("loginInfo");
		if(mb.getPw().equals(pw_confirm)) {
			return getPage3;
		}
		else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script> alert('비밀번호가 맞지 않습니다.'); </script>");
			writer.flush();
			return getPage2;
		}
	}//
	
	@RequestMapping(command4)
	public void mypage_modify_proc(MemberBean mb,HttpServletResponse response) throws IOException {
		memberDao.updateMember(mb);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script> alert('회원 정보가 변경되었습니다.'); </script>");
		writer.flush();
		writer.println("<script> location.href='myBodapage.bd' </script>");
	}//
	
	@RequestMapping(command5)
	public String mypage_delete_pw_confirm(HttpSession session) {
		MemberBean mb=(MemberBean)session.getAttribute("loginInfo");
		return getPage4;
	}
	
	@RequestMapping(command6)
	public String mypage_delete_member(@RequestParam("pw_confirm") String pw_confirm,HttpSession session,
			HttpServletResponse response) throws IOException {
		
		MemberBean mb=(MemberBean)session.getAttribute("loginInfo");
		if(mb.getPw().equals(pw_confirm)) {
			d_memberDao.insertData(mb); 
			List<D_MemberBean> dlists=d_memberDao.getAllData();
			session.setAttribute("dlists", dlists); 
			System.out.println("dlists size:"+dlists.size());
			memberDao.deleteMember(mb.getId());
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script> alert('"+mb.getName()+"님 회원 탈퇴되었습니다. 로그인 화면으로 이동합니다.'); </script>");
			writer.flush();
			writer.println("<script> location.href='login.bd' </script>");
			return null;
		}
		else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script> alert('비밀번호가 맞지 않습니다.'); </script>");
			writer.flush();
			return getPage4;
		}
	}
	
	@RequestMapping(command8) 
	public String myboard(HttpSession session) {
		MemberBean mb=(MemberBean)session.getAttribute("loginInfo");
		List<LookBean> board_lists=lookDao.getBoardById(mb.getId());
		session.setAttribute("board_lists", board_lists);
		return getPage5;
	}
}
