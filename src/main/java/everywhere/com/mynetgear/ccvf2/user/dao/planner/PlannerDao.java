package everywhere.com.mynetgear.ccvf2.user.dao.planner;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

public interface PlannerDao {
	public int insertPlanner(PlannerDto planner);

	public int getPlannerNextSeq();

	public List<PlannerDto> getPlannerList(int mem_no);

	public PlannerDto getOnePlanner(int planner_no);

	public int updatePlanner(PlannerDto plannerDto);
}
