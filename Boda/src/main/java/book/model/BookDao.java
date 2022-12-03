package book.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import seat.model.SeatBean;
import store.model.MyTicketBean;
import theater.model.TheaterBean;
import time.model.TimeTableBean;
import utility.Paging;

@Component
public class BookDao {
   private final String namespace="book.model.BookBean";

   @Autowired
   SqlSessionTemplate sqlSessionTemplate;


   public List<TimeTableBean> getAllMovieForBooking(String currentDate) { //占쏙옙화占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 
      System.out.println("currentday : " + currentDate);
      List<TimeTableBean> lists = sqlSessionTemplate.selectList(namespace+".getAllMovieForBooking",currentDate);
      System.out.println("getAllMovieForBooking lists size : " + lists.size());
      return lists;
   }

   public List<TheaterBean> getRegionList(String mname) { //占쏙옙화占쏙옙 클占쏙옙占싹몌옙 占쏙옙占쏙옙占쏙옙 占쏙옙占 , 타占쏙옙占쏙옙占싱븝옙占  占쏙옙占쏙옙 占쏙옙占싱븝옙 占쏙옙占쏙옙占십울옙
      List<TheaterBean> getRegionList = sqlSessionTemplate.selectList(namespace+".getRegionList",mname);
      System.out.println("getRegionList size : " + getRegionList.size());
      return getRegionList;
   }

   public List<TheaterBean> getAllTheaterForBooking(Map<String, String> map) {
      System.out.println("map : " + map.get("selectRg") + "/" + map.get("mname"));
      List<TheaterBean>lists = sqlSessionTemplate.selectList(namespace+".getAllTheaterForBooking",map);
      System.out.println("getAllTheaterForBooking lists size : " + lists.size());
      return lists;
   }

   public List<TimeTableBean> getAllTimeTableForBooking(TimeTableBean tbean) { 
      List<TimeTableBean> TimeTableLists =sqlSessionTemplate.selectList(namespace+".getAllTimeTableForBooking",tbean);
      System.out.println("getAllTimeTableForBooking TimeTableLists size : " + TimeTableLists.size());
      return TimeTableLists;
   }


   public void UpdateSeat(SeatBean sb) {
      System.out.println(sb.getUserNo());
      int cnt = sqlSessionTemplate.update(namespace+".UpdateSeat",sb);
      System.out.println("UpdateSeat cnt : " + cnt);
   }


   public int insertBookData(BookBean bb) {

      int cnt = sqlSessionTemplate.insert(namespace+".insertBookData",bb);
      System.out.println("insertBookData cnt 1 : " + cnt);
      return cnt;
   }

   public List<BookBean> getMyBookingList(String userId) {
      List<BookBean> lists = sqlSessionTemplate.selectList(namespace+".GetMyBookingList",userId);
      System.out.println("listssize="+lists.size());
      return lists;
   }
   public List<BookBean> GetMyIndeBookingList(String userId) {
      List<BookBean> lists = sqlSessionTemplate.selectList(namespace+".GetMyIndeBookingList",userId);
      System.out.println("listssize="+lists.size());
      return lists;
   }

   public int getAllBookingListTotalCount(Map<String, String> map) { //占쏙옙占썅리占쏙옙트占쏙옙 占쏙옙 카占쏙옙트 占쏙옙占쏙옙占쏙옙占쏙옙
      int totalCount = sqlSessionTemplate.selectOne(namespace+".getAllBookingListTotalCount",map);
      System.out.println("bookdao getAllBookingListTotalCount totalcount : " + totalCount);
      return totalCount;
   }

   public List<BookBean> getAllBookingList(Map<String, String> map, Paging pageInfo) { //占쏙옙占쏙옙占쌘곤옙 占쏙옙占  占쏙옙占썅리占쏙옙트占쏙옙 占쏙옙 占쏙옙 占쌍듸옙占쏙옙 占쏙옙渶뱄옙湄占쏙옙占쏙옙
      RowBounds rowBound = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
      List<BookBean> lists = new ArrayList<BookBean>();
      lists = sqlSessionTemplate.selectList(namespace+".getAllBookingList", map, rowBound);
      System.out.println("getAllBookingList lists size : " + lists.size());
      return lists;
   }

   public int insertBookingSeatCount(Map<String, String> map) {
      int cnt = sqlSessionTemplate.update(namespace+".insertBookingSeatCount", map);
      System.out.println("insertBookingSeatCount cnt : " + cnt);
      return cnt;
   }


   public TheaterBean getPremium(Map<String, String> map) {
      TheaterBean tb = sqlSessionTemplate.selectOne(namespace+".getPremium", map);
      System.out.println("getPremium getT_premium : " + tb.getT_premium());
      return tb;
   }//추가

   public void updatePoint(Map<String, String> map) {
      int cnt = sqlSessionTemplate.update(namespace+".updatePoint",map);
      System.out.println("update Point cnt : " + cnt);
   }

   public List<MyTicketBean> getAllTicketById(String id) {
      
      List<MyTicketBean> myticket_lists=sqlSessionTemplate.selectList(namespace+".getAllTicketById",id);
      return myticket_lists;
   }//추가


   public void updateTicket(MyTicketBean tb) {
      int cnt = sqlSessionTemplate.update(namespace+".updateTicket",tb);
      System.out.println("updateTicket success : " + cnt);
   }//추가

   public List<TimeTableBean> getAllIndeMovieForBooking(String currentDate) {
      System.out.println("currentday : " + currentDate);
      List<TimeTableBean> lists = sqlSessionTemplate.selectList(namespace+".getAllIndeMovieForBooking",currentDate);
      System.out.println("getAllIndeMovieForBooking lists size : " + lists.size());
      return lists;
   }//추가

   public List<TimeTableBean> getAllIndeTimeTableForBooking(TimeTableBean tbean) {
      List<TimeTableBean> TimeTableLists =sqlSessionTemplate.selectList(namespace+".getAllIndeTimeTableForBooking",tbean);
      System.out.println("getAllIndeTimeTableForBooking TimeTableLists size : " + TimeTableLists.size());
      return TimeTableLists;
   }//추가

   public void refreshTicket(String r_userId) {
      int cnt = sqlSessionTemplate.delete(namespace+".refreshTicket",r_userId);
      System.out.println("delete myticket : " + cnt);
   }//추가

   public void deleteBook(int r_num) {
      sqlSessionTemplate.delete(namespace+".deleteBook",r_num);
      
   }//추가

   public String getTnum(BookBean bb) {
      String tnum = sqlSessionTemplate.selectOne(namespace+".getTnum",bb);
      System.out.println("getTnum tnum : " + tnum);
      return tnum;
   }//추가
   
   public void cancelSeat(String r_sno, String tnum) {
      Map<String, String> map = new HashMap<String, String>();
      map.put("r_sno", r_sno);
      map.put("tnum", tnum);
      
      int cnt = sqlSessionTemplate.update(namespace+".cancelSeat",map);
      System.out.println("cancelSeat cnt : " + cnt);
   }//추가

   public void resetSeatCount(TimeTableBean tb) {
      System.out.println(tb.getTheater());
      System.out.println(tb.getCinema());
      System.out.println(tb.getMname());
      System.out.println(tb.getBookingSeat());
      int cnt = sqlSessionTemplate.update(namespace+".resetSeatCount",tb);
      System.out.println("resetSeatCount cnt : " + cnt);
   }

   

}