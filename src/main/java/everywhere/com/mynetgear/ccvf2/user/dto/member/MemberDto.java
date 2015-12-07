package everywhere.com.mynetgear.ccvf2.user.dto.member;

import java.util.Date;

/**
 * @author 김준호
 * @createDate 2015. 12. 7.
 * @described 회원Dto
 * @reference class
 */
public class MemberDto {
	private int mem_no;
	private String mem_email;
	private String mem_pwd;
	private String mem_name;
	private String mem_phone;
	private String mem_level;
	private Date mem_regdate;
	private String mem_interest;
	private Date updatedate;
	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	
	public String getMem_level() {
		return mem_level;
	}
	public void setMem_level(String mem_level) {
		this.mem_level = mem_level;
	}
	
	public Date getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(Date mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	
	public String getMem_interest() {
		return mem_interest;
	}
	public void setMem_interest(String mem_interest) {
		this.mem_interest = mem_interest;
	}
	
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
}
