package store.cart;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class MyCart {
	private Map<Integer,Integer> orderlists=null; //��ǰ��ȣ(key), �ֹ�����(value)
	
	public MyCart() {
	      orderlists=new ConcurrentHashMap<Integer,Integer>();
	   } 
	
	public void addCart(int pnum, int oqty) {
		if(orderlists.containsKey(pnum)) { //��ٱ��Ͽ� ������ ����
			int orgqty=orderlists.get(pnum); //value return
			orderlists.put(pnum, orgqty+oqty);
		}
		else { //��ٱ��Ͽ� ������ ���� �߰�
			orderlists.put(pnum, oqty);		
		}
	}

	public Map<Integer, Integer> getAllOrderLists() {
		return orderlists;
	}
}
