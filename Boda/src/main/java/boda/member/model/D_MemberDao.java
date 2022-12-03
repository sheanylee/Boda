package boda.member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class D_MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="member.model.D_Member";

	public void insertData(MemberBean mb) {
		sqlSessionTemplate.insert(namespace+".InsertData",mb);
	}//

	public List<D_MemberBean> getAllData() {
		List<D_MemberBean> dlists=sqlSessionTemplate.selectList(namespace+".GetAllData");
		return dlists;
	}//

}
