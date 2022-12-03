package review.model;

public class ReviewBean {
	
	private int r_num; //������ ��ȣ
	private String r_memberId; //ȸ�� ���̵�
	private String r_movieName; //��ȭ �̸�
	private double r_star; //������ ����
	private String r_review; //������ ����
	private String r_date; //������ �ۼ���
	
	public ReviewBean() {
		super();
	}
	
	public ReviewBean(int r_num, String r_memberId, String r_movieName, double r_star, String r_review, String r_date) {
		super();
		this.r_num = r_num;
		this.r_memberId = r_memberId;
		this.r_movieName = r_movieName;
		this.r_star = r_star;
		this.r_review = r_review;
		this.r_date = r_date;
	}
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_memberId() {
		return r_memberId;
	}
	public void setR_memberId(String r_memberId) {
		this.r_memberId = r_memberId;
	}
	public String getR_movieName() {
		return r_movieName;
	}
	public void setR_movieName(String r_movieName) {
		this.r_movieName = r_movieName;
	}
	public double getR_star() {
		return r_star;
	}
	public void setR_star(double r_star) {
		this.r_star = r_star;
	}
	public String getR_review() {
		return r_review;
	}
	public void setR_review(String r_review) {
		this.r_review = r_review;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
}