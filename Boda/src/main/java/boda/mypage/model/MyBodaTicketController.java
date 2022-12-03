
package boda.mypage.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;

import boda.member.model.MemberBean; 
import order.model.OrderDao; 
import store.model.MyTicketBean; 
import store.model.MyTicketDao;

@Controller 
@ComponentScan({"order.*","store.*"})
	public class MyBodaTicketController { 
	private final String command="mybodaticket_list.bd"; //영화 관람권 관리 클릭 
	private final String getPage="/mypage/myticketList";

@Autowired 
OrderDao orderDao;

@Autowired 
MyTicketDao myticketDao;

@RequestMapping(command)
public String ticket_list(HttpSession session) {
	MemberBean mb=(MemberBean)session.getAttribute("loginInfo");
	List<MyTicketBean> myticket_lists=myticketDao.getAllData(mb.getId());
	session.setAttribute("myticket_lists", myticket_lists);

	int count1=myticketDao.getMyTicketCountById1(mb.getId()); 
	int count2=myticketDao.getMyTicketCountById2(mb.getId()); 
	int count3=myticketDao.getMyTicketCountById3(mb.getId()); 
	int myticket_count=count1+count2+count3;

	System.out.println("count1:"+count1); System.out.println("count2:"+count2);
	System.out.println("count3:"+count3);
	System.out.println("myticket_count:"+myticket_count);
	session.setAttribute("myticket_count", myticket_count);

	return getPage; 
}
}
