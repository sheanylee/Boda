package seat.model;


public class SeatBean {

   private String sno; //좌석번호
   
   private int scode; //좌석갯수
   
   private String userNo; //회원번호, member m_num

   private int status; //이용상태 1>사용불가 0>사용가능

   private int tnum; //timetable의 num

   public SeatBean() {
      super();
   }
   
   public SeatBean(String sno, int scode, String userNo, int status, int tnum) {
      super();
      this.sno = sno;
      this.scode = scode;
      this.userNo = userNo;
      this.status = status;
      this.tnum = tnum;
   }
   public SeatBean(String sno, int scode, int status, int tnum) {
      super();
      this.sno = sno;
      this.scode = scode;
      this.status = status;
      this.tnum = tnum;
   }
   public String getSno() {
      return sno;
   }
   public void setSno(String sno) {
      this.sno = sno;
   }
   public int getScode() {
      return scode;
   }
   public void setScode(int scode) {
      this.scode = scode;
   }
   
   public int getStatus() {
      return status;
   }
   public void setStatus(int status) {
      this.status = status;
   }
   public int getTnum() {
      return tnum;
   }
   public void setTnum(int tnum) {
      this.tnum = tnum;
   }
   public String getUserNo() {
      return userNo;
   }
   public void setUserNo(String userNo) {
      this.userNo = userNo;
   }
   
}