package everywhere.com.mynetgear.ccvf2.user.dto.member;

import java.util.Date;

/**
 * @author 김준호
 * @createDate 2015. 12. 7.
 * @described 회원Dto
 * @reference class
 */
public class MemberDto {
	private int mem_no;                // 회원번호
	private String mem_email;          // 회원이메일
	private String mem_pwd;            // 회원비밀번호
	private String mem_name;           // 회원이름
	private String mem_phone;          // 핸드폰번호
	private String mem_interest;       // 관심사항
	private String mem_status_code;    // 계정상태
	private String mem_level_code;     // 회원등급
	private String mem_p_status_code;  // 인증번호상태
	private String mem_profile_photo;  // 프로필사진
	private Date mem_reg_date;         // 회원등록일
	
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
	public String getMem_interest() {
		return mem_interest;
	}
	public void setMem_interest(String mem_interest) {
		this.mem_interest = mem_interest;
	}
	public String getMem_status_code() {
		return mem_status_code;
	}
	public void setMem_status_code(String mem_status_code) {
		this.mem_status_code = mem_status_code;
	}
	public String getMem_level_code() {
		return mem_level_code;
	}
	public void setMem_level_code(String mem_level_code) {
		this.mem_level_code = mem_level_code;
	}
	public String getMem_p_status_code() {
		return mem_p_status_code;
	}
	public void setMem_p_status_code(String mem_p_status_code) {
		this.mem_p_status_code = mem_p_status_code;
	}
	public String getMem_profile_photo() {
		return mem_profile_photo;
	}
	public void setMem_profile_photo(String mem_profile_photo) {
		this.mem_profile_photo = mem_profile_photo;
	}
	public Date getMem_reg_date() {
		return mem_reg_date;
	}
	public void setMem_reg_date(Date mem_reg_date) {
		this.mem_reg_date = mem_reg_date;
	}
	public String toString() {
		String sentence="mem_no:"+mem_no+"\nmem_email:"+mem_email+"\nmem_pwd:"+mem_pwd+"\nmem_name:"+mem_name+"\nmem_phone:"+mem_phone
				+"\nmem_interest:"+mem_interest+"\nmem_status_code:"+mem_status_code+"\nmem_level_code:"+mem_level_code
				+"\nmem_p_status_code:"+mem_p_status_code+"\nmem_profile_photo:"+mem_profile_photo+"\nmem_reg_date:"+mem_reg_date;
		return sentence;
	}
	
}















