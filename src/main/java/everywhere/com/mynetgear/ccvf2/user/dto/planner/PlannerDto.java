package everywhere.com.mynetgear.ccvf2.user.dto.planner;

import java.util.Date;

public class PlannerDto {
	private int planner_no;
	private int mem_no;
	private String planner_ba_code;
	private String title;
	private String attach_file;
	private String memo;
	private Date start_date;
	private Date end_date;
	private Date reg_date;
	private String use_yn;
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
	public String getPlanner_ba_code() {
		return planner_ba_code;
	}
	public void setPlanner_ba_code(String planner_ba_code) {
		this.planner_ba_code = planner_ba_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAttach_file() {
		return attach_file;
	}
	public void setAttach_file(String attach_file) {
		this.attach_file = attach_file;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	
	@Override
	public String toString() {
		return "PlannerDto [planner_no=" + planner_no + ", mem_no=" + mem_no + ", planner_ba_code=" + planner_ba_code
				+ ", title=" + title + ", attach_file=" + attach_file + ", memo=" + memo + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", reg_date=" + reg_date + ", use_yn=" + use_yn + "]";
	}
}
