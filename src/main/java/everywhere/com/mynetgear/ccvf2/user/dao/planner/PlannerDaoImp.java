package everywhere.com.mynetgear.ccvf2.user.dao.planner;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

@Component
public class PlannerDaoImp implements PlannerDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Override
	public int getPlannerNextSeq() {
		return sqlTemplate.selectOne("get_planner_seq_no");
	}
	
	@Override
	public int insertPlanner(PlannerDto planner) {
		return sqlTemplate.insert("planner_insert", planner);
	}

	@Override
	public List<PlannerDto> getPlannerList(int mem_no) {
		return sqlTemplate.selectList("get_planner_list_by_mem_no", mem_no);
	}

	@Override
	public PlannerDto getOnePlanner(int planner_no) {
		return sqlTemplate.selectOne("get_planner_item", planner_no);
	}

	@Override
	public int updatePlanner(PlannerDto planner) {
		return sqlTemplate.update("planner_update", planner);
	}

}
