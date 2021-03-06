package everywhere.com.mynetgear.ccvf2.user.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="uandMe", defaultValue="S0001")String uandMe) {
		ModelAndView mav=new ModelAndView();
		System.out.println("1");
		mav.addObject("request", request);
		mav.addObject("response", response);
		System.out.println("2");
		// 코드값에 따라 자신의 페이지 이동 & 타회원 페이지 이동
		//String uandMe=request.getParameter("uandMe");
		
		System.out.println("uandMe : " + uandMe);
		if(StringUtils.equals(uandMe,Constant.MYPAGE_CODE_M)){
			System.out.println("마이페이지로 이동");
			System.out.println("3-0");
			mav=myPageService.myPage(mav);
		}else if(StringUtils.equals(uandMe,Constant.MYPAGE_CODE_U)){
			System.out.println("타회원 페이지로 이동");
			System.out.println("3-1");
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
	
	/**
	 * @author 김성광
	 * @createDate 2015. 12. 20.
	 * @described 프로필 사진 업데이트
	 * @param request
	 * @param response
	 * @param memberDto
	 * @return
	 */
	@RequestMapping(value = "/user/myPage/updateProfilePhoto.do", method = RequestMethod.POST)
	public ModelAndView updateProfilePhoto(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto",memberDto);
		mav = myPageService.updateProfilePhoto(mav);
	
		return mav;// new ModelAndView("/user/myPage/myPage");
	}
	
	@RequestMapping(value = "/user/myPage/searchFriends.do", method = RequestMethod.GET)
	public ModelAndView searchFriends(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav = myPageService.searchFriends(mav);
	
		return mav;
	}
	
	@RequestMapping(value = "/user/myPage/getBookMarkList.do", method = RequestMethod.GET)
	public ModelAndView getBookMarkList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav = myPageService.getBookMarkList(mav);
	
		return mav;
	}
	
	
	/**
	 * @author 김성광
	 * @createDate 2016. 1. 22.
	 * @described 마이페이지 북마크 해제
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/myPage/myPageDeleteBookMark.do", method = RequestMethod.GET)
	public ModelAndView myPageDeleteBookMark(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav = myPageService.myPageDeleteBookMark(mav);
		
		return mav;
	}
	
	
	/**
	 * @author 김성광
	 * @createDate 2016. 1. 24.
	 * @described 자신의 북마크리스트 내에서의  검색
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/myPage/getBookMarkSearchList.do", method = RequestMethod.GET)
	public ModelAndView getBookMarkSearchList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav = myPageService.getBookMarkSearchList(mav);
		
		return mav;
	}
}
