package everywhere.com.mynetgear.ccvf2.comm.dto.common;

import java.util.Date;

/**
 * @author 배성욱
 * @createDate 2015. 12. 8.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class CommonReplyDto {
	/** 공통댓글 : 공통댓글시퀀스 */
	private int reply_no=0;
	/** 공통댓글 : 회원번호 */
	private int mem_no=0;
	/** 공통댓글 : 글이써진곳 타입 */
	private String type_code="";
	/** 공통댓글 : 글번호 */
	private int item_no=0;
	/** 공통댓글 : 댓글내용 */
	private String reply_content="";
	/** 공통댓글 : 댓글작성자이름 */
	private String reply_writer_name="";
	/** 공통댓글 : 댓글작성일 */
	private Date reply_write_date=null;
	/** 공통댓글 : 사용여부 */
	private String use_yn="";
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getType_code() {
		return type_code;
	}
	public void setType_code(String type_code) {
		this.type_code = type_code;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_writer_name() {
		return reply_writer_name;
	}
	public void setReply_writer_name(String reply_writer_name) {
		this.reply_writer_name = reply_writer_name;
	}
	public Date getReply_write_date() {
		return reply_write_date;
	}
	public void setReply_write_date(Date reply_write_date) {
		this.reply_write_date = reply_write_date;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	
	
}
