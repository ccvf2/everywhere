package everywhere.com.mynetgear.ccvf2.admin.controller.mailtemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dto.mailtemplat.MailTemplateDto;
import everywhere.com.mynetgear.ccvf2.admin.service.mailtemplate.MailTemplateService;

/**
 * @author 배성욱
 * @createDate 2015. 12. 10.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Controller
public class MailTemplateController {
	@Autowired
	MailTemplateService mailTemplateService;
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 2.
	 * @described 관리자메일템플릿 목록을 출력
	 * @return
	 */
	@RequestMapping(value="/admin/mailtemplate/mailTemplateList.do")
	public ModelAndView mailTemplatList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav= new ModelAndView();
		mailTemplateService.mailTemplateList(mav);
		return mav;
	}
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 6.
	 * @described 메일템플릿등록 화면은 CALL
	 * @param request
	 * @param response
	 * @param matilTemplateDto
	 * @return
	 */
	@RequestMapping(value="/admin/mailtemplate/mailTemplateInsert.do", method=RequestMethod.GET)
	public ModelAndView mailTemplatInsertView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("request", request); 
		mav.addObject("response", response);
		mailTemplateService.mailTemplateInsertView(mav);
		return mav;
	}
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 14.
	 * @described 메일템플릿 등록을 실행.
	 * @param request
	 * @param response
	 * @param matilTemplateDto
	 * @return
	 */
	@RequestMapping(value="/admin/mailtemplate/mailTemplateInsert.do", method=RequestMethod.POST)
	public ModelAndView mailTemplatInsert(HttpServletRequest request, HttpServletResponse response, MailTemplateDto matilTemplateDto) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav.addObject("matilTemplateDto", matilTemplateDto);
		mailTemplateService.mailTemplateInsert(mav);
		return mav;
	}
	
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 20.
	 * @described 메일템플릿 작성 전 활성화된 폼이 있는지 확인.
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/admin/mailtemplate/mailTemplateActiveCheck.ajax")
	public ModelAndView mailTemplateActiveCheck(HttpServletRequest request, HttpServletResponse response) {
	ModelAndView mav= new ModelAndView();
	mav.addObject("request",request);
	mav.addObject("response",response);
	mailTemplateService.mailTemplateActiveCheck(mav);
	return null;
	}
}
