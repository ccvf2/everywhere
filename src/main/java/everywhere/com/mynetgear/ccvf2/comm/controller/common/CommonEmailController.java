package everywhere.com.mynetgear.ccvf2.comm.controller.common;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.MailVO;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonEmailService;

/**
 * @author 곽성국
 * @createDate 2015. 12. 17.
 * @described 이메일 보내기 담당
 * @reference class
 */

@Controller
public class CommonEmailController {
	@Autowired
	private CommonEmailService commonEmailService;
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 18.
	 * @described 이메일 작성폼 요청 페이지
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/common/email/sendEmail.do", method=RequestMethod.GET)
	public ModelAndView sendEmail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.setViewName("common/email/sendEmail");
		return mav;
	}
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 18.
	 * @described 이메일 작성  OK
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/common/email/sendEmail.do", method=RequestMethod.POST)
	public ModelAndView sendEmailOk(HttpServletRequest request, HttpServletResponse response, MailVO mailVo) {
		ModelAndView mav= new ModelAndView();
		System.out.println("공통 이메일 보내기 컨트롤러");

		mav.addObject("request", request);
		mav.addObject("mailVo", mailVo);
		commonEmailService.sendEmailOk(mav);
		return mav;
	}
}
