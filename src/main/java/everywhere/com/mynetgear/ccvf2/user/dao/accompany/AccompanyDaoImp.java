package everywhere.com.mynetgear.ccvf2.user.dao.accompany;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
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

	@Override
	public int insertAccompany(AccompanyDto accompanyDto) {
		//EverywhereAspect.logger.info(EverywhereAspect.logMsg +accompanyDto.getEnd_date());
		 
		return sqlTemplate.insert("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.insertAccompany", accompanyDto);
	}

	@Override
	public int getAccompanyCount() {
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.getAccompanyCount");
	}

	@Override
	public List<AccompanyDto> getAccompanyList(int startRow, int endRow) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlTemplate.selectList("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.getAccompanyList", hMap);
	}
	
}
