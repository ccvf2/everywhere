package everywhere.com.mynetgear.ccvf2.user.dao.planner;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.user.dto.planner.ItemDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.MoneyDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

public interface PlannerDao {
	public int insertPlanner(PlannerDto planner);

	public int insertPlanner(PlannerDto planner, List<ItemDto> itemList);

	public PlannerDto getOnePlanner(int planner_no);

	public List<ItemDto> getItemList(int planner_no);

	public List<MoneyDto> getMoneyList(int item_no);
	
	public int updatePlannerStatus(PlannerDto plannerDto);
	
	public int updatePlannerTitle(PlannerDto plannerDto);

	public int getPlannerListForAllCount(PlannerDto plannerDto);
	
	public List<PlannerDto> getPlannerListForAll(PlannerDto plannerDto);

	public List<PlannerDto> getPlannerListByMember(PlannerDto plannerDto);

	public int deletePlanner(int planner_no);

	public int updatePlanner(PlannerDto plannerDto, List<ItemDto> itemList);
	
	public String getPlannerImage(int planner_no);
	public String getItemImage(int item_no);

	public List<PlannerDto> getListPlanner_main();
	public List<PlannerDto> getListAdminSuggest();
}
