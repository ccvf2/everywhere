package everywhere.com.mynetgear.ccvf2.user.controller.planner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
import everywhere.com.mynetgear.ccvf2.user.service.planner.PlannerService;

@Controller
public class PlannerController {
	@Autowired
	private PlannerService plannerService;

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 14.
	 * @described 여행 일정/계획을 만들기 위한 Modal 페이지 호출
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/planner/plannerCreate.do", method = RequestMethod.GET)
	public ModelAndView insertPlanner(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/user/planner/newPlanner");
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 14.
	 * @described 위 Modal페이지에서 받은 request정보를 바탕으로 planner Table에 값을 저장하고 planner 작성을 위한 페이지로 이동 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/planner/plannerCreate.do", method = RequestMethod.POST)
	public ModelAndView insertPlannerOK(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.insertPlanner(mav);
		return mav;
	}

	@RequestMapping(value = "/user/planner/plannerList.do", method = RequestMethod.GET)
	public ModelAndView getPlannerList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.getPlannerListForAll(mav);
		return mav;
	}

	@RequestMapping(value = "/user/planner/readPlanner.do", method = RequestMethod.GET)
	public ModelAndView getOnePlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.getOnePlanner(mav);
		return mav;
	}

	@RequestMapping(value = "/user/planner/writePlanner.do", method = RequestMethod.GET)
	public ModelAndView writePlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.writePlanner(mav);
		return mav;
	}

	@RequestMapping(value = "/user/planner/writePlanner.do", method = RequestMethod.POST)
	public ModelAndView writePlannerOK(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.writePlannerOk(mav);
		return mav;
	}

	@RequestMapping(value = "/user/planner/lockPlanner.ajax", method = RequestMethod.GET)
	public ModelAndView lockPlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		plannerService.lockPlanner(mav);
		return null;
	}

	@RequestMapping(value = "/user/planner/deletePlanner.do", method = RequestMethod.GET)
	public ModelAndView deletePlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.deletePlanner(mav);
		return mav;
	}
}
