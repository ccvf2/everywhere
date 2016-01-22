package everywhere.com.mynetgear.ccvf2.user.service.planner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

/**
 * @author 안희진
 * @createDate 2015. 12. 14.
 * @described PlannerService 인터페이스
 * @reference class
 */
public interface PlannerService {

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 14.
	 * @described planner Modal의 값을 받아 처리
	 * @param mav
	 */
	public void insertPlanner(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 14.
	 * @described 상세 Planner의 정보값들을 처리 후 DB에 저장
	 * @param mav
	 */
	public void writePlanner(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 15.
	 * @described planner 읽기 처리
	 * @param mav
	 */
	public void getOnePlanner(ModelAndView mav);
	
	/**
	 * @author 안희진
	 * @createDate 2015. 12. 23.
	 * @described 사용자가 자신이 쓴 일정의 상태값을 변경요청 처리
	 * @param mav
	 */
	public void lockPlanner(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 23.
	 * @described 사용자가 자신이 쓴 일정의 상태를 삭제로 변경요청 처리
	 * @param mav
	 */
	public void deletePlanner(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 24.
	 * @described 회원이 공개한 일정들을 보여주는 페이지 처리
	 * @param mav
	 */
	public void getPlannerListForAll(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 24.
	 * @described 마이 페이지에서 해당 회원이 쓴 일정들이 보여질수 있도록 페이지 처리
	 * @param request
	 * @return
	 */
	public List<PlannerDto> getPlannerListByMember(HttpServletRequest request);
	
	/**
	 * @author 안희진
	 * @createDate 2015. 12. 25.
	 * @described planner의 수정 페이지 호출
	 * @param mav
	 */
	public void updatePlanner(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 28.
	 * @described planner의 수정 페이지에서 넘어온 정보값을 처리 후 DB에 저장
	 * @param mav
	 */
	public void updatePlannerOk(ModelAndView mav);
}
