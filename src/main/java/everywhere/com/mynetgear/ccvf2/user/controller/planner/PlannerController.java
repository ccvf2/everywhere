package everywhere.com.mynetgear.ccvf2.user.controller.planner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
import everywhere.com.mynetgear.ccvf2.user.service.planner.PlannerService;

/**
 * @author 안희진
 * @createDate 2015. 12. 14.
 * @described 일정 관련 기능(CRUD)을 위한 컨트롤러
 * @reference class
 */
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
	 * @described 위 Modal페이지에서 받은 request정보를 바탕으로 planner Table에 값을 저장하고 세부 planner 작성을 위한 페이지로 이동 
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

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 14.
	 * @described 사용자가 입력한 세부 planner 정보들을 처리 후 DB 저장
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/planner/writePlanner.do", method = RequestMethod.POST)
	public ModelAndView writePlannerOK(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.writePlanner(mav);
		return mav;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 15.
	 * @described planner read 페이지 호출
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/planner/readPlanner.do", method = RequestMethod.GET)
	public ModelAndView getOnePlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.getOnePlanner(mav);
		return mav;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 23.
	 * @described 사용자가 작성한 일정의 공개 유무 ajax 요청 처리
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/planner/lockPlanner.ajax", method = RequestMethod.GET)
	public ModelAndView lockPlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		plannerService.lockPlanner(mav);
		return null;
	}
	
	/**
	 * @author 안희진
	 * @createDate 2015. 12. 23.
	 * @described 사용자가 작성한 일정의 제목수정 ajax 요청 처리
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/planner/renamePlanner.ajax", method = RequestMethod.POST)
	public ModelAndView renamePlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		plannerService.renamePlanner(mav);
		return null;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 23.
	 * @described planner 삭제 처리
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/planner/deletePlanner.do", method = RequestMethod.GET)
	public ModelAndView deletePlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.deletePlanner(mav);
		return mav;
	}

	@RequestMapping(value = "/user/planner/plannerList.do", method = RequestMethod.GET)
	public ModelAndView getPlannerListGET(HttpServletRequest request, HttpServletResponse response,PlannerDto plannerDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		//초기값 설정
		plannerDto.setCurrentPage(1);
		plannerDto.setSearchCondition1(Constant.SYNB_NULL);
		plannerDto.setSearchCondition2(Constant.SYNB_NULL);
		plannerDto.setSearchWord1(Constant.SYNB_NULL);
		plannerDto.setStartRow(1);
		plannerDto.setEndRow(10);
		int showRow= 15;
		mav.addObject("showRow", showRow);
		mav.addObject("plannerDto", plannerDto);
		plannerService.getPlannerListForAll(mav);
		return mav;
	}

	@RequestMapping(value = "/user/planner/plannerList.do", method = RequestMethod.POST)
	public ModelAndView getPlannerListPOST(HttpServletRequest request, HttpServletResponse response, PlannerDto plannerDto,@RequestParam(value="showRow", defaultValue="9")int showRow) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("showRow", showRow);
		mav.addObject("plannerDto", plannerDto);
		plannerService.getPlannerListForAll(mav);
		return mav;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 25.
	 * @described planner의 수정 페이지 호출
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/planner/updatePlanner.do", method = RequestMethod.GET)
	public ModelAndView updatePlanner(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.updatePlanner(mav);
		return mav;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 27.
	 * @described planner의 수정 페이지에서 넘어온 정보값을 처리 후 DB에 저장
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/planner/updatePlanner.do", method = RequestMethod.POST)
	public ModelAndView updatePlannerOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		plannerService.updatePlannerOk(mav);
		return mav;
	}
}
