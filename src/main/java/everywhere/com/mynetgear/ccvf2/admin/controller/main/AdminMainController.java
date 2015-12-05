package everywhere.com.mynetgear.ccvf2.admin.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.service.main.AdminMainService;

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

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 5.
	 * @return
	 */
	@RequestMapping(value="/admin/main/main.do",method=RequestMethod.GET)
	public ModelAndView mainPage() {
		ModelAndView mav= new ModelAndView();
		System.out.println("컨트롤러");
		adminMainService.mainPage(mav);
		return mav;
	}
}
