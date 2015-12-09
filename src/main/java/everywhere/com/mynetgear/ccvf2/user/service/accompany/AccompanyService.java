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

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 리스트 페이지
	 * @param mav
	 */
	void getAccompanyList(ModelAndView mav);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 */
	void mainAccompany(ModelAndView mav);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 read
	 * @param mav
	 */
	void readAccompany(ModelAndView mav);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 9.
	 * @described 동행구하기 delete
	 * @param mav
	 */
	void deleteAccompany(ModelAndView mav);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 9.
	 * @described 동행구하기 update
	 * @param mav
	 */
	void updateAccompany(ModelAndView mav);

}
