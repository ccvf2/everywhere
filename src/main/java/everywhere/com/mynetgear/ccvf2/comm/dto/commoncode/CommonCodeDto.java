package everywhere.com.mynetgear.ccvf2.comm.dto.commoncode;

/**
 * @author 배성욱
 * @createDate 2015. 12. 7.
 * @described 공통코드 Data Transfer Object
 * @reference class
 */
public class CommonCodeDto {
	/** 공통코드 : 공통코드시퀀스 */
	private int code_no = 0;
	/** 공통코드 : 공통코드 */
	private String code = "";
	/** 공통코드 : 공통코드 */
	private String code_name = "";
	/** 공통코드 : 그룹코드 */
	private String code_group = "";
	/** 공통코드 : 그룹명 */
	private String code_group_name = "";
	/** 공통코드 : 그룹정렬 */
	private int code_sort = 0;

	public int getCode_no() {
		return code_no;
	}

	public void setCode_no(int code_no) {
		this.code_no = code_no;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCode_name() {
		return code_name;
	}

	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}

	public String getCode_group() {
		return code_group;
	}

	public void setCode_group(String code_group) {
		this.code_group = code_group;
	}

	public String getCode_group_name() {
		return code_group_name;
	}

	public void setCode_group_name(String code_group_name) {
		this.code_group_name = code_group_name;
	}

	public int getCode_sort() {
		return code_sort;
	}

	public void setCode_sort(int code_sort) {
		this.code_sort = code_sort;
	}
}
