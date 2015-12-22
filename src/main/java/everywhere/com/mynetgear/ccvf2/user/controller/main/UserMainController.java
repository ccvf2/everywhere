package everywhere.com.mynetgear.ccvf2.user.controller.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
import everywhere.com.mynetgear.ccvf2.user.service.main.UserMainService;

/**
 * @author 배성욱
 * @createDate 2015. 12. 11.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Controller
public class UserMainController {
	@Autowired
	private UserMainService userMainService;

	
	
	@RequestMapping(value="/user/main/main.do")
	public ModelAndView userMainPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/user/main/userMain2");
		SettingMainDto settingMainDto=userMainService.getOneBackGroundImg();
		List<SettingMainDto> forground=userMainService.getOneForGroundImg();
		
		//메인페이지 띄우기
		//List<PlannerDto> plannerList=plannerService.getPlannerList(인자값);
		
		//가장 최근에 등록된 플레너
		List<PlannerDto> list1=userMainService.getListPlanner();
		List<PlannerDto> list2=userMainService.getListPlanner();
		List<PlannerDto> list3=userMainService.getListPlanner();
		List<PlannerDto> list4=userMainService.getListPlanner();

		mav.addObject("list1",list1);
		mav.addObject("list2",list2);
		mav.addObject("list3",list3);
		mav.addObject("list4",list4);
		
		
		mav.addObject("forgroung", forground);
		mav.addObject("backgroungImg",settingMainDto.getSetting_url());
		return mav;
	}
	
}
