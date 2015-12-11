package everywhere.com.mynetgear.ccvf2.user.service.planner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

@Component
public class PlannerServiceImp implements PlannerService {
	@Autowired
	private PlannerDao plannerDao;
	@Autowired
	private MemberDao memberDao;

	@Override
	public void insertPlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String mem_no = request.getParameter("mem_no");
		String title = request.getParameter("title");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String planner_ba_code = request.getParameter("planner_ba_code");
		
		PlannerDto plannerDto = new PlannerDto();
		plannerDto.setPlanner_no(plannerDao.getPlannerNextSeq());
		plannerDto.setMem_no(Integer.parseInt(mem_no));
		plannerDto.setTitle(title);
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			plannerDto.setStart_date(sdf.parse(start_date));
			if(!end_date.equals("")) plannerDto.setEnd_date(sdf.parse(end_date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		plannerDto.setPlanner_ba_code(planner_ba_code);
		plannerDto.setUse_yn(Constant.SYNB_YN_N);
		System.out.println(plannerDto);
		
		int check = plannerDao.insertPlanner(plannerDto);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.addObject("plannerDto", plannerDto);
		mav.setViewName("user/planner/plannerWrite");
	}

	@Override
	public void getPlannerList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		
		List<PlannerDto> plannerList = plannerDao.getPlannerList(mem_no);
		
		mav.addObject("plannerList", plannerList);
		mav.setViewName("user/planner/plannerList");
	}

	@Override
	public void getOnePlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));
		
		PlannerDto planner = plannerDao.getOnePlanner(planner_no);
		
		mav.addObject("planner", planner);
		mav.setViewName("user/planner/plannerRead");
	}

	@Override
	public void updatePlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));
		
		PlannerDto plannerDto = plannerDao.getOnePlanner(planner_no);
		
		mav.addObject("plannerDto", plannerDto);
		mav.setViewName("user/planner/plannerWrite");
	}

	@Override
	public void updatePlannerOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");		
		
		PlannerDto plannerDto = new PlannerDto();
		plannerDto.setPlanner_no(Integer.parseInt(request.getParameter("planner_no")));
		plannerDto.setTitle(request.getParameter("title"));
		plannerDto.setMemo(request.getParameter("memo"));
		
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
				
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			plannerDto.setStart_date(sdf.parse(start_date));
			if(!end_date.equals("")) plannerDto.setEnd_date(sdf.parse(end_date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String use_yn = request.getParameter("use_yn");
		System.out.println(use_yn);
		plannerDto.setUse_yn(use_yn.equals(Constant.SYNB_YN_Y) ? Constant.SYNB_YN_Y :Constant.SYNB_YN_N);
		
		System.out.println(plannerDto);
		int check = plannerDao.updatePlanner(plannerDto);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);
		
		mav.addObject("planner_no", plannerDto.getPlanner_no());
		mav.addObject("check", check);
		mav.setViewName("user/planner/plannerWriteOk");
	}
}
