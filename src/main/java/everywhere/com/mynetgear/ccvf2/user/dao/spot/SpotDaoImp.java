package everywhere.com.mynetgear.ccvf2.user.dao.spot;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

/**
 * @author 안희진
 * @createDate 2015. 12. 7.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class SpotDaoImp implements SpotDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	/* 트랜젝션 처리시 */
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Override
	public int insertSpot(SpotDto spotDto) {
		return sqlTemplate.insert("insert_spot", spotDto);
	}

	@Override
	public List<SpotDto> getSpotList(SpotDto spotDto) {
		return sqlTemplate.selectList("select_spot_list_for_planner", spotDto);
	}

	@Override
	public List<SpotDto> getSpotListForPlanner(SpotDto spotDto, int currNum) {
		// 이거
		Map <String, String> hmap = new HashMap<String, String>();
		return sqlTemplate.selectList("select_spot_list", spotDto);
	}
	
	@Override
	public List<SpotDto> getSpotAllList() {
		return sqlTemplate.selectList("select_spot_all_list");
	}

	@Override
	public List<SpotDto> getSpotAllListForPlanner() {
		// 이거
		return sqlTemplate.selectList("select_spot_all_list_for_planner");
	}

	@Override
	public SpotDto getOneSpot(int spot_no) {
		return sqlTemplate.selectOne("select_one_spot", spot_no);
	}

	@Override
	public int updateSpot(SpotDto spotDto) {
		return sqlTemplate.update("update_spot", spotDto);
	}
	
	@Override
	public int deleteSpot(int spot_no) {
		return sqlTemplate.delete("delete_spot", spot_no);
	}

	@Override
	public int getSpotNextSeq() {
		return sqlTemplate.selectOne("get_spot_seq_no");
	}
	
}
