package store.cart;

import java.util.ArrayList;

import order.model.OrderBean;

public class MyTicket {
	private ArrayList<OrderBean> ticket_lists;
	
	public MyTicket() {
		ticket_lists=new ArrayList<OrderBean>();
	}
	
	public void addMyTicket1(OrderBean ob) {
		for(OrderBean obean:ticket_lists) {
			if(obean.getS_num()==ob.getS_num()) { //���� ������ ��ǰ���̸�
				int origin=obean.getO_order();
				obean.setO_order(origin+ob.getO_order()); //���� ����
			}
		}
		ticket_lists.add(ob);
	}//

	public void addMyTicket2(OrderBean ob) {
		for(OrderBean obean:ticket_lists) {
			if(obean.getS_num()==ob.getS_num()) { //���� ������ ��ǰ���̸�
				int origin=obean.getO_order();
				obean.setO_order(origin+ob.getO_order()); //���� ����
			}
		}
		ticket_lists.add(ob);
	}//

	public void addMyTicket3(OrderBean ob) {
		for(OrderBean obean:ticket_lists) {
			if(obean.getS_num()==ob.getS_num()) { //���� ������ ��ǰ���̸�
				int origin=obean.getO_order();
				obean.setO_order(origin+ob.getO_order()); //���� ����
			}
		}
		ticket_lists.add(ob);
	}
	
	public ArrayList<OrderBean> getAllMyTicket() {
		return ticket_lists;
	}//
	
}
