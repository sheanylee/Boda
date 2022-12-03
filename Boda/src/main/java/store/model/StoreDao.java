package store.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StoreDao {
	@Autowired
	SqlSessionTemplate SqlSessionTemplate;
	
	private String namespace="store.model.Store";

	public List<StoreBean> getAllStore_ticket() {
		List<StoreBean> lists=new ArrayList<StoreBean>();
		lists=SqlSessionTemplate.selectList(namespace+".GetAllStoreticket");
		System.out.println("Dao에서 영화관람권 갯수:"+lists.size());
		return lists;
	}//

	public List<StoreBean> getAllStore_popcorn() {
		List<StoreBean> lists=new ArrayList<StoreBean>();
		lists=SqlSessionTemplate.selectList(namespace+".GetAllStorepopcorn");
		return lists;
	}//

	public List<StoreBean> getAllStore_beverage() {
		List<StoreBean> lists=new ArrayList<StoreBean>();
		lists=SqlSessionTemplate.selectList(namespace+".GetAllStorebeverage");
		return lists;
	}//

	public List<StoreBean> getAllStore_snak() {
		List<StoreBean> lists=new ArrayList<StoreBean>();
		lists=SqlSessionTemplate.selectList(namespace+".GetAllStoresnak");
		return lists;
	}//

	public StoreBean getStoreByS_num(int x) {
		StoreBean sb=SqlSessionTemplate.selectOne(namespace+".GetStoreByS_num",x);
		return sb;
	}//

	public void insertStore(StoreBean store) {
		System.out.println("넘어온 코드값:"+store.getS_code());
		SqlSessionTemplate.insert(namespace+".InsertStore",store);
	}//

	public void updateStore(StoreBean store) {
		SqlSessionTemplate.update(namespace+".UpdateStore",store);
	}//

	public void deleteStore(int s_num) {
		SqlSessionTemplate.delete(namespace+".DeleteStore",s_num);
	}//
	
}
