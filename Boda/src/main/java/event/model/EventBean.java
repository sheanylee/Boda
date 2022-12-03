package event.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class EventBean {
	private int no;
	@Length(min = 2, max = 20, message = "제목은 2~20글자로 입력하세요.")
	private String title;
	private String contents;
	@NotEmpty(message = "대표 이미지를 선택하세요.")
	private String main_img;
	@NotEmpty(message = "게시글 이미지를 선택하세요.")
	private String contents_img;
	@NotEmpty(message = "시작 날짜를 선택하세요.")
	private String sday;
	@NotEmpty(message = "종료 날짜를 선택하세요.")
	private String eday;
	
	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday;
	}
	public String getEday() {
		return eday;
	}
	public void setEday(String eday) {
		this.eday = eday;
	}
	private MultipartFile upload1;
	private MultipartFile upload2;
	
	public MultipartFile getUpload2() {
		return upload2;
	}
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
		this.contents_img=upload2.getOriginalFilename();
	}
	public MultipartFile getUpload1() {
		return upload1;
	}
	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
		this.main_img=upload1.getOriginalFilename();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getContents_img() {
		return contents_img;
	}
	public void setContents_img(String contents_img) {
		this.contents_img = contents_img;
	}
	
	
}
