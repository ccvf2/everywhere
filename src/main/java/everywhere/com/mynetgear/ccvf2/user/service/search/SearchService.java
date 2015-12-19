package everywhere.com.mynetgear.ccvf2.user.service.search;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 곽성국
 * @createDate 2015. 12. 18.
 * @described 검색 서비스 인터페이스
 * @reference class
 */
public interface SearchService {

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 18.
	 * @described 명소를 검색한다.
	 * @param mav
	 */
	void searchSpot(ModelAndView mav);

}
