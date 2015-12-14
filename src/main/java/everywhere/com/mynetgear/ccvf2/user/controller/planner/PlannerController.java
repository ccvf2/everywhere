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
	
	@RequestMapping(value="/user/planner/plannerCreate.do", method=RequestMethod.GET)
	public ModelAndView insertPlanner(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/user/planner/NewFile");	
	}
	
	@RequestMapping(value="/user/planner/plannerCreate.do", method=RequestMethod.POST)
	public ModelAndView insertPlannerOK(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.insertPlanner(mav);
		return mav;
	}
	
	@RequestMapping(value="/user/planner/plannerList.do", method=RequestMethod.GET)
	public ModelAndView getPlannerList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.getPlannerList(mav);
		return mav;
	}
	
	@RequestMapping(value="/user/planner/readPlanner.do", method=RequestMethod.GET)
	public ModelAndView getOnePlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.getOnePlanner(mav);
		return mav;
	}
	
	@RequestMapping(value="/user/planner/writePlanner.do", method=RequestMethod.GET)
	public ModelAndView updatePlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.updatePlanner(mav);
		return mav;
	}
	
	@RequestMapping(value="/user/planner/updatePlanner.do", method=RequestMethod.POST)
	public ModelAndView updatePlannerOK(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.updatePlannerOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/user/planner/deletePlanner.do", method=RequestMethod.GET)
	public ModelAndView deletePlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.deletePlanner(mav);
		return mav;
	}
}
