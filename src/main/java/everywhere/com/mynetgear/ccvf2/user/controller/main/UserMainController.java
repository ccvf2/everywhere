package everywhere.com.mynetgear.ccvf2.user.controller.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
import everywhere.com.mynetgear.ccvf2.user.dto.search.SpotDtoExt;
import everywhere.com.mynetgear.ccvf2.user.service.main.UserMainService;

/**
 * @author 배성욱
 * @createDate 2015. 12. 11.
 * @described 유저메인페이지
 * @reference class
 */
@Controller
public class UserMainController {
	@Autowired
	private UserMainService userMainService;

	/**
	 * @author 배성욱
	 * @createDate 2016. 12. 11.
	 * @described 유저 메인페이지 호출
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/main/main.do")
	public ModelAndView userMainPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/user/main/userMain");
		//슬라이드 백그라운드 이미지
		SettingMainDto settingMainDto = userMainService.getOneBackGroundImg();
		//슬라이드 프론트 내용 & 이미지
		List<SettingMainDto> forground = userMainService.getOneForGroundImg();

		// 운영자 추천
		List<PlannerDto> suggetList = userMainService.getListAdminSuggest();
		// 좋아요 많은순
		List<PlannerDto> moreLikeList = userMainService.getListPlanner();
		// 핫플레이스
		List<SpotDtoExt> spotList = userMainService.getListSpotUserMain();
		
		//설정된 값이 없을 경우 기본이미지 셋팅
		if (StringUtils.equals(settingMainDto.getSetting_url(), Constant.SYNB_NULL)) {
			settingMainDto.setSetting_url("bg.png");
		}

		mav.addObject("backgroungImg", settingMainDto.getSetting_url());
		mav.addObject("forgroung", forground);

		mav.addObject("suggetList", suggetList);
		mav.addObject("moreLikeList", moreLikeList);
		mav.addObject("spotList", spotList);

		return mav;
	}

}
