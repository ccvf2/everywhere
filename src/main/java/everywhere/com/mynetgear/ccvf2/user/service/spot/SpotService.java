package everywhere.com.mynetgear.ccvf2.user.service.spot;

import org.springframework.web.servlet.ModelAndView;


/**
 * @author 안희진
 * @createDate 2015. 12. 7.
 * @described UserMainService 인터페이스.
 * @reference interface
 */
public interface SpotService {
	public void addSpotPage(ModelAndView mav);
	public void readCityList(ModelAndView mav);
	public void selectSpotList(ModelAndView mav);
	public void insertSpot(ModelAndView mav);
	public void getSpotList(ModelAndView mav);
	public void getOneSpot(ModelAndView mav);
	public void updateSpot(ModelAndView mav);
	public void updateOkSpot(ModelAndView mav);
	public void deleteSpot(ModelAndView mav);
	public void ratingSpot(ModelAndView mav);
}
