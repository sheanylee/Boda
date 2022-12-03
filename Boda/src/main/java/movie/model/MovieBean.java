package movie.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class MovieBean {

	private int m_num; // 번호
	@Size(min=10, max=10, message="영화코드 10자리 입력(연도+국가코드+번호)")
	private String m_code; // 코드
	@NotBlank(message="영화명 입력")
	private String m_name; // 이름
	@NotBlank(message="장르 입력")
	private String m_genre; // 장르
	@NotBlank(message="포스터 첨부")
	private String m_img; // 포스터
	@NotBlank(message="시청등급 입력")
	private String m_grade; // 시청연령
	@NotBlank(message="제작국가 입력")
	private String m_nation; // 제작국가
	@NotBlank(message="감독 입력")
	private String m_pd; // 감독
	@NotBlank(message="출연 입력")
	private String m_actor; // 배우
	@Pattern(regexp="[0-9]+$",message="러닝타임 숫자 입력")
	private String m_runtime; // 러닝타임
	@NotBlank(message="개봉일 입력")
	private String m_date; // 개봉일
	@NotBlank(message="종영일 입력")
	private String m_enddate; // 종영일
	@NotBlank(message="줄거리 입력")
	private String m_info; // 정보
	@Pattern(regexp="[0-9]+$",message="누적관객 숫자 입력")
	private String m_view; // 누적관객
	private String m_like; // 좋아요

	private double m_per; // 예매율
	private String m_review; // 리뷰
	private double m_star; // 평점
	
	private MultipartFile upload; // a.jpg X
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) { // upload=a.jpg X
		System.out.println("setUpload(MultipartFile upload)");
		this.upload = upload;
		System.out.println("setUpload upload:" + upload);
		System.out.println("upload.getName():"+upload.getName());
		System.out.println("upload.getOriginalFilename():"+upload.getOriginalFilename());
		this.m_img = upload.getOriginalFilename();
	}
	
	public MovieBean() {
		super();
	}
	
	public MovieBean(int m_num, String m_code, String m_name, String m_genre, String m_img, String m_grade,
			String m_nation, String m_pd, String m_actor, String m_runtime, String m_date, String m_enddate,
			String m_info, String m_view, String m_like, double m_per, String m_review, double m_star,
			MultipartFile upload) {
		super();
		this.m_num = m_num;
		this.m_code = m_code;
		this.m_name = m_name;
		this.m_genre = m_genre;
		this.m_img = m_img;
		this.m_grade = m_grade;
		this.m_nation = m_nation;
		this.m_pd = m_pd;
		this.m_actor = m_actor;
		this.m_runtime = m_runtime;
		this.m_date = m_date;
		this.m_enddate = m_enddate;
		this.m_info = m_info;
		this.m_view = m_view;
		this.m_like = m_like;
		this.m_per = m_per;
		this.m_review = m_review;
		this.m_star = m_star;
		this.upload = upload;
	}

	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_genre() {
		return m_genre;
	}
	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}
	public String getM_img() {
		return m_img;
	}
	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
	public String getM_grade() {
		return m_grade;
	}
	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_nation() {
		return m_nation;
	}
	public void setM_nation(String m_nation) {
		this.m_nation = m_nation;
	}
	public String getM_pd() {
		return m_pd;
	}
	public void setM_pd(String m_pd) {
		this.m_pd = m_pd;
	}
	public String getM_actor() {
		return m_actor;
	}
	public void setM_actor(String m_actor) {
		this.m_actor = m_actor;
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
	public String getM_enddate() {
		return m_enddate;
	}
	public void setM_enddate(String m_enddate) {
		this.m_enddate = m_enddate;
	}
	public String getM_info() {
		return m_info;
	}
	public void setM_info(String m_info) {
		this.m_info = m_info;
	}
	public String getM_view() {
		return m_view;
	}
	public void setM_view(String m_view) {
		this.m_view = m_view;
	}
	public double getM_per() {
		return m_per;
	}
	public void setM_per(double m_per) {
		this.m_per = m_per;
	}
	public String getM_review() {
		return m_review;
	}
	public void setM_review(String m_review) {
		this.m_review = m_review;
	}
	public double getM_star() {
		return m_star;
	}
	public void setM_star(double m_star) {
		this.m_star = m_star;
	}
	public String getM_like() {
		return m_like;
	}
	public void setM_like(String m_like) {
		this.m_like = m_like;
	}
}
