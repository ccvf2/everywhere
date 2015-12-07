package everywhere.com.mynetgear.ccvf2.comm.service.commoncode;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 배성욱
 * @createDate 2015. 12. 7.
 * @described 공통코드 서비스 인터페이스
 * @reference Interface
 */
public interface CommonCodeService {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 코드셋팅페이지 요청
	 * @param mav 
	 */
	public void callCodeSettingPage(ModelAndView mav);
	
	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 코드셋팅요청
	 * @param request 
	 * @param response 
	 */
	public void callCodeSetting(ModelAndView mav);

}
