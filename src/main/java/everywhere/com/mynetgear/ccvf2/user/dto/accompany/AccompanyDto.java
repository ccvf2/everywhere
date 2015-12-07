package everywhere.com.mynetgear.ccvf2.user.dto.accompany;

import java.util.Date;
import java.util.List;

/**
 * @author 곽성국
 * @createDate 2015. 12. 7.
 * @described 동행구하기 게시판 DTO
 * @reference class
 */
public class AccompanyDto {
	private int accompany_no;
	private int writer_num;
	private Date write_date;
	private Date start_date;
	private Date end_date;
	private String title;
	private String content;
	private String accompany_status_code;
	private List<Object> reply;
	private String use_yn;
	private String gender;

	public int getAccompany_no() {
		return accompany_no;
	}

	public void setAccompany_no(int accompany_no) {
		this.accompany_no = accompany_no;
	}

	public int getWriter_num() {
		return writer_num;
	}

	public void setWriter_num(int writer_num) {
		this.writer_num = writer_num;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<Object> getReply() {
		return reply;
	}

	public void setReply(List<Object> reply) {
		this.reply = reply;
	}

	public String getAccompany_status_code() {
		return accompany_status_code;
	}

	public void setAccompany_status_code(String accompany_status_code) {
		this.accompany_status_code = accompany_status_code;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}