package everywhere.com.mynetgear.ccvf2.admin.service.mailtemplate;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 배성욱
 * @createDate 2015. 12. 10.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public interface MailTemplateService {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 10.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 */
	public void mailTemplateList(ModelAndView mav);
	
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 10.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 */
	public void mailTemplateInsertView(ModelAndView mav);
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 10.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 */
	public void mailTemplateInsert(ModelAndView mav);
	
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 20.
	 * @described 메일템플릿 작성 전 활성화된 폼이 있는지 확인.
	 * @param mav
	 */
	public void mailTemplateActiveCheck(ModelAndView mav);
	
}
