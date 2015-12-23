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

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 19.
	 * @described 스케줄을 검색한다.
	 * @param mav
	 */
	void searchPlanner(ModelAndView mav);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 19.
	 * @described 명소 및 스케줄을 검색한다.
	 * @param mav
	 */
	void searchTotal(ModelAndView mav);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 21.
	 * @described ajax요청을 통해 명소 리스트를 json으로 반환함
	 * @param mav
	 */
	void getSpotList(ModelAndView mav);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 23.
	 * @described ajax요청을 통해 하단에 붙일 명소 리스트르 json으로 반환
	 * @param mav
	 */
	void getMoreSpotList(ModelAndView mav);

}
