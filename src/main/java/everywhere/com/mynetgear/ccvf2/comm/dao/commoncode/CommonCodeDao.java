package everywhere.com.mynetgear.ccvf2.comm.dao.commoncode;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDtoExt;

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
	 * @described 코드내용 수정
	 * @param dto 
	 * @return int 
	 */
	public int updateCommonCodeInfo(CommonCodeDto dto);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 코드내용 삭제
	 * @param dto 
	 * @return int 
	 */
	public int deleteCommonCodeInfo(CommonCodeDto dto);
	
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
	 * @described 코드목록가져오기(매개변수가 있는 타입)
	 * @return
	 */
	public List<CommonCodeDto> getListCommonCodeInfo(CommonCodeDtoExt dtoImp);
	
	
	
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
	/*public CommonCodeDto getOneCommonCodeInfo(String code_group_name, String code_name);*/
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 11.
	 * @described 공통코드 검색에 필요한 목록 
	 * @param test
	 * @return
	 */
	public List<CommonCodeDto> getListCommonCodeSearchConditionList();
	
	/**
	 * @author 안희진
	 * @createDate 2015. 12. 9.
	 * @described 코드그룹으로 코드리스트 가져오기
	 * @param code_group 
	 * @return CommonCodeDto
	 */
	/*public List<CommonCodeDto> getListByGroupCode(String code_group);*/
	/**
	 * @author 안희진
	 * @createDate 2015. 12. 9.
	 * @described 코드 값으로 코드 이릅 가져오기
	 * @param code 
	 * @return String
	 */
	/*public String getCodeName(String code);*/
}
