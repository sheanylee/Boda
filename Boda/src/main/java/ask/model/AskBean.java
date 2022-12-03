package ask.model;

import org.hibernate.validator.constraints.NotBlank;

public class AskBean {
	int ask_num;
	@NotBlank(message="제목 입력")
	String ask_title;
	@NotBlank(message="내용 입력")
	String ask_content;
	
	public int getAsk_num() {
		return ask_num;
	}
	public void setAsk_num(int ask_num) {
		this.ask_num = ask_num;
	}
	public String getAsk_title() {
		return ask_title;
	}
	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	
	public AskBean() {
		super();
	}
	public AskBean(int ask_num, String ask_title, String ask_content) {
		super();
		this.ask_num = ask_num;
		this.ask_title = ask_title;
		this.ask_content = ask_content;
	}
}
