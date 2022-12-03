package theater.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class TheaterBean { //12

	   //11-23
	   private String y2019;
	   private String y2020;
	   private String y2021;
	   private String y2022;
	   
	   private String vno;
	   private String visit_date;
	   private int cnt; //방문횟수
	   
	   private String rcnt;
	   private String rday;
	   
	   
	   //11-23끝
	
	
   private int t_num;
   public String getY2019() {
	return y2019;
}
public void setY2019(String y2019) {
	this.y2019 = y2019;
}
public String getY2020() {
	return y2020;
}
public void setY2020(String y2020) {
	this.y2020 = y2020;
}
public String getY2021() {
	return y2021;
}
public void setY2021(String y2021) {
	this.y2021 = y2021;
}
public String getY2022() {
	return y2022;
}
public void setY2022(String y2022) {
	this.y2022 = y2022;
}
public String getVno() {
	return vno;
}
public void setVno(String vno) {
	this.vno = vno;
}
public String getVisit_date() {
	return visit_date;
}
public void setVisit_date(String visit_date) {
	this.visit_date = visit_date;
}
public int getCnt() {
	return cnt;
}
public void setCnt(int cnt) {
	this.cnt = cnt;
}
public String getRcnt() {
	return rcnt;
}
public void setRcnt(String rcnt) {
	this.rcnt = rcnt;
}
public String getRday() {
	return rday;
}
public void setRday(String rday) {
	this.rday = rday;
}



@NotEmpty(message = "코드를 입력하세요.")
   @Pattern(regexp = "^[a-z]{1,2}[0-9]+$", message="지역코드와 숫자를 혼합하여 입력하세요") //앞에 알파벳 뒤에 숫자
   private String t_code;
   @NotEmpty(message = "설립일을 선택하세요.")
   private String t_day ;
   @NotBlank(message = "지역을 선택하세요.")
   private String t_region ;
   @NotBlank(message = "시/구를 입력하세요.")
   private String t_gu ;
   @NotBlank(message = "나머지 주소를 입력하세요.")
   private String t_address;
   @NotBlank(message = "영화관 이름을 입력하세요.")
   @Pattern(regexp = "^[A-Z|a-z]{4}[A-Z|a-z|가-힣]+$" , message="앞에 Boda를 붙여주세요") //앞에 boda
   private String t_theater ;
   //@NotEmpty(message = "이미지를 선택하세요.")
   private String t_img;
   @NotBlank(message = "전화번호를 입력하세요.")
   @Pattern(regexp = "^[0-9]{4}-+[0-9]{4}$", message = "-을 입력하세요") //-입력필수
   private String t_tel;
   @NotBlank(message = "주차 가능 여부를 선택하세요.")
   private String t_parking;
   @NotBlank(message = "상영관을 입력하세요.")
   @Pattern(regexp = "^[0-9]+$",message = "숫자만 입력하세요") //숫자만
   private String t_name ;
   @NotBlank(message = "좌석수를 입력하세요.")
   @Pattern(regexp = "^[0-9]+$",message = "숫자만 입력하세요") //숫자만
   private String t_seat ;
   @NotBlank(message = "상영 정보를 선택하세요.")
   private String t_premium ;
   
   @NotNull(message = "위치정보를 입력하세요.")
   private String t_location;
   
   public String getT_location() {
      return t_location;
   }
   public void setT_location(String t_location) {
      this.t_location = t_location;
   }
   
   
   
   private int max;
   private int seat;
   private String mname;
   
   
   private MultipartFile upload; 
   
   public MultipartFile getUpload() {
      return upload;
   }
   public void setUpload(MultipartFile upload) {
      this.upload = upload;
      System.out.println("setUpload: "+upload);
      System.out.println("upload.getName(): "+upload.getName());
   
      
      this.t_img = upload.getOriginalFilename();
   }
   
   
   public int getMax() {
      return max;
   }
   public void setMax(int max) {
      this.max = max;
   }
   public int getSeat() {
      return seat;
   }
   public void setSeat(int seat) {
      this.seat = seat;
   }
   public String getT_parking() {
      return t_parking;
   }
   public void setT_parking(String t_parking) {
      this.t_parking = t_parking;
   }
   public String getT_address() {
      return t_address;
   }
   public void setT_address(String t_address) {
      this.t_address = t_address;
   }
   public String getT_img() {
      return t_img;
   }
   public void setT_img(String t_img) {
      this.t_img = t_img;
   }
   public String getT_tel() {
      return t_tel;
   }
   public void setT_tel(String t_tel) {
      this.t_tel = t_tel;
   }
   public int getT_num() {
      return t_num;
   }
   public void setT_num(int t_num) {
      this.t_num = t_num;
   }
   public String getT_code() {
      return t_code;
   }
   public void setT_code(String t_code) {
      this.t_code = t_code;
   }
   public String getT_day() {
      return t_day;
   }
   public void setT_day(String t_day) {
      this.t_day = t_day;
   }
   public String getT_region() {
      return t_region;
   }
   public void setT_region(String t_region) {
      this.t_region = t_region;
   }
   public String getT_gu() {
      return t_gu;
   }
   public void setT_gu(String t_gu) {
      this.t_gu = t_gu;
   }
   public String getT_theater() {
      return t_theater;
   }
   public void setT_theater(String t_theater) {
      this.t_theater = t_theater;
   }
   public String getT_name() {
      return t_name;
   }
   public void setT_name(String t_name) {
      this.t_name = t_name;
   }
   public String getT_seat() {
      return t_seat;
   }
   public void setT_seat(String t_seat) {
      this.t_seat = t_seat;
   }
   public String getT_premium() {
      return t_premium;
   }
   public void setT_premium(String t_premium) {
      this.t_premium = t_premium;
   }

   public TheaterBean(int t_num, String t_code, String t_day, String t_region, String t_gu, String t_address,
         String t_theater, String t_img, String t_tel, String t_parking, String t_name, String t_seat, String t_premium) {
      super();
      this.t_num = t_num;
      this.t_code = t_code;
      this.t_day = t_day;
      this.t_region = t_region;
      this.t_gu = t_gu;
      this.t_address = t_address;
      this.t_theater = t_theater;
      this.t_img = t_img;
      this.t_tel = t_tel;
      this.t_parking = t_parking;
      this.t_name = t_name;
      this.t_seat = t_seat;
      this.t_premium = t_premium;
   }
   public TheaterBean() {
      super();
   }
   public String getMname() {
      return mname;
   }
   public void setMname(String mname) {
      this.mname = mname;
   }
   
   
   
}