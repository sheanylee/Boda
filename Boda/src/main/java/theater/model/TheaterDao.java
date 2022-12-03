package theater.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import movie.model.MovieBean;
import time.model.TimeTableBean;
import utility.Paging;

@Component
public class TheaterDao {
	final String namespace="theater.model.Theater";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<TheaterBean> getTheater(Map<String, String> map) {
		List<TheaterBean>lists = sqlSessionTemplate.selectList(namespace+".GetTheater",map);
		return lists;
	}//getTheater

	public List<TheaterBean> getRegions() {
		List<TheaterBean>rlists = sqlSessionTemplate.selectList(namespace+".GetRegions");
		return rlists;
	}//getRegions

	public TheaterBean getInfoByregion(String t_theater) {
		TheaterBean tb = sqlSessionTemplate.selectOne(namespace+".GetInfoByregion",t_theater);
		return tb;
	}

	public TheaterBean getMax(String t_theater) {
		TheaterBean thbean = sqlSessionTemplate.selectOne(namespace+".GetMax",t_theater);
		return thbean;
	}

	public void insertTheater(TheaterBean tb) {
		int cnt = sqlSessionTemplate.insert(namespace+".InsertTheater",tb);
		System.out.println("insert="+cnt);
	}

	public List<TheaterBean> getAllTheater(Map<String, String> map, Paging pageInfo) {
		
		RowBounds rowb = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		System.out.println(pageInfo.getOffset()+"///"+pageInfo.getLimit());
		
		List<TheaterBean>lists = sqlSessionTemplate.selectList(namespace+".GetAllTheater",map,rowb);
		return lists;
	}

	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		System.out.println("totalCount = "+totalCount);
		return totalCount;
	}
	
	public int getTotalCountTimeTable(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".GetTotalCountTimeTable",map);
		System.out.println("totalCount = "+totalCount);
		return totalCount;
	}

	public TheaterBean getDetail(int t_num) {
		TheaterBean tb = sqlSessionTemplate.selectOne(namespace+".GetDetail",t_num);
		return tb;
	}

	public void deleteTheater(int t_num) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteTheater",t_num);
		System.out.println("delete="+cnt);
	}

	public void updateTheater(TheaterBean tb) {
		int cnt = sqlSessionTemplate.update(namespace+".UpdateTheater",tb);
		System.out.println("update="+cnt);
	}

	public List<TimeTableBean> getTableByTheater(TimeTableBean tt) {
		List<TimeTableBean> ttlists = sqlSessionTemplate.selectList(namespace+".GetTableByTheater",tt);
		System.out.println("ttlists:"+ttlists.size());
		return ttlists;
	}
	
	public List<TimeTableBean> getIndeTableByTheater(TimeTableBean tt) {
		List<TimeTableBean> indelists = sqlSessionTemplate.selectList(namespace+".GetIndeTableByTheater",tt);
		System.out.println("indelists:"+indelists.size());
		return indelists;
	}
	
	public List<TimeTableBean> getTimeTable(Map<String, String> map, Paging pageInfo) {
		RowBounds rowb = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		System.out.println(pageInfo.getOffset()+"/"+pageInfo.getLimit());
		
		List<TimeTableBean> lists = sqlSessionTemplate.selectList(namespace+".GetTimeTable",map,rowb);
		System.out.println("lists:"+lists.size());
		return lists;
	}

	public List<TheaterBean> getTheater() {
		List<TheaterBean>lists =sqlSessionTemplate.selectList(namespace+".GetTheater");
		return lists;
	}
	
	public List<MovieBean> getMovie() { 
		List<MovieBean> mlists  = sqlSessionTemplate.selectList(namespace+".GetMovie");
		return mlists;
	}

	public void insertTimeTable(TimeTableBean ttb) {
		int cnt = sqlSessionTemplate.insert(namespace+".InsertTimeTable",ttb);
		System.out.println("insert:"+cnt);
	}

	public void deleteTable(int num) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteTable",num);
		System.out.println("delete:"+cnt);
	}

	public List<TheaterBean> getCinemaByTheater(String theater) {
		List<TheaterBean> clists = sqlSessionTemplate.selectList(namespace+".GetCinemaByTheater",theater);
		return clists;
	}

	public TimeTableBean getTimeTableByNum(String num) {
		TimeTableBean tb = sqlSessionTemplate.selectOne(namespace+".GetTimeTableByNum",num);
		return tb;
	}

	public void updateTimeTable(TimeTableBean tb) {
		int cnt = sqlSessionTemplate.update(namespace+".UpdateTimeTable",tb);
		System.out.println("update = "+cnt);
		
	}
	
	public List<TimeTableBean> getTimeTableNum() {
  		List<TimeTableBean> lists = sqlSessionTemplate.selectList(namespace+".getTimeTableNum");
 	 	System.out.println("lists:"+lists.size());
 	 	return lists;
  	 }

	public TimeTableBean tableInsertCheck(Map<String, String> map) {
		TimeTableBean tb = sqlSessionTemplate.selectOne(namespace+".TableInsertCheck",map);
		return tb;
	}

	public List<TimeTableBean> GetTimeTableOfIndeMovie(Map<String, String> map, Paging pageInfo) {
		RowBounds rowb = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		System.out.println(pageInfo.getOffset()+"///"+pageInfo.getLimit());
		
		List<TimeTableBean> indelists = sqlSessionTemplate.selectList(namespace+".GetTimeTableOfIndeMovie",map,rowb);
		System.out.println("indelists:"+indelists.size());
		return indelists;
	}

	public TimeTableBean getTimeTableIndeByNum(String num) {
		TimeTableBean tb = sqlSessionTemplate.selectOne(namespace+".GetTimeTableIndeByNum",num);
		return tb;
	}

	public List<TimeTableBean> searchTimeDupl(Map<String, String> map) {
		List<TimeTableBean> timelists = sqlSessionTemplate.selectList(namespace+".SearchTimeDupl",map);
		return timelists;
	}
	//11-23
	public TheaterBean getIncome(String t_name) { //�����߰�
		TheaterBean theaterBean = sqlSessionTemplate.selectOne(namespace+".GetIncome",t_name);
		return theaterBean;
	}
	
	public List<TheaterBean> getVisitData(String day) {
		List<TheaterBean> vlist = sqlSessionTemplate.selectList(namespace+".GetVisitData",day);
		return vlist;
	}

	public List<TheaterBean> getReserveData(Map<String, Object> map) {
		List<TheaterBean> rlist = sqlSessionTemplate.selectList(namespace+".GetReserveData",map);
		return rlist;
	}

	
}
