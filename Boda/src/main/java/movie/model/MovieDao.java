package movie.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("MovieDao")
public class MovieDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="movie.MovieBean";

	public int selectBoxofficeCount(Map<String, String> map) {
		int result=sqlSessionTemplate.selectOne(namespace+".SelectBoxofficeCount", map);
		System.out.println("selectBoxofficeCount:"+result);
		return result;
	}

	public int selectTotalCount(Map<String, String> map) {
		int result=sqlSessionTemplate.selectOne(namespace+".SelectTotalCount", map);
		System.out.println("selectTotalCount:"+result);
		return result;
	}


	public List<MovieBean> selectBoxoffice(Paging pageInfo, Map<String, String> map) {
		List<MovieBean> movieList=new ArrayList<MovieBean>();
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		movieList=sqlSessionTemplate.selectList(namespace+".SelectBoxoffice", map, rowBounds);
		System.out.println("selectBoxoffice:"+movieList.size());
		return movieList;
	}
	
	public List<MovieBean> selectMovie(Paging pageInfo, Map<String, String> map) {
		List<MovieBean> movieList=new ArrayList<MovieBean>();
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		movieList=sqlSessionTemplate.selectList(namespace+".SelectMovie", map, rowBounds);
		System.out.println("selectMovie:"+movieList.size());
		return movieList;
	}

	public MovieBean selectMovieDetail(int m_num) {
		MovieBean movieBean=sqlSessionTemplate.selectOne(namespace+".SelectMovieDetail", m_num);
		return movieBean;
	}

	public int insertMovie(MovieBean movieBean) {
		int result=sqlSessionTemplate.insert(namespace+".InsertMovie", movieBean);
		System.out.println("insertMovie:"+result);
		return result;
	}

	public int deleteMovie(int m_num) {
		int result=sqlSessionTemplate.delete(namespace+".DeleteMovie", m_num);
		System.out.println("deleteMovie:"+result);
		return result;
	}

	public int updateMovie(MovieBean movieBean) {
		int result=sqlSessionTemplate.update(namespace+".UpdateMovie", movieBean);
		System.out.println("updateMovie:"+result);
		return result;
	}

	public MovieBean selectMovieByM_num(int m_num) {
		MovieBean movieBean=sqlSessionTemplate.selectOne(namespace+".SelectMovieByM_num", m_num);
		return movieBean;
	}
	
	public int selectComingsoonCount(Map<String, String> map) {
		int result=sqlSessionTemplate.selectOne(namespace+".SelectComingsoonCount", map);
		System.out.println("selectComingsoonCount:"+result);
		return result;
	}

	public List<MovieBean> selectComingsoon(Paging pageInfo, Map<String, String> map) {
		List<MovieBean> movieList=new ArrayList<MovieBean>();
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		movieList=sqlSessionTemplate.selectList(namespace+".SelectComingsoon", map, rowBounds);
		System.out.println("selectComingsoon:"+movieList.size());
		return movieList;
	}
	
	//add
	public List<MovieBean> selectGenre(String genre) {
		List<MovieBean> mbList = new ArrayList<MovieBean>();
		mbList = sqlSessionTemplate.selectList(namespace+".selectGenre",genre);
		System.out.println("selectGenre : " + mbList.size());
		return mbList;
	}
	//add
	public List<IndeMovieBean> selectIndeMovieByGenre(String genre) {
		List<IndeMovieBean> imbList = new ArrayList<IndeMovieBean>();
		imbList = sqlSessionTemplate.selectList(namespace+".selectIndeMovieByGenre",genre);
		System.out.println("selectIndeMovieByGenre : " + imbList.size());
		return imbList;
	}
	
	//gayoung
	public List<IndeMovieBean> getIndeMovieList() { 
		List<IndeMovieBean> lists = sqlSessionTemplate.selectList(namespace+".GetIndeMovieList");
		return lists;
	}
	
	public IndeMovieBean getIndeMovieDetailByNum(int num) {
		IndeMovieBean ib = sqlSessionTemplate.selectOne(namespace+".GetIndeMovieDetailByNum",num);
		return ib;
	}
	
	public void likesPlusByNum(int num) {
		int cnt = sqlSessionTemplate.update(namespace+".LikesPlusByNum",num);
		System.out.println("likesUpdate="+cnt);
	}
	//
	//gayoung
	public List<IndeMovieBean> getMovie() {
		List<IndeMovieBean> indelists = sqlSessionTemplate.selectList(namespace+".GetMovie");
		return indelists;
		
	}

	public MovieBean findMnameByNum(String mname) {
		MovieBean mb = sqlSessionTemplate.selectOne(namespace+".FindMnameByNum",mname);
		return mb;
	}

	public String getMovieRuntime(String mname) {
		String cnt = sqlSessionTemplate.selectOne(namespace+".GetMovieRuntime",mname);
		System.out.println("runtime="+cnt);
		return cnt;
	}
	//
	public int selectEndMovieCount(Map<String, String> map) {
		int result=sqlSessionTemplate.selectOne(namespace+".SelectEndMovieCount", map);
		System.out.println("selectEndMovieCount:"+result);
		return result;
	}

	public List<MovieBean> selectEndMovie(Paging pageInfo, Map<String, String> map) {
		List<MovieBean> endMovieList=new ArrayList<MovieBean>();
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		endMovieList=sqlSessionTemplate.selectList(namespace+".SelectEndMovie", map, rowBounds);
		System.out.println("selectEndMovie:"+endMovieList.size());
		return endMovieList;
	}

	public int likeMovie(int m_num) {
		int result=sqlSessionTemplate.update(namespace+".LikeMovie", m_num);
		System.out.println("likeMovie:"+result);
		return result;
		
	}

	public int countLikeMovie(MovieBean movieBean) {
		int result=sqlSessionTemplate.selectOne(namespace+".CountLikeMovie", movieBean);
		System.out.println("countLikeMovie:"+result);
		return result;
	}

	public List<MovieBean> selectReopening() {
		List<MovieBean> reopeningMovieList=new ArrayList<MovieBean>();
		reopeningMovieList=sqlSessionTemplate.selectList(namespace+".SelectReopening");
		System.out.println("selectReopening:"+reopeningMovieList.size());
		return reopeningMovieList;
	}

	public String getMovieNum(String m_name) {
		String movieNum = sqlSessionTemplate.selectOne(namespace+".GetMovieNum",m_name);
		return movieNum;
	}
	

	//11-23 가영
	
	public void insertVisitorCount() { 
		int visitInsert = sqlSessionTemplate.insert(namespace+".InsertVisitorCount");
		System.out.println("visitInsert="+visitInsert);
	}

	public int getVisitorCountToday() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetVisitorCountToday");
		System.out.println("getVisitorCountToday="+cnt);
		return cnt;
	}

	public void updateTodayVisitorCount() {
		int visitUpdate = sqlSessionTemplate.update(namespace+".UpdateTodayVisitorCount");
		System.out.println("visitUpdate="+visitUpdate);
	}
	
}
