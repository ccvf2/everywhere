package everywhere.com.mynetgear.ccvf2.user.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.service.mypage.MyPageService;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value="/user/myPage/myPage.do", method=RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("/user/myPage/myPage");
	}
}
