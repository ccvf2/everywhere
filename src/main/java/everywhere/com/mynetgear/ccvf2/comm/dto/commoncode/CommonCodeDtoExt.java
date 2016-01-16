package everywhere.com.mynetgear.ccvf2.comm.dto.commoncode;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.EverywhereDefaultDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 11.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class CommonCodeDtoExt extends EverywhereDefaultDto {
	/** 공통코드확장 : 검색코드그룹번호 */
	private String search_code_group = "";
	/** 공통코드확장 : 검색코드그룹명 */
	private String search_code_group_name = "";

	public String getSearch_code_group() {
		return search_code_group;
	}

	public void setSearch_code_group(String search_code_group) {
		this.search_code_group = search_code_group;
	}

	public String getSearch_code_group_name() {
		return search_code_group_name;
	}

	public void setSearch_code_group_name(String search_code_group_name) {
		this.search_code_group_name = search_code_group_name;
	}


}
