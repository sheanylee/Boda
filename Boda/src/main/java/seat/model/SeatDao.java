 package seat.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import book.model.BookBean;
import time.model.TimeTableBean;

@Component
public class SeatDao {
   
   private final String namespace = "seat.model.SeatBean";
   @Autowired
   SqlSessionTemplate sqlSessionTemplate;
   
   public String getStatus(SeatBean sb) { //좌석 상태 받아오기
      
      String status = sqlSessionTemplate.selectOne(namespace+".GetStatus",sb);
      System.out.println("seatBean_status : " + status);
      return status;
   }

   public int getTimeTableNum(TimeTableBean tbean) {
      int tnum = sqlSessionTemplate.selectOne(namespace+".getTimeTableNum",tbean);
      System.out.println("getTimeTableNum timetable num " + tnum);
      System.out.println("getTimeTableNum seat tabel tnum " + tnum);
      return tnum;
   }


   public String getSeatCode(String theater, String cinema) {
      Map<String,String> map = new HashMap<String,String>();
      map.put("theater", theater);
      map.put("cinema", cinema);
      
      //theater테이블의 t_theater, t_name과 timetable의 theater과 cinema 비교 후 동일한 레코드 찾아 theater테이블의 seatCode가져오기
      String t_seat  = sqlSessionTemplate.selectOne(namespace+".getSeatCode",map);
      System.out.println("getSeatCode t_seat : " + t_seat);
      return t_seat;
   }

   public void updateTnum(int num) {
      int cnt = sqlSessionTemplate.update(namespace+".updateTnum",num);
      System.out.println("updateTnum cnt : " + cnt);
      
   }

   public void insertTnum(SeatBean sb) {
      int cnt = sqlSessionTemplate.insert(namespace+".insertTnum",sb);
      System.out.println("insertTnum cnt : " + cnt);
   }

   public List<SeatBean> getReservationNum(int tnum) {
      System.out.println("tnum : " + tnum);
      List<SeatBean> snoList = new ArrayList<SeatBean>();
      snoList = sqlSessionTemplate.selectList(namespace+".getReservationNum",tnum);
      System.out.println(snoList.size());
      return snoList;
   }

}