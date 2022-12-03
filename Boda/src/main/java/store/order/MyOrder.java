package store.order;

import java.util.ArrayList;
import java.util.List;

import order.model.OrderBean;

public class MyOrder {
	private List<OrderBean> paylists=null;
	
	public MyOrder(){
		paylists=new ArrayList<OrderBean>();
	}
	
	public void addPayOrder(OrderBean ob) {
		paylists.add(ob);
	}
	
	public List<OrderBean> getPayOrder() {
		return paylists;
	}
}
