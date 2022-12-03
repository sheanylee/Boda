package book.model;

public class BookBean {
   // member > memberId 
   // timetable > mname, theater, cinema, day, mstart 
   // seat > sno, 
   
   private int r_num; //예약번호
   private String r_userId; //예약자
   private int r_price; //결제금액
   private String r_reserDay; //예약일
   private String r_mname;   //예약영화이름
   private String r_theater;   //예약극장
   private int r_cinema;   // 극장번호
   private String r_day;   // 영화상영일
   private String r_mstart;   //영화 시작시간
   private String r_sno;   //예약 좌석
   private String r_paying; //결제방법
   private int r_point; //결제포인트 추가
   private String r_ticket; //사용한관람권 추가
   //추가
   public int getR_point() {
      return r_point;
   }

   public void setR_point(int r_point) {
      this.r_point = r_point;
   }

   public String getR_ticket() {
      return r_ticket;
   }

   public void setR_ticket(String r_ticket) {
      this.r_ticket = r_ticket;
   }

   public BookBean() {
      super();
   }
   //추가
   public BookBean(int r_num, String r_mname, String r_theater, int r_cinema, String r_day, String r_sno) {
      super();
      this.r_num = r_num;
      this.r_mname = r_mname;
      this.r_theater = r_theater;
      this.r_cinema = r_cinema;
      this.r_day = r_day;
      this.r_sno = r_sno;
   }

   public BookBean(int r_num, String r_userId, int r_price, String r_reserDay, String r_mname, String r_theater,
         int r_cinema, String r_day, String r_mstart, String r_sno, String r_paying, int r_point, String r_ticket) {
      super();
      this.r_num = r_num;
      this.r_userId = r_userId;
      this.r_price = r_price;
      this.r_reserDay = r_reserDay;
      this.r_mname = r_mname;
      this.r_theater = r_theater;
      this.r_cinema = r_cinema;
      this.r_day = r_day;
      this.r_mstart = r_mstart;
      this.r_sno = r_sno;
      this.r_paying = r_paying;
      this.r_point = r_point;
      this.r_ticket = r_ticket;
   }
   
   
   public BookBean(String r_mname, String r_theater, int r_cinema, String r_day) {
         super();
         this.r_mname = r_mname;
         this.r_theater = r_theater;
         this.r_cinema = r_cinema;
         this.r_day = r_day;
      }

//추가끝
   
   public BookBean(int r_num, String r_userId, String r_reserDay, String r_mname, String r_theater, int r_cinema,
         String r_day, String r_mstart, String r_sno) {
      super();
      this.r_num = r_num;
      this.r_userId = r_userId;
      this.r_reserDay = r_reserDay;
      this.r_mname = r_mname;
      this.r_theater = r_theater;
      this.r_cinema = r_cinema;
      this.r_day = r_day;
      this.r_mstart = r_mstart;
      this.r_sno = r_sno;
   }
   
   
   public String getR_paying() {
      return r_paying;
   }

   public void setR_paying(String r_paying) {
      this.r_paying = r_paying;
   }

   public int getR_price() {
      return r_price;
   }
   public void setR_price(int r_price) {
      this.r_price = r_price;
   }
   public int getR_num() {
      return r_num;
   }
   public void setR_num(int r_num) {
      this.r_num = r_num;
   }
   public String getR_userId() {
      return r_userId;
   }
   public void setR_userId(String r_userId) {
      this.r_userId = r_userId;
   }
   public String getR_reserDay() {
      return r_reserDay;
   }
   public void setR_reserDay(String r_reserDay) {
      this.r_reserDay = r_reserDay;
   }
   public String getR_mname() {
      return r_mname;
   }
   public void setR_mname(String r_mname) {
      this.r_mname = r_mname;
   }
   public String getR_theater() {
      return r_theater;
   }
   public void setR_theater(String r_theater) {
      this.r_theater = r_theater;
   }
   public int getR_cinema() {
      return r_cinema;
   }
   public void setR_cinema(int r_cinema) {
      this.r_cinema = r_cinema;
   }
   public String getR_day() {
      return r_day;
   }
   public void setR_day(String r_day) {
      this.r_day = r_day;
   }
   public String getR_mstart() {
      return r_mstart;
   }
   public void setR_mstart(String r_mstart) {
      this.r_mstart = r_mstart;
   }
   public String getR_sno() {
      return r_sno;
   }
   public void setR_sno(String r_sno) {
      this.r_sno = r_sno;
   }
   
    private String r_img;

      public String getR_img() {
         return r_img;
      }

      public void setR_img(String r_img) {
         this.r_img = r_img;
      }
      
      private int m_num;
      
      public int getM_num() {
         return m_num;
      }
      
      public void setM_num(int m_num) {
         this.m_num = m_num;
      }
}