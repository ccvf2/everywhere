package everywhere.com.mynetgear.ccvf2.user.dao.accompany;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.accompany.AccompanyDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 7.
 * @described 동행구하기 DAO 구현부
 * @reference class
 */
@Component
public class AccompanyDaoImp implements AccompanyDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	@Override
	public int insertAccompany(AccompanyDto accompanyDto) {
		//EverywhereAspect.logger.info(EverywhereAspect.logMsg +accompanyDto.getEnd_date());
		return sqlTemplate.insert("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.insertAccompany", accompanyDto);
	}

	@Override
	public int getAccompanyCount(String searchValue, String accompany_status_code) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("use_yn", Constant.SYNB_YN_Y);
		hMap.put("searchValue", searchValue);
		hMap.put("accompany_status_code", accompany_status_code);
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.getAccompanyCount", hMap);
	}

	@Override
	public List<AccompanyDto> getAccompanyList(int startRow, int endRow, String searchValue, String accompany_status_code) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("use_yn", Constant.SYNB_YN_Y);
		hMap.put("accompany_status_code", accompany_status_code);
		hMap.put("searchValue", searchValue);
		return sqlTemplate.selectList("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.getAccompanyList", hMap);
	}
	
	
	
	@Override
	public AccompanyDto readAccompany(int accompany_no) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("accompany_no", accompany_no);
		hMap.put("use_yn", Constant.SYNB_YN_Y);
		AccompanyDto board = null;
		
		//트렌젝션 구동에 핖요한 객체
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		try {
			// 조회수 증가
			sqlTemplate.update("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.updateAccompanyHits", accompany_no);
			// 읽기
			board = sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.getOneAccompany", hMap);
			transactionManager.commit(status);
		} catch (Exception e) {
			sqlTemplate.rollback();
			transactionManager.rollback(status);
		}
		
		return board;
	}

	@Override
	public int checkUserAccompany(int accompany_no, int mem_no) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("accompany_no", accompany_no);
		hMap.put("mem_no", mem_no);
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.checkUserAccompany", hMap);
	}

	@Override
	public int deleteAccompany(int accompany_no, int mem_no) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("accompany_no", accompany_no);
		hMap.put("mem_no", mem_no);
		//삭제이므로 글을 보이지 않게 한다.
		hMap.put("use_yn", Constant.SYNB_YN_N);
		return sqlTemplate.update("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.deleteAccompany", hMap);
	}

	@Override
	public int updateAccompany(AccompanyDto accompanyDto) {
		return sqlTemplate.update("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.updateAccompany", accompanyDto);
	}

	@Override
	public List<AccompanyDto> getRecentAccompanyList() {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("use_yn", Constant.SYNB_YN_Y);
		hMap.put("accompany_status_code", Constant.ACCOMPANY_TYPE_NOTICE);
		
		return sqlTemplate.selectList("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.getRecentAccompanyList", hMap);
	}

	@Override
	public int getAccompanyNextSeq() {
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.getAccompanyNextSeq");
	}

	@Override
	public AccompanyDto getOneAccompany(int accompany_no) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("accompany_no", accompany_no);
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.getOneAccompany", hMap);
	}
}
