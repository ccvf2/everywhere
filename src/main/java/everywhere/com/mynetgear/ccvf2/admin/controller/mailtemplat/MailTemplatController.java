package everywhere.com.mynetgear.ccvf2.admin.controller.mailtemplat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dto.mailtemplat.MailTemplateDto;
import everywhere.com.mynetgear.ccvf2.admin.service.mailtemplat.MailTemplatService;

/**
 * @author 배성욱
 * @createDate 2015. 12. 10.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Controller
public class MailTemplatController {
	@Autowired
	MailTemplatService mailTemplatService;
	
	@RequestMapping(value="/admin/mailtemplat/mailTemplatList.do", method=RequestMethod.GET)
	public ModelAndView mailTemplatList() {
		ModelAndView mav= new ModelAndView();
		mailTemplatService.mailTemplatList(mav);
		return mav;
	}
	@RequestMapping(value="/admin/mailtemplat/mailTemplatInsert.do", method=RequestMethod.GET)
	public ModelAndView mailTemplatInsertView() {
		ModelAndView mav= new ModelAndView("/admin/mailTemplat/mailTemplatInsert");
		return mav;
	}
	@RequestMapping(value="/admin/mailtemplat/mailTemplatInsert.do", method=RequestMethod.POST)
	public ModelAndView mailTemplatInsert(HttpServletRequest request, HttpServletResponse response, MailTemplateDto matilTemplateDto) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav.addObject("matilTemplateDto", matilTemplateDto);
		
		mailTemplatService.mailTemplatInsert(mav);
		return mav;
	}
}
