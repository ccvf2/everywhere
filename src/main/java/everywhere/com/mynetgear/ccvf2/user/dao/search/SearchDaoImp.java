package everywhere.com.mynetgear.ccvf2.user.dao.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 19.
 * @described 검색관련 DAO 구현부
 * @reference class
 */
@Component
public class SearchDaoImp implements SearchDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	
	@Override
	public int getSpotCount(String searchValue) {
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.search.getSpotCount", searchValue);
	}

	@Override
	public int getPlannerCount(String searchValue) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("searchValue", searchValue);
		hMap.put("use_yn", Constant.SYNB_YN_Y);
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.search.getPlannerCount", hMap);
	}

	@Override
	public List<SpotDto> getSpotList(int startRow, int endRow, String searchValue) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("searchValue", searchValue);
		
		return sqlTemplate.selectList("everywhere.com.mynetgear.ccvf2.user.mapper.search.getSpotList", hMap);
	}

	@Override
	public List<PlannerDao> getPlannerList(int startRow, int endRow, String searchValue) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("searchValue", searchValue);
		hMap.put("use_yn", Constant.SYNB_YN_Y);
		return sqlTemplate.selectList("everywhere.com.mynetgear.ccvf2.user.mapper.search.getPlannerList", hMap);
	}

}
