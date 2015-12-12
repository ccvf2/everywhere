package everywhere.com.mynetgear.ccvf2.user.dto.accompany;

import java.util.Date;
import java.util.List;

/**
 * @author 곽성국
 * @createDate 2015. 12. 7.
 * @described 동행구하기 게시판 DTO
 * @reference class
 */
public class AccompanyDto extends AccompanyDtoExt {
	private int accompany_no;
	private int mem_no;
	private String mem_name;
	private Date write_date;
	private Date start_date;
	private Date end_date;
	private String title;
	private String content;
	private String accompany_status_code;
	private String use_yn;
	private String gender_code;
	private int hits;

	public int getAccompany_no() {
		return accompany_no;
	}

	public void setAccompany_no(int accompany_no) {
		this.accompany_no = accompany_no;
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

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getGender_code() {
		return gender_code;
	}

	public void setGender_code(String gender_code) {
		this.gender_code = gender_code;
	}


	/**
	 * @author 곽성국
	 * @createDate 2015. 12. 7.
	 * @described 테스트용 DTO 프린터
	 */
	public void printAll() {
		System.out.println("accompany_no: " + this.accompany_no);
		System.out.println("mem_no: " + this.mem_no);
		System.out.println("write_date: " + this.write_date);
		System.out.println("start_date: " + this.start_date);
		System.out.println("end_date: " + this.end_date);
		System.out.println("title: " + this.title);
		System.out.println("content: " + this.content);
		System.out.println("accompany_status_code: " + this.accompany_status_code);
		// System.out.println("reply: " + this.reply.size());
		System.out.println("use_yn: " + this.use_yn);
		System.out.println("gender_code: " + this.gender_code);
		System.out.println("hits:" + this.hits);
		System.out.println("mem_name" + this.mem_name);
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
}