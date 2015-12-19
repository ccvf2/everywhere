package everywhere.com.mynetgear.ccvf2.comm.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import everywhere.com.mynetgear.ccvf2.comm.service.login.LoginService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;


/**
 * @author 배성욱
 * @createDate 2015. 12. 14.
 * @described 로그인을 처리하는 Controller
 * @reference class
 */
@Controller
public class LoginController {
	@Autowired
	LoginService loginService; 

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 14.
	 * @described 매소드의 용도를 적어주세요
	 * @param request
	 * @param response
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/user/login/login.do", method = RequestMethod.POST)
	public ModelAndView HandleMemberLogin(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("memberLogin") MemberDto dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", dto);
		loginService.HandleMemberLogin(mav);
		System.out.println("로그인성공");
		
		// 불필요한 파라미터 제거
		String url = "/user/main/main.do";
		RedirectView redirectView = new RedirectView(url);
		redirectView.setExposeModelAttributes(false);
		
		return new ModelAndView(redirectView);
	}

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 15.
	 * @described 로그인페이지로 이동
	 * @param request
	 * @param response
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/user/login/login.do", method = RequestMethod.GET)
	public ModelAndView memberLoginpage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/common/login/login");
		return mav;
	}
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 19.
	 * @described 로그인페이지로 이동(모달)
	 * @param request
	 * @param response
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/user/login/loginModal.do", method = RequestMethod.GET)
	public ModelAndView memberLoginModal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/common/login/loginModal");
		return mav;
	}

	/* 로그아웃 */
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 15.
	 * @described 로그아웃 기능 구현
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/user/login/loginout.do", method = RequestMethod.GET)
	public ModelAndView requestLogout(HttpServletRequest request) {
		System.out.println(Constant.LOG_ID1+"로그아웃");
		// 세션처리
		HttpSession session = request.getSession();
		session.invalidate();

		// 불필요한 파라미터 제거
		String url = "/user/main/main.do";
		RedirectView redirectView = new RedirectView(url);
		redirectView.setExposeModelAttributes(false);
		
		return new ModelAndView(redirectView);

	}


	
/*	public static void main(String[] args) {
		System.out.println("update tbl_law_admin set admin_password='" + SecurityUtil.Sha256Encrypt("admin","dudansqjqfud!")+"' where admin_id='admin';");
	}*/
}
