package everywhere.com.mynetgear.ccvf2.comm.dao.commoncode;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;

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
	/** 코드 목록가져오기 */
	@Override
	public List<CommonCodeDto> getListCommonCodeInfo(CommonCodeDto CommonCodeDto) {
		return sqlTemplate.selectList("selectList_code_info",CommonCodeDto);
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
/*	@Override
	public CommonCodeDto getOneCommonCodeInfo(String code_group_name, String code_name) {
		HashMap<String, String> map =new HashMap<String, String>();
		map.put("code_group_name", code_group_name);
		map.put("code_name", code_name);
		return sqlTemplate.selectOne("select_code_info_groupname", map);
	}*/
	
/*	@Override
	public List<CommonCodeDto> getListByGroupCode(String code_group) {
		return sqlTemplate.selectList("select_by_code_group", code_group);
	}
	
	@Override
	public String getCodeName(String code) {
		return sqlTemplate.selectOne("select_code_name", code);
	}*/

	
}
