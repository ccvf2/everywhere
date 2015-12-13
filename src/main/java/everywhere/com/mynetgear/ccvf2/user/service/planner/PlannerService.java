package everywhere.com.mynetgear.ccvf2.user.service.planner;

import org.springframework.web.servlet.ModelAndView;

public interface PlannerService {

	public void insertPlanner(ModelAndView mav);

	public void getPlannerList(ModelAndView mav);

	public void getOnePlanner(ModelAndView mav);

	public void updatePlanner(ModelAndView mav);

	public void updatePlannerOk(ModelAndView mav);

	public void deletePlanner(ModelAndView mav);

}
