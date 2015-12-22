package everywhere.com.mynetgear.ccvf2.admin.dto.settingmain;

/**
 * @author 배성욱
 * @createDate 2015. 12. 18.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class SettingMainDto {
	/** 사용자메인페이지 셋팅 : 셋팅 고유번호 */
	private int setting_no;
	/** 사용자메인페이지 셋팅 : 세팅위치코드 */
	private String  setting_spot_code;
	/** 사용자메인페이지 셋팅 : 셋팅내용 코드 */
	private String  setting_type_code;
	/** 사용자메인페이지 셋팅 :셋팅 URL */
	private String  setting_url;
	/** 사용자메인페이지 셋팅 : 셋팅 글번호 */
	private int planner_no;
	/** 사용자메인페이지 셋팅 : 사용여부 */
	private String  use_yn;
	/** 사용자메인페이지 셋팅 : 셋딩될 내용 */
	private String setting_text;
	public int getSetting_no() {
		return setting_no;
	}
	public void setSetting_no(int setting_no) {
		this.setting_no = setting_no;
	}
	public String getSetting_spot_code() {
		return setting_spot_code;
	}
	public void setSetting_spot_code(String setting_spot_code) {
		this.setting_spot_code = setting_spot_code;
	}
	public String getSetting_type_code() {
		return setting_type_code;
	}
	public void setSetting_type_code(String setting_type_code) {
		this.setting_type_code = setting_type_code;
	}
	public String getSetting_url() {
		return setting_url;
	}
	public void setSetting_url(String setting_url) {
		this.setting_url = setting_url;
	}
	public int getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(int planner_no) {
		this.planner_no = planner_no;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getSetting_text() {
		return setting_text;
	}
	public void setSetting_text(String setting_text) {
		this.setting_text = setting_text;
	}
	
	
	
	
	
}
