package look.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class LookDao {
	String namespace = "look.model.LookBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getArticleCount() {
		int count = sqlSessionTemplate.selectOne(namespace+".GetArticleCount");
		return count;
	}

	public List<LookBean> getArticles(Paging pageInfo, Map<String, String> map) {
		
		RowBounds row = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());

		List<LookBean> lists = sqlSessionTemplate.selectList(namespace+".GetArticles",map,row);
		return lists;
	}

	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return totalCount;
	}

	public void insertLook(LookBean lbean) {
		int insert = sqlSessionTemplate.insert(namespace+".InsertLook",lbean);
		System.out.println("insert="+insert);
	}

	public LookBean getByNum(int num) {
		LookBean lb = sqlSessionTemplate.selectOne(namespace+".GetByNum",num);
		return lb;
	}

	public void deleteLook(int num) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteLook",num);
		System.out.println("delete = "+cnt);
	}

	public void updateLook(LookBean lb) {
		int cnt = sqlSessionTemplate.update(namespace+".UpdateLook",lb);
		System.out.println("update = "+cnt);
	}

	public void plusReadCount(int num, int readcount) {
		LookBean lb = new LookBean();
		lb.setNum(num);
		lb.setReadcount(readcount);
		int cnt = sqlSessionTemplate.update(namespace+".PlusReadCount",lb);
		System.out.println("plusReadCount = "+cnt);
	}

	public void repleUpdate(LookBean lb) {
		int cnt = sqlSessionTemplate.update(namespace+".RepleUpdate",lb);
		System.out.println("repleUpdate = "+cnt);
		
	}

	public void repleInsert(LookBean lb) {
		int cnt = sqlSessionTemplate.insert(namespace+".RepleInsert",lb);
		System.out.println("repleInsert = "+cnt);
	}

	public List<LookBean> getBoardById(String id) {
		List<LookBean> board_lists=sqlSessionTemplate.selectList(namespace+".GetBoardById",id);
		return board_lists;
	}//
	
}
