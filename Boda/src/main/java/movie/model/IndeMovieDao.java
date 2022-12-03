package movie.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("IndeMovieDao")
public class IndeMovieDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="movie.IndeMovieBean";

	public int selectTotalCount(Map<String, String> map) {
		int result=sqlSessionTemplate.selectOne(namespace+".SelectTotalCount", map);
		System.out.println("selectTotalCount:"+result);
		return result;
	}

	public List<IndeMovieBean> selectIndeMovie(Paging pageInfo, Map<String, String> map) {
		List<IndeMovieBean> indeMovieList=new ArrayList<IndeMovieBean>();
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		indeMovieList=sqlSessionTemplate.selectList(namespace+".SelectIndeMovie", map, rowBounds);
		System.out.println("selectBoxoffice:"+indeMovieList.size());
		return indeMovieList;
	}

	public int deleteIndeMovie(int num) {
		int result=sqlSessionTemplate.delete(namespace+".DeleteIndeMovie", num);
		System.out.println("deleteIndeMovie:"+result);
		return result;
	}

	public int insertIndeMovie(IndeMovieBean indeMovieBean) {
		int result=sqlSessionTemplate.insert(namespace+".InsertIndeMovie", indeMovieBean);
		System.out.println("insertMovie:"+result);
		return result;
	}

	public IndeMovieBean selectIndeMovieByNum(int num) {
		IndeMovieBean indeMovieBean=sqlSessionTemplate.selectOne(namespace+".SelectIndeMovieByNum", num);
		System.out.println(indeMovieBean);
		return indeMovieBean;
	}

	public int updateIndeMovie(IndeMovieBean indeMovieBean) {
		int result=sqlSessionTemplate.update(namespace+".UpdateIndeMovie", indeMovieBean);
		System.out.println("updateIndeMovie:"+result);
		return result;
	}

}