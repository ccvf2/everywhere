package everywhere.com.mynetgear.ccvf2.user.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 배성욱
 * @createDate 2015. 12. 11.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Controller
public class UserMainController {
	@RequestMapping(value="/user/main/main.do", method=RequestMethod.GET)
	public ModelAndView userMainPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/user/main/userMain2");
		return mav;	
	}
	
}
