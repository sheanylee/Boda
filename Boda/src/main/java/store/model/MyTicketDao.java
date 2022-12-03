package store.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import boda.member.model.MemberBean;
import order.model.OrderBean;

@Component
public class MyTicketDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	HttpSession session;
	
	private String namespace="store.model.MyTicket";

	public List<MyTicketBean> getAllData(String id) {
		List<MyTicketBean> myticket_lists=sqlSessionTemplate.selectList(namespace+".GetAllData",id);
		return myticket_lists;
	}//
	
	
	public void insertData(OrderBean ob) {
		List<MyTicketBean> myticket_lists=getAllData(ob.getO_id());
		MemberBean mb=(MemberBean)session.getAttribute("loginInfo");
		boolean flag=false;
		for(MyTicketBean mbean :myticket_lists) {
			if(ob.getO_name().equals(mbean.getT_spec())) {
				MyTicketBean mtb=new MyTicketBean();
				mtb.setT_id(mb.getId());
				mtb.setT_spec(ob.getO_name());
				mtb.setT_order(mbean.getT_order()+ob.getO_order());
				sqlSessionTemplate.update(namespace+".UpdateData",mtb);
				flag=true;
			}
		}
		if(flag==false) {
			sqlSessionTemplate.insert(namespace+".InsertData",ob);
		}
		flag=false;
	}//


	public int getMyTicketCountById1(String id) {
		int count1 = 0;
		if(sqlSessionTemplate.selectOne(namespace+".GetMyTicketCountById1",id)!=null) {
			count1=sqlSessionTemplate.selectOne(namespace+".GetMyTicketCountById1",id);
		}
		return count1;
	}//
	public int getMyTicketCountById2(String id) {
		int count1 = 0;
		if(sqlSessionTemplate.selectOne(namespace+".GetMyTicketCountById2",id)!=null) {
			count1=sqlSessionTemplate.selectOne(namespace+".GetMyTicketCountById2",id);
		}
		return count1;
	}//
	public int getMyTicketCountById3(String id) {
		int count1 = 0;
		if(sqlSessionTemplate.selectOne(namespace+".GetMyTicketCountById3",id)!=null) {
			count1=sqlSessionTemplate.selectOne(namespace+".GetMyTicketCountById3",id);
		}
		return count1;
	}//
	
	public int getMyTicketCountById(String userId) {
        int count;
        if(sqlSessionTemplate.selectOne(namespace+".GetMyTicketCountById",userId)==null) {
           count=0;
        }
        else {
           count=sqlSessionTemplate.selectOne(namespace+".GetMyTicketCountById",userId);
        }
        return count;
	}//
	
	public void gift(MyTicketBean mbean) {
	      if(sqlSessionTemplate.selectOne(namespace+".GetT_Order",mbean)==null) {
	         sqlSessionTemplate.insert(namespace+".InsertMyTicekt",mbean);
	      }
	      else {
	         sqlSessionTemplate.update(namespace+".UpdatePlus",mbean);
	      }
	   }//
}
