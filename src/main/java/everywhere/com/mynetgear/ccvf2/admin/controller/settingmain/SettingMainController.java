package everywhere.com.mynetgear.ccvf2.admin.controller.settingmain;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
import everywhere.com.mynetgear.ccvf2.admin.service.settingmain.SettingMainService;

/**
 * @author 배성욱
 * @createDate 2015. 12. 18.
 * @described 서비스 화면의 메인을 바꾸는 기능을 위한 컨트롤러
 * @reference class
 */
@Controller
public class SettingMainController {
	@Autowired
	private SettingMainService settingMainService;
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 18.
	 * @described 메인화면 셋팅 페이지를 부름
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/admin/settingMain/settingMain.do", method=RequestMethod.GET)
	public ModelAndView settingMainView(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/admin/settingMain/settingMain");	
	}
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 18.
	 * @described 백그라운드 이미지 변경
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/admin/settingMain/backgroundImgChange.do", method=RequestMethod.POST)
	public ModelAndView backgroundImgChange(HttpServletRequest request, HttpServletResponse response,SettingMainDto dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("settingMainDto", dto);
		settingMainService.insertBackgroundImgChange(mav);
		return mav;	
	}
}