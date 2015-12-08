package everywhere.com.mynetgear.ccvf2.user.service.accompany;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 곽성국
 * @createDate 2015. 12. 7.
 * @described 동행구하기 Service.
 * @reference class
 */
public interface AccompanyService {

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 7.
	 * @described 동행구하기 쓰기 페이지
	 * @param mav
	 */
	void insertAccompany(ModelAndView mav);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 7.
	 * @described 동행구하기 쓰기 확인 페이지
	 * @param mav
	 */
	void insertOkAccompany(ModelAndView mav);

}
