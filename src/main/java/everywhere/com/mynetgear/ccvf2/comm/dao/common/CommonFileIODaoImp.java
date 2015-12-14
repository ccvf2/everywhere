package everywhere.com.mynetgear.ccvf2.comm.dao.common;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 9.
 * @described 공통파일 Data Access Object 인터페이스
 * @reference interface
 */
@Component
public class CommonFileIODaoImp implements CommonFileIODao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	/* 트랜젝션 처리시 */
	@Autowired
	private PlatformTransactionManager transactionManager;
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 9.
	 * @described 공통파일 데이터베이스 입력
	 * @param commonFileIODto
	 * @return
	 */
	@Override
	public int insertFileInfo(CommonFileIODto commonFileIODto) {
		return sqlTemplate.insert("insert_file_info", commonFileIODto);
	}
	
	/**
	 * @author 안희진
	 * @createDate 2015. 12. 14.
	 * @described 공통파일의 데이터를 한개씩 가져오는 함수
	 * @return
	 */
	@Override
	public CommonFileIODto getOneFileDto(int file_no) {
		return sqlTemplate.selectOne("get_one_file_info", file_no);
	}

}
