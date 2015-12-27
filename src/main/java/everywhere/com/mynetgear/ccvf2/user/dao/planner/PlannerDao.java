package everywhere.com.mynetgear.ccvf2.user.dao.planner;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.user.dto.planner.ItemDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.MoneyDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

public interface PlannerDao {
	public int insertPlanner(PlannerDto planner);
	
	public int insertPlanner(PlannerDto planner, List<ItemDto> itemList, List<MoneyDto> moneyList);

	public int getPlannerNextSeq();
	
	public int getItemNextSeq();

	public List<PlannerDto> getPlannerListByMember(PlannerDto plannerDto);
	public List<ItemDto> getItemList(int planner_no);
	public List<MoneyDto> getMoneyList(int item_no);
	
	public List<PlannerDto> getPlannerListForAll();

	public PlannerDto getOnePlanner(int planner_no);

	public int updatePlanner(PlannerDto plannerDto);

	public int deletePlanner(int planner_no);

	public int updatePlannerStatus(PlannerDto plannerDto);

	public List<PlannerDto> getListPlanner_main();
}
