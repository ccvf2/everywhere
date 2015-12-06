package everywhere.com.mynetgear.ccvf2.comm.dao.commoncode;

import java.util.HashMap;
import java.util.List;

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
	
	/** 코드 목록가져오기 */
	@Override
	public List<CommonCodeDto> getListCommonCodeInfo() {
		return sqlTemplate.selectList("selectList_code_info");
	}
	
	
	
	
	
	
	@Override
	public CommonCodeDto getOneCommonCodeInfo(int code_no) {
		return sqlTemplate.selectOne("select_code_info_seq", code_no);
	}
	@Override
	public CommonCodeDto getOneCommonCodeInfo(String code) {
		return sqlTemplate.selectOne("select_code_info_code", code);
	}
	@Override
	public CommonCodeDto getOneCommonCodeInfo(String code_group_name, String code_name) {
		HashMap<String, String> map =new HashMap<String, String>();
		map.put("code_group_name", code_group_name);
		map.put("code_name", code_name);
		return sqlTemplate.selectOne("select_code_info_groupname", map);
	}
	
}
