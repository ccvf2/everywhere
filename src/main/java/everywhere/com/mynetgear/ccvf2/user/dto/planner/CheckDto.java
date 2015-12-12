package everywhere.com.mynetgear.ccvf2.user.dto.planner;

public class CheckDto {
	private int check_no;
	private int planner_no;
	private int mem_no;
	private String check_title;
	private String check_status_code;
	
	public int getCheck_no() {
		return check_no;
	}
	public void setCheck_no(int check_no) {
		this.check_no = check_no;
	}
	
	public int getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(int planner_no) {
		this.planner_no = planner_no;
	}
	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	
	public String getCheck_title() {
		return check_title;
	}
	public void setCheck_title(String check_title) {
		this.check_title = check_title;
	}
	
	public String getCheck_status_code() {
		return check_status_code;
	}
	public void setCheck_status_code(String check_status_code) {
		this.check_status_code = check_status_code;
	}
	
	@Override
	public String toString() {
		return "CheckDto [check_no=" + check_no + ", planner_no=" + planner_no + ", mem_no=" + mem_no + ", check_title="
				+ check_title + ", check_status_code=" + check_status_code + "]";
	}
}
