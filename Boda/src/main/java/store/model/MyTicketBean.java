package store.model;

public class MyTicketBean {
	private String t_id;
	private String t_spec;
	private int t_order;
	public MyTicketBean(String t_id, String t_spec, int t_order) {
		super();
		this.t_id = t_id;
		this.t_spec = t_spec;
		this.t_order = t_order;
	}
	public MyTicketBean() {
		
	}
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public String getT_spec() {
		return t_spec;
	}
	public void setT_spec(String t_spec) {
		this.t_spec = t_spec;
	}
	public int getT_order() {
		return t_order;
	}
	public void setT_order(int t_order) {
		this.t_order = t_order;
	}
	
	
}
