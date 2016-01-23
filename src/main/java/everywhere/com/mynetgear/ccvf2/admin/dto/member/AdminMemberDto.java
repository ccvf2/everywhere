package everywhere.com.mynetgear.ccvf2.admin.dto.member;

import java.util.Date;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.EverywhereDefaultDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 DTO
 * @reference class
 */
public class AdminMemberDto extends EverywhereDefaultDto{
	private String mem_status_code="";
	private String mem_p_status_code="";
	private Date start_date;
	private Date end_date;
	
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
