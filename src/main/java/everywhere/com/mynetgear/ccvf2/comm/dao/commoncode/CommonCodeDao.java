package everywhere.com.mynetgear.ccvf2.comm.dao.commoncode;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 7.
 * @described 공통코드 Data Access Object 인터페이스
 * @reference interface
 */
public interface CommonCodeDao {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 코드내용 등록
	 * @param dto 
	 * @return int 
	 */
	public int insertCommonCodeInfo(CommonCodeDto dto);
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 코드목록가져오기
	 * @return
	 */
	public List<CommonCodeDto> getListCommonCodeInfo();
	
	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 코드내용 1건 가져오기
	 * @param code_no
	 * @return CommonCodeDto
	 */
	public CommonCodeDto getOneCommonCodeInfo(int code_no);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 코드내용 1건 가져오기
	 * @param Code
	 * @return CommonCodeDto
	 */
	public CommonCodeDto getOneCommonCodeInfo(String Code);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 코드내용 1건 가져오기
	 * @param code_group_name 
	 * @param code_name 
	 * @return CommonCodeDto
	 */
	public CommonCodeDto getOneCommonCodeInfo(String code_group_name, String code_name);
}
