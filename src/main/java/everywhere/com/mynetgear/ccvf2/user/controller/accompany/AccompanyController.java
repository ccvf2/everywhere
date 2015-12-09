package everywhere.com.mynetgear.ccvf2.user.controller.accompany;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.user.service.accompany.AccompanyService;


/**
 * @author 곽성국
 * @createDate 2015. 12. 7.
 * @described 동행구하기 컨트롤러
 * @reference class
 */
@Controller
public class AccompanyController {
	@Autowired
	private AccompanyService accompanyService;

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 테스트용 메인 페이지 메핑
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/accompany/accompanyMain.do" ,method=RequestMethod.GET)
	public ModelAndView mainAccompany(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		accompanyService.mainAccompany(mav);
		
		return mav;
	}
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 7.
	 * @described 동행구하기 게시판 쓰기
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/accompany/accompanyWrite.do" ,method=RequestMethod.GET)
	public ModelAndView insertAccompany(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		accompanyService.insertAccompany(mav);
		
		return mav;
	}

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 게시판 쓰기 확인
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/accompany/accompanyWriteOk.do" ,method=RequestMethod.POST)
	public ModelAndView insertOkAccompany(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		accompanyService.insertOkAccompany(mav);
		
		return mav;
	}
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 리스트
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/accompany/accompanyList.do" ,method=RequestMethod.GET)
	public ModelAndView getAccompanyList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		accompanyService.getAccompanyList(mav);
		
		return mav;
	}
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 읽기
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/accompany/accompanyRead.do" ,method=RequestMethod.GET)
	public ModelAndView readAccompany(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		accompanyService.readAccompany(mav);
		
		return mav;
	}
	
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 9.
	 * @described 동행구하기 삭제
	 * @param request
	 * @param response
	 * @return
	 */

	@RequestMapping(value="/user/accompany/accompanyDelete.do" ,method=RequestMethod.GET)
	public ModelAndView deleteAccompany(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		accompanyService.deleteAccompany(mav);
		
		return mav;
	}
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 9.
	 * @described 동행구하기 수정
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/accompany/accompanyUpdate.do" ,method=RequestMethod.GET)
	public ModelAndView updateAccompany(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		accompanyService.updateAccompany(mav);
		
		return mav;
	}
	
	

}
