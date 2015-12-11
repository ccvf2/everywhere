package everywhere.com.mynetgear.ccvf2.admin.controller.mailtemplat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
		System.out.println("mailTemplatList 컨트롤러");
		mailTemplatService.mailTemplatList(mav);
		return mav;
	}
}
