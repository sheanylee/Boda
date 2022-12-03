package review.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging_review;

@Component("ReviewDao")
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="review.ReviewBean";

	public int selectReviewCount(Map<String, String> map) {
		int result=sqlSessionTemplate.selectOne(namespace+".SelectReviewCount", map);
		System.out.println("selectReviewCount:"+result);
		return result;
	}

	public List<ReviewBean> selectReview(Paging_review pageInfo, Map<String, String> map) {

		List<ReviewBean> reviewList=new ArrayList<ReviewBean>();
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		reviewList=sqlSessionTemplate.selectList(namespace+".SelectReview", map, rowBounds);
		System.out.println("selectReview:"+reviewList.size());
		return reviewList;
		
	}

	public int insertReview(ReviewBean reviewBean) {
		int result=sqlSessionTemplate.insert(namespace+".InsertReview", reviewBean);
		System.out.println("insertReview:"+result);
		return result;
	}
	
	public int deleteReview(int r_num) {
		int result=sqlSessionTemplate.delete(namespace+".DeleteReview", r_num);
		System.out.println("deleteReview:"+result);
		return result;
	}
	
	public int getCountById(ReviewBean rebean) {
		int result=sqlSessionTemplate.selectOne(namespace+".CountReview", rebean);
		System.out.println("countReview:"+result);
		return result;
	}

	public double avgR_star(String r_movieName) {
	      double result;
	      if(sqlSessionTemplate.selectOne(namespace+".AvgR_star", r_movieName)==null) {
	         result=0;
	      }
	      else {
	         result=sqlSessionTemplate.selectOne(namespace+".AvgR_star", r_movieName);
	      }
	      return result;
	   }

	
}
