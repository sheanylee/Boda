package boda.member.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="member.model.Member";

	public int idCheck(String userid) {
		int cnt=-1;
		cnt=sqlSessionTemplate.selectOne(namespace+".IdCheck",userid);
		//0�̸� ��� ����, 1�̻��̸� ��� �Ұ�
		return cnt;
	}//

	public int logincheck(String id, String pw) {
		MemberBean mb = new MemberBean();
		mb.setId(id);
		mb.setPw(pw);
		int cnt=-1;
		cnt=sqlSessionTemplate.selectOne(namespace+".LoginCheck",mb);
		return cnt;
	}//

	public MemberBean getMemberById(String id) {
		MemberBean mb=sqlSessionTemplate.selectOne(namespace+".GetMemberById",id);
		return mb;
	}//

	public void insertMember(MemberBean mb) {
		sqlSessionTemplate.insert(namespace+".InsertMember",mb);
	}//

	public void updateMember(MemberBean mb) {
		sqlSessionTemplate.update(namespace+".UpdateMember",mb);
	}//

	public void deleteMember(String id) {
		sqlSessionTemplate.delete(namespace+".DeleteMember", id);
	}//

	public MemberBean FindId(MemberBean mb) {
		MemberBean mbean=null;
		mbean=sqlSessionTemplate.selectOne(namespace+".FindId",mb);
		return mbean;
	}//

	public MemberBean FindPw(MemberBean mb) {
		MemberBean mbean=null;
		mbean=sqlSessionTemplate.selectOne(namespace+".FindPw",mb);
		return mbean;
	}//

	public List<MemberBean> getAllMember() {
		List<MemberBean> mlists=sqlSessionTemplate.selectList(namespace+".GetAllMember");
		return mlists;
	}//

	public void updatePoint(String id, int point) {
		MemberBean mbean =new MemberBean();
		mbean.setId(id);
		mbean.setPoint(point);
		sqlSessionTemplate.update(namespace+".UpdatePoint",mbean);
	}//

	public void updateMemberNo(int no) {
		sqlSessionTemplate.update(namespace+".UpdateMemberNo",no);
	}//
	
	public int plusPointByRoulet(Map<String, String> map) { //가영 룰렛
		int cnt = sqlSessionTemplate.update(namespace+".PlusPointByRoulet",map);
		return cnt;
	}

	public String getPointByIdgainByRoulet(String userId) { //가영 룰렛 마이페이지 포인트 가져오기
		String plusPoint = sqlSessionTemplate.selectOne(namespace+".GetPointByIdgainByRoulet",userId);
		return plusPoint;
	}
	
	public int getPointById(String userId) {
	      int mypoint=sqlSessionTemplate.selectOne(namespace+".GetPointById",userId);
	      return mypoint;
	   }//

	
	
}
