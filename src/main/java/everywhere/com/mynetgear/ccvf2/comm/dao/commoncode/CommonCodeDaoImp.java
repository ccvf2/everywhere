package everywhere.com.mynetgear.ccvf2.comm.dao.commoncode;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDtoExt;

/**
 * @author 배성욱
 * @createDate 2015. 12. 7.
 * @described 공통코드 Data Access Object 구현부
 * @reference class
 */
@Component
public class CommonCodeDaoImp implements CommonCodeDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	/* 트랜젝션 처리시 */
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	/** 코드 입력시 */
	@Override
	public int insertCommonCodeInfo(CommonCodeDto dto) {
		return sqlTemplate.insert("insert_code_info", dto);
	}
	/** 코드 수정시 */
	@Override
	public int updateCommonCodeInfo(CommonCodeDto dto) {
		return sqlTemplate.update("update_code_info", dto);
	}
	
	/** 코드 삭제 */
	@Override
	public int deleteCommonCodeInfo(CommonCodeDto dto) {
		return sqlTemplate.update("delete_code_info", dto);
	}
	
	/** 코드 목록가져오기 */
	@Override
	public List<CommonCodeDto> getListCommonCodeInfo() {
		CommonCodeDto CommonCodeDto = new CommonCodeDto();
		return sqlTemplate.selectList("selectList_code_info",CommonCodeDto);
	}
	/** 코드 목록가져오기(매개변수 있는 타입)-관리자 페이지에서만 사용 */
	@Override
	public List<CommonCodeDto> getListCommonCodeInfoAdmin(CommonCodeDtoExt dtoExt) {
		return sqlTemplate.selectList("selectList_code_info_admin",dtoExt);
	}
	
	
	
	
	
	/** 코드 목록가져오기(매개변수 있는 타입) */
	@Override
	public List<CommonCodeDto> getListCommonCodeInfo(CommonCodeDtoExt dtoExt) {
		return sqlTemplate.selectList("selectList_code_info",dtoExt);
	}
	/** 코드 목록 총 갯수(매개변수 있는 타입) */
	@Override
	public int getListCommonCodeInfoTotalcount(CommonCodeDtoExt dtoExt) {
		return  sqlTemplate.selectOne("selectList_code_info_totalCount",dtoExt);
	}

	
	
	
	
	
	
	
	/** 코드 1건 가져오기 */
	@Override
	public CommonCodeDto getOneCommonCodeInfo(int code_no) {
		CommonCodeDto dto= new CommonCodeDto();
		dto.setCode_no(code_no);
		return sqlTemplate.selectOne("selectOne_code_info", dto);
	}
	/** 코드 1건 가져오기 */
	@Override
	public CommonCodeDto getOneCommonCodeInfo(String code) {
		CommonCodeDto dto= new CommonCodeDto();
		code = StringUtils.deleteWhitespace(code);
		dto.setCode(code);
		return sqlTemplate.selectOne("selectOne_code_info", dto);
	}
	/** 코드목록 검색시 필요한 코드그룹 목록*/
	@Override
	public List<CommonCodeDto> getListCommonCodeSearchConditionList() {
		return sqlTemplate.selectList("select_list_code_gropup");
	}
/*	@Override
	public CommonCodeDto getOneCommonCodeInfo(String code_group_name, String code_name) {
		HashMap<String, String> map =new HashMap<String, String>();
		map.put("code_group_name", code_group_name);
		map.put("code_name", code_name);
		return sqlTemplate.selectOne("select_code_info_groupname", map);
	}
	
/*	@Override
	public List<CommonCodeDto> getListByGroupCode(String code_group) {
		return sqlTemplate.selectList("select_by_code_group", code_group);
	}
	
	@Override
	public String getCodeName(String code) {
		return sqlTemplate.selectOne("select_code_name", code);
	}*/
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 16.
	 * @described 클래스전체의 하는(큰)일을 적어주세요.
	 * @reference class
	 * @param dtoImp
	 * @return
	 */

	
}
