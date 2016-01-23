package everywhere.com.mynetgear.ccvf2.admin.dto.settingmain;

import java.util.Map;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.EverywhereDefaultDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

/**
 * @author 배성욱
 * @createDate 2016. 1. 23.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class SettingMainDtoExt extends EverywhereDefaultDto{
	private String settingCRUD="";
	private Map<String, PlannerDto> planner;
	public String getSettingCRUD() {
		return settingCRUD;
	}
	public void setSettingCRUD(String settingCRUD) {
		this.settingCRUD = settingCRUD;
	}
	public Map<String, PlannerDto> getPlanner() {
		return planner;
	}
	public void setPlanner(Map<String, PlannerDto> planner) {
		this.planner = planner;
	}


}
