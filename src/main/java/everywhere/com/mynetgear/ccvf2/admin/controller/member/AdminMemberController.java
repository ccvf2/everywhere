package everywhere.com.mynetgear.ccvf2.admin.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.service.member.AdminMemberService;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 컨트롤러
 * @reference class
 */
@Controller
public class AdminMemberController {
	@Autowired
	private AdminMemberService adminMemberService;
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 11.
	 * @described 관리자 회원관리 리스트
	 * @return
	 */
	@RequestMapping(value="/admin/member/adminMemberList.do", method=RequestMethod.GET)
	public ModelAndView adminMemberList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav= new ModelAndView();
		System.out.println("adminMember 컨트롤러");

		mav.addObject("request", request);
		adminMemberService.adminMemberList(mav);
		return mav;
	}
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 17.
	 * @described 관리자 회원관리에서 회원상태를 바꿈
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/admin/member/adminMemberUpdate.ajax", method=RequestMethod.GET)
	public ModelAndView adminMemberStatusUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		System.out.println("adminMember 회원 정보 수정");
		
		mav.addObject("request", request);
		mav.addObject("response", response);
		adminMemberService.adminMemberStatusUpdate(mav);
		return null;
		
	}
}
