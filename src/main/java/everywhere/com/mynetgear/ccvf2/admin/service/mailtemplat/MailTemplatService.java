package everywhere.com.mynetgear.ccvf2.admin.service.mailtemplat;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 배성욱
 * @createDate 2015. 12. 10.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public interface MailTemplatService {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 10.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 */
	public void mailTemplatList(ModelAndView mav);
	
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 10.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 */
	public void mailTemplatInsert(ModelAndView mav);
}
