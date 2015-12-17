package everywhere.com.mynetgear.ccvf2.admin.dto.member;

import java.util.Date;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 DTO
 * @reference class
 */
public class AdminMemberDto {
	private String mem_name="";
	private String mem_email="";
	private String mem_level_code="";
	private String mem_status_code="";
	private String mem_p_status_code="";
	private Date start_date;
	private Date end_date;
	
	@SuppressWarnings("javadoc")
	public String getMem_name() {
		return mem_name;
	}
	@SuppressWarnings("javadoc")
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	@SuppressWarnings("javadoc")
	public String getMem_email() {
		return mem_email;
	}
	@SuppressWarnings("javadoc")
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	@SuppressWarnings("javadoc")
	public String getMem_level_code() {
		return mem_level_code;
	}
	@SuppressWarnings("javadoc")
	public void setMem_level_code(String mem_level_code) {
		this.mem_level_code = mem_level_code;
	}
	@SuppressWarnings("javadoc")
	public String getMem_status_code() {
		return mem_status_code;
	}
	@SuppressWarnings("javadoc")
	public void setMem_status_code(String mem_status_code) {
		this.mem_status_code = mem_status_code;
	}
	@SuppressWarnings("javadoc")
	public String getMem_p_status_code() {
		return mem_p_status_code;
	}
	@SuppressWarnings("javadoc")
	public void setMem_p_status_code(String mem_p_status_code) {
		this.mem_p_status_code = mem_p_status_code;
	}
	@SuppressWarnings("javadoc")
	public Date getStart_date() {
		return start_date;
	}
	@SuppressWarnings("javadoc")
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	@SuppressWarnings("javadoc")
	public Date getEnd_date() {
		return end_date;
	}
	@SuppressWarnings("javadoc")
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
}
