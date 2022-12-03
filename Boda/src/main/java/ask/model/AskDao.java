package ask.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import movie.model.MovieBean;

@Component
public class AskDao {
	
	String namespace = "ask.model.AskBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return totalCount;
	}

	public List<AskBean> selectAsk(Map<String, String> map) {
		List<AskBean> lists = sqlSessionTemplate.selectList(namespace+".SelectAsk",map);
		return lists;
	}
	
	public List<AskBean> selectAsk2(Map<String, String> map) {
		List<AskBean> lists = sqlSessionTemplate.selectList(namespace+".SelectAsk2",map);
		return lists;
	}

	public int deleteAsk(int ask_num) {
		int result=sqlSessionTemplate.delete(namespace+".DeleteAsk", ask_num);
		System.out.println("deleteAsk:"+result);
		return result;
	}

	public int insertAsk(AskBean askBean) {
		int result=sqlSessionTemplate.insert(namespace+".InsertAsk", askBean);
		System.out.println("insertAsk:"+result);
		return result;
	}

	public AskBean selectAskByAsk_num(int ask_num) {
		AskBean askBean=sqlSessionTemplate.selectOne(namespace+".SelectAskByAsk_num", ask_num);
		return askBean;
	}

	public int updateAsk(AskBean askBean) {
		int result=sqlSessionTemplate.update(namespace+".UpdateAsk", askBean);
		System.out.println("updateAsk:"+result);
		return result;
	}


}
