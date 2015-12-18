package everywhere.com.mynetgear.ccvf2.user.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
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

	@RequestMapping(value="/user/main/main.do", method=RequestMethod.GET)
	public ModelAndView userMainPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/user/main/userMain2");
		SettingMainDto settingMainDto=userMainService.getOneBackGroundImg();
		//메인페이지 띄우기
		String path="/attatchFile/admin/mainBackground/" + settingMainDto.getSetting_spot_code();
		mav.addObject("backgroungImg",path);
		return mav;
	}
	
}
