package everywhere.com.mynetgear.ccvf2.user.controller.accompany;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	 * @createDate 2015. 12. 7.
	 * @described 동행구하기 게시판 쓰기
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
	 * @createDate 2015. 12. 7.
	 * @described 동행구하기 게시판 쓰기 확인
	 * @return
	 */
	@RequestMapping(value="/user/accompany/accompanyWriteOk.do" ,method=RequestMethod.POST)
	public ModelAndView insertOkAccompany(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		accompanyService.insertOkAccompany(mav);
		
		return mav;
	}
}
