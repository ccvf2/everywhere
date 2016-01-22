package everywhere.com.mynetgear.ccvf2.user.service.spot;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 안희진
 * @createDate 2015. 12. 7.
 * @described SpotService 인터페이스.
 * @reference interface
 */
public interface SpotService {
	/**
	 * @author 안희진
	 * @createDate 2015. 12. 7.
	 * @described 명소 추가 화면 페이지 요청 처리
	 * @param mav
	 */
	public void insertSpotView(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 7.
	 * @described 사용자가 넘겨준 정보로 명소 추가 처리
	 * @param mav
	 */
	public void insertSpot(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 8.
	 * @described 국가별 도시 목록을 읽어오는 Ajax 요청 처리
	 * @param mav
	 */
	public void readCityList(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 8.
	 * @described 명소 목록 가져오는 Ajax 요청 처리
	 * @param mav
	 */
	public void getSpotList(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 8.
	 * @described 선택된 명소 정보를 읽어오는 요청 처리
	 * @param mav
	 */
	public void getOneSpot(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 10.
	 * @described 선택된 명소를 수정하는 페이지 요청 처리
	 * @param mav
	 */
	public void updateSpotView(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 10.
	 * @described 선택된 명소를 수정 요청 처리
	 * @param mav
	 */
	public void updateSpot(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 11.
	 * @described 선택된 명소 삭제 처리
	 * @param mav
	 */
	public void deleteSpot(ModelAndView mav);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 11.
	 * @described 명소 평점 처리
	 * @param mav
	 */
	public void ratingSpot(ModelAndView mav);
}
