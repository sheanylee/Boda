package time.model;

import org.hibernate.validator.constraints.NotEmpty;

public class TimeTableBean {

   private String bookingSeat;

   public String getBookingSeat() {
      return bookingSeat;
   }


   public void setBookingSeat(String bookingSeat) {
      this.bookingSeat = bookingSeat;
   }
   
   //�߰�
   private String noinput1;
   private String noinput2;
   
   public String getNoinput1() {
      return noinput1;
   }

   public void setNoinput1(String noinput1) {
      this.noinput1 = noinput1;
   }

   public String getNoinput2() {
      return noinput2;
   }

   public void setNoinput2(String noinput2) {
      this.noinput2 = noinput2;
   }
   //

   private int num;
   @NotEmpty(message = "영화관을 선택하세요")
   private String theater;
   private String t_premium;
   private String t_seat;
   @NotEmpty(message = "상영관을 선택하세요")
   private String cinema;
   private String t_name;
   @NotEmpty(message = "상영일을 선택하세요")
   private String day;
   @NotEmpty(message = "상영시작시간을 선택하세요")
   private String mstart;
   private String gap;
   private String mend;
   @NotEmpty(message = "상영할 영화를 선택하세요")
   private String mname;
   private String m_grade;
   private String m_genre;
   private String m_runtime; //int에서 STring으로 변경
   private String m_date;
   private String m_Enddate;
    ////�߰�
      public TimeTableBean(String theater, String day, String mname) {
         super();
         this.theater = theater;
         this.day = day;
         this.mname = mname;
      }

      public TimeTableBean(String theater, String cinema, String day, String mstart, String mname) {
         super();
         this.theater = theater;
         this.cinema = cinema;
         this.day = day;
         this.mstart = mstart;
         this.mname = mname;
      }

      public TimeTableBean(int num, String theater, String cinema, String day, String mstart, String mname, String m_runtime) {
         super();
         this.num=num;
         this.theater = theater;
         this.cinema = cinema;
         this.day = day;
         this.mstart = mstart;
         this.mname = mname;
         this.m_runtime = m_runtime;
      }
      
      public TimeTableBean(int num, String theater, String t_premium, String t_seat, String cinema,
            String day, String mstart, String gap, String mend, String mname, String m_grade, String m_genre,
            String m_runtime, String m_date) {
         super();
         this.num = num;
         this.theater = theater;
         this.t_premium = t_premium;
         this.t_seat = t_seat;
         this.cinema = cinema;
         this.day = day;
         this.mstart = mstart;
         this.gap = gap;
         this.mend = mend;
         this.mname = mname;
         this.m_grade = m_grade;
         this.m_genre = m_genre;
         this.m_runtime = m_runtime;
         this.m_date = m_date;
      }
      public TimeTableBean() {
         super();
      }
      
      public TimeTableBean(String theater, int cinema, String day, String mname, String bookingSeat) {
         this.theater = theater;
         this.cinema = String.valueOf(cinema);
         this.day = day;
         this.mname = mname;
         this.bookingSeat = bookingSeat;
         
      }


   public int getNum() {
      return num;
   }
   public void setNum(int num) {
      this.num = num;
   }
   public String getTheater() {
      return theater;
   }
   public void setTheater(String theater) {
      this.theater = theater;
   }
   public String getT_premium() {
      return t_premium;
   }
   public void setT_premium(String t_premium) {
      this.t_premium = t_premium;
   }

   public String getT_seat() {
      return t_seat;
   }
   public void setT_seat(String t_seat) {
      this.t_seat = t_seat;
   }
   public String getCinema() {
      return cinema;
   }
   public void setCinema(String cinema) {
      this.cinema = cinema;
   }
   public String getDay() {
      return day;
   }
   public void setDay(String day) {
      this.day = day;
   }
   public String getMstart() {
      return mstart;
   }
   public void setMstart(String mstart) {
      this.mstart = mstart;
   }
   public String getGap() {
      return gap;
   }
   public void setGap(String gap) {
      this.gap = gap;
   }
   public String getMend() {
      return mend;
   }
   public void setMend(String mend) {
      this.mend = mend;
   }
   public String getMname() {
      return mname;
   }
   public void setMname(String mname) {
      this.mname = mname;
   }
   public String getM_grade() {
      return m_grade;
   }
   public void setM_grade(String m_grade) {
      this.m_grade = m_grade;
   }
   public String getM_genre() {
      return m_genre;
   }
   public void setM_genre(String m_genre) {
      this.m_genre = m_genre;
   }
   public String getM_runtime() {
      return m_runtime;
   }
   public void setM_runtime(String m_runtime) {
      this.m_runtime = m_runtime;
   }
   public String getM_date() {
      return m_date;
   }
   public void setM_date(String m_date) {
      this.m_date = m_date;
   }
   
   public String getM_Enddate() {
      return m_Enddate;
   }
   public void setM_Enddate(String m_Enddate) {
      this.m_Enddate = m_Enddate;
   }
   public String getT_name() {
      return t_name;
   }
   public void setT_name(String t_name) {
      this.t_name = t_name;
   }


}