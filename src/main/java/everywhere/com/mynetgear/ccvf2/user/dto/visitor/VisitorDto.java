package everywhere.com.mynetgear.ccvf2.user.dto.visitor;

import java.util.Date;

/**
 * @author 김준호
 * @createDate 2015. 12. 10.
 * @described 방명록Dto
 * @reference class
 */
public class VisitorDto {
	private int visitor_no;              // 방명록번호
	private int mem_no;                  // 회원번호
	private String visitor_content;      // 글내용
	private Date visitor_write_date;     // 작성일
	private String visitor_status_code;  // 글상태
	
	public int getVisitor_no() {
		return visitor_no;
	}
	public void setVisitor_no(int visitor_no) {
		this.visitor_no = visitor_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getVisitor_content() {
		return visitor_content;
	}
	public void setVisitor_content(String visitor_content) {
		this.visitor_content = visitor_content;
	}
	public Date getVisitor_write_date() {
		return visitor_write_date;
	}
	public void setVisitor_write_date(Date visitor_write_date) {
		this.visitor_write_date = visitor_write_date;
	}
	public String getVisitor_status_code() {
		return visitor_status_code;
	}
	public void setVisitor_status_code(String visitor_status_code) {
		this.visitor_status_code = visitor_status_code;
	}
	public String toString() {
		String sentence="visitor_no:"+visitor_no+"\nmem_no:"+mem_no+"\nvisitor_content:"+visitor_content
				       +"\nvisitor_write_date:"+visitor_write_date+"\nvisitor_status_code:"+visitor_status_code;
		return sentence;
	}
	
}
