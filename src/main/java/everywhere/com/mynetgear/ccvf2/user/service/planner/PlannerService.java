package everywhere.com.mynetgear.ccvf2.user.service.planner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

public interface PlannerService {

	public void insertPlanner(ModelAndView mav);

	public List<PlannerDto> getPlannerListByMember(HttpServletRequest request);
	
	public void getPlannerListForAll(ModelAndView mav);

	public void getOnePlanner(ModelAndView mav);

	public void writePlanner(ModelAndView mav);

	public void writePlannerOk(ModelAndView mav);

	public void lockPlanner(ModelAndView mav);

	public void deletePlanner(ModelAndView mav);

	public void getSpotList(ModelAndView mav);
	
	public void updatePlanner(ModelAndView mav);

	public void updatePlannerOk(ModelAndView mav);
}
