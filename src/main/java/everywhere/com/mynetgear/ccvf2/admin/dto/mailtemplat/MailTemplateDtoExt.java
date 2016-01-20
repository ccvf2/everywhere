package everywhere.com.mynetgear.ccvf2.admin.dto.mailtemplat;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.EverywhereDefaultDto;

/**
 * @author 배성욱
 * @createDate 2016. 1. 20.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class MailTemplateDtoExt extends EverywhereDefaultDto {
	/** 분류명 : 내용기술 */
	private String mtemp_group_name="";
	/** 분류명 : 내용기술 */
	private String mtemp_active_name="";
	
	
	public String getMtemp_group_name() {
		return mtemp_group_name;
	}
	public void setMtemp_group_name(String mtemp_group_name) {
		this.mtemp_group_name = mtemp_group_name;
	}
	public String getMtemp_active_name() {
		return mtemp_active_name;
	}
	public void setMtemp_active_name(String mtemp_active_name) {
		this.mtemp_active_name = mtemp_active_name;
	}
	
	

}
