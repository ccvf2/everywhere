package everywhere.com.mynetgear.ccvf2.admin.dto.mailtemplat;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.EverywhereDefaultDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 10.
 * @described 메일템플릿 DTO
 * @reference class
 */
public class MailTemplateDto extends EverywhereDefaultDto {
	private int mtemp_no=0;
	private String mtemp_group_code="";
	private String mtemp_name="";
	private String mtemp_title="";
	private String mtemp_content="";
	public int getMtemp_no() {
		return mtemp_no;
	}
	public void setMtemp_no(int mtemp_no) {
		this.mtemp_no = mtemp_no;
	}
	public String getMtemp_group_code() {
		return mtemp_group_code;
	}
	public void setMtemp_group_code(String mtemp_group_code) {
		this.mtemp_group_code = mtemp_group_code;
	}
	public String getMtemp_name() {
		return mtemp_name;
	}
	public void setMtemp_name(String mtemp_name) {
		this.mtemp_name = mtemp_name;
	}
	public String getMtemp_title() {
		return mtemp_title;
	}
	public void setMtemp_title(String mtemp_title) {
		this.mtemp_title = mtemp_title;
	}
	public String getMtemp_content() {
		return mtemp_content;
	}
	public void setMtemp_content(String mtemp_content) {
		this.mtemp_content = mtemp_content;
	}
	
}
