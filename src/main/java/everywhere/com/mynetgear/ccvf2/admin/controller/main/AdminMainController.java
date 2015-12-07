package everywhere.com.mynetgear.ccvf2.admin.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.service.main.AdminMainService;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;

/**
 * @author 배성욱
 * @createDate 2015. 12. 5.
 * @described 관리자 메인페이지 컨트롤러
 * @reference Controller
 */
@Controller
public class AdminMainController {
	@Autowired
	private AdminMainService adminMainService;
	@Autowired
	private CommonCodeService commonCodeService;

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 5.
	 * @return
	 */
	@RequestMapping(value="/admin/main/main.do", method=RequestMethod.GET)
	public ModelAndView mainPage() {
		ModelAndView mav= new ModelAndView();
		System.out.println("컨트롤러");
		adminMainService.mainPage(mav);
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value="/admin/commoncode/code.do", method=RequestMethod.GET)
	public ModelAndView showCode() {
		ModelAndView mav= new ModelAndView();
		commonCodeService.callCodeSettingPage(mav);
		return mav;
	}
	@RequestMapping(value="/admin/commoncode/code.do", method=RequestMethod.POST)
	public ModelAndView settingCode(HttpServletRequest request, HttpServletResponse response,CommonCodeDto dto) {
		ModelAndView mav= new ModelAndView();
		System.out.println("입력요청");
		mav.addObject("request",request);
		mav.addObject("commonCodeDto",dto);
		commonCodeService.callCodeSetting(mav);
		return mav;
	}
}
