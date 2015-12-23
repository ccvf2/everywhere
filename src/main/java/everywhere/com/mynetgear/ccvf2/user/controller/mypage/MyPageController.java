package everywhere.com.mynetgear.ccvf2.user.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.service.mypage.MyPageService;

/**
 * @author 김성광
 * @createDate 2015. 12. 22.
 * @described 마이페이지 컨트롤러
 * @reference class
 */
@Controller
public class MyPageController {
	@Autowired
	private MyPageService myPageService;

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 19.
	 * @described 마이페이지로 이동
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/myPage/myPage.do", method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		// 코드값에 따라 자신의 페이지 이동 & 타회원 페이지 이동
		String uandMe=request.getParameter("uandMe");
		
		if(StringUtils.equals(uandMe,Constant.MYPAGE_CODE_M)){
			//System.out.println("마이페이지로 이동");
			mav=myPageService.myPage(mav);
		}else{
			//System.out.println("타회원 페이지로 이동");
			mav=myPageService.moveUserPage(mav);
		}
		
		return mav;
	}
	
	/**
	 * @author 김성광
	 * @createDate 2015. 12. 19.
	 * @described 친구추가
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/myPage/mateInsert.do", method = RequestMethod.GET)
	public ModelAndView mateInsert(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav = myPageService.mateInsert(mav);
	
		return mav;// new ModelAndView("/user/myPage/myPage");
	}
	
	/**
	 * @author 김성광
	 * @createDate 2015. 12. 19.
	 * @described 친구 삭제
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/myPage/mateDelete.do", method = RequestMethod.GET)
	public ModelAndView mateDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav = myPageService.mateDelete(mav);
	
		return mav;// new ModelAndView("/user/myPage/myPage");
	}
		
	/**
	 * @author 김성광
	 * @createDate 2015. 12. 19.
	 * @described 친구 목록
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/myPage/friends.do", method = RequestMethod.GET)
	public ModelAndView getListFriends(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav = myPageService.getListFriends(mav);
	
		return mav;// new ModelAndView("/user/myPage/myPage");
	}
	
	@RequestMapping(value = "/user/myPage/updateProfilePhoto.do", method = RequestMethod.POST)
	public ModelAndView updateProfilePhoto(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto",memberDto);
		mav = myPageService.updateProfilePhoto(mav);
	
		return mav;// new ModelAndView("/user/myPage/myPage");
	}
	
	
}
