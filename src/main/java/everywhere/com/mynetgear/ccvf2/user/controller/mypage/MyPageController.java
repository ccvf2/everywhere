package everywhere.com.mynetgear.ccvf2.user.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.service.mypage.MyPageService;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value="/user/myPage/myPage.do", method=RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response){
		
//		request.getAttribute(name)
		
		return new ModelAndView("/user/myPage/myPage");
	}
	
	@RequestMapping(value="/user/myPage/userPage.do", method=RequestMethod.GET)
	public ModelAndView userPage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav=myPageService.moveUserPage(mav);
		
		return mav;// new ModelAndView("/user/myPage/myPage");
	}
	
//	MemberDto member = memberDao.getOneMemberInfo(dto);
//
//	// 세션처리
//	HttpSession session = request.getSession();
//	session.setAttribute(Constant.SYNN_LOGIN_OBJECT, member);
	
//	/user/myPage/userPage.do?mem_no=73
}
