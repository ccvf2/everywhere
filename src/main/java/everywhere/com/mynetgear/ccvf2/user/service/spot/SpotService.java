package everywhere.com.mynetgear.ccvf2.user.service.spot;

import org.springframework.web.servlet.ModelAndView;


/**
 * @author 안희진
 * @createDate 2015. 12. 7.
 * @described UserMainService 인터페이스.
 * @reference interface
 */
public interface SpotService {
	/**
	 * @author 안희진
	 * @createDate 2015. 12. 7.
	 * @described 일반 유저  명소추가 화면
	 * @param mav
	 */
	public void addSpotPage(ModelAndView mav);
	public void readCityList(ModelAndView mav);
}
