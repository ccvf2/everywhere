package everywhere.com.mynetgear.ccvf2.user.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.service.member.MemberService;

/**
 * @author 김준호
 * @createDate 2015. 12. 7.
 * @described 회원가입
 * @reference class
 */
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 7.
	 * @described 회원가입
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/member/register.do", method=RequestMethod.GET)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/user/member/register");
		
	}

}
