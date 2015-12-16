package everywhere.com.mynetgear.ccvf2.admin.dto.member;

import java.util.Date;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 DTO
 * @reference class
 */
public class AdminMemberDto {
	String search;
	String memLevel;
	String memStatus;
	String phoneStatus;
	Date start_date;
	Date end_date;
	
	@SuppressWarnings("javadoc")
	public String getSearch() {
		return search;
	}

	@SuppressWarnings("javadoc")
	public void setSearch(String search) {
		this.search = search;
	}

	@SuppressWarnings("javadoc")
	public String getMemLevel() {
		return memLevel;
	}
	
	@SuppressWarnings("javadoc")
	public void setMemLevel(String memLevel) {
		this.memLevel = memLevel;
	}
	
	@SuppressWarnings("javadoc")
	public String getMemStatus() {
		return memStatus;
	}
	
	@SuppressWarnings("javadoc")
	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}
	
	@SuppressWarnings("javadoc")
	public String getPhoneStatus() {
		return phoneStatus;
	}
	
	@SuppressWarnings("javadoc")
	public void setPhoneStatus(String phoneStatus) {
		this.phoneStatus = phoneStatus;
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
