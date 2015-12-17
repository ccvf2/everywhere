package everywhere.com.mynetgear.ccvf2.comm.controller.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/common/email/sendEmail.do", method=RequestMethod.GET)
	public ModelAndView sendEmail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav= new ModelAndView();
		System.out.println("공통 이메일 보내기 컨트롤러");

		mav.addObject("request", request);
		commonEmailService.sendEmail(mav);
		return mav;
	}
}
