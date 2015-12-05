/**
 * @author 배성욱
 * @createDate 2015. 12. 5.
 * @described 관리자 메인페이지 서비스 인터페이스
 * @reference AdminMainService-Interface
 */
package everywhere.com.mynetgear.ccvf2.admin.service.main;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 배성욱
 * @createDate 2015. 12. 6.
 * @described AdminMainService 인터페이스
 * @reference interface
 */
public interface AdminMainService {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 5.
	 * @described 관리자 메인페이지 서비스 인터페이스
	 * @reference AdminMainService-interface
	 * @param mav 
	 */
	public void mainPage(ModelAndView mav);
}
