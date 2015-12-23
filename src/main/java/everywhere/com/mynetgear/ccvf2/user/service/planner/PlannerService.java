package everywhere.com.mynetgear.ccvf2.user.service.planner;

import org.springframework.web.servlet.ModelAndView;

public interface PlannerService {

	public void insertPlanner(ModelAndView mav);

	public void getPlannerListByMember(ModelAndView mav);
	
	public void getPlannerListForAll(ModelAndView mav);

	public void getOnePlanner(ModelAndView mav);

	public void writePlanner(ModelAndView mav);

	public void writePlannerOk(ModelAndView mav);

	public void deletePlanner(ModelAndView mav);

	public void getSpotList(ModelAndView mav);
}
