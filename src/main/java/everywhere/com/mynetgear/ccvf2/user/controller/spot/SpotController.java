package everywhere.com.mynetgear.ccvf2.user.controller.spot;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;
import everywhere.com.mynetgear.ccvf2.user.service.spot.SpotService;

/**
 * @author 안희진
 * @createDate 2015. 12. 7.
 * @described 명소 관련 기능(CRUD)을 위한 컨트롤러
 * @reference class
 */
@Controller
public class SpotController {
	@Autowired
	private SpotService spotService;

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 7.
	 * @described 명소 추가 화면 페이지 요청 처리
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/spot/spotWrite.do", method = RequestMethod.GET)
	public ModelAndView insertSpotView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		spotService.insertSpotView(mav);
		return mav;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 7.
	 * @described 사용자가 넘겨준 정보로 명소 추가 처리
	 * @param request
	 * @param response
	 * @param spotDto
	 * @return
	 */
	@RequestMapping(value = "/user/spot/spotWrite.do", method = RequestMethod.POST)
	public ModelAndView insertSpot(HttpServletRequest request, HttpServletResponse response, SpotDto spotDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav.addObject("spotDto", spotDto);
		spotService.insertSpot(mav);
		return mav;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 8.
	 * @described 국가별 도시 목록을 읽어오는 Ajax 요청 처리
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/spot/selectCountry.ajax", method = RequestMethod.GET)
	public ModelAndView readCityList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		spotService.readCityList(mav);
		return null;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 8.
	 * @described 명소 목록 가져오는 Ajax 요청 처리
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/spot/getSpotList.ajax", method = RequestMethod.POST)
	public ModelAndView selectSpotList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		spotService.getSpotList(mav);
		return null;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 8.
	 * @described 선택된 명소 정보를 읽어오는 요청 처리
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/spot/spotRead.do", method = RequestMethod.GET)
	public ModelAndView getOneSpot(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		spotService.getOneSpot(mav);
		return mav;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 10.
	 * @described 선택된 명소를 수정하는 페이지 요청 처리
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/spot/spotUpdate.do", method = RequestMethod.GET)
	public ModelAndView updateSpot(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		spotService.updateSpotView(mav);
		return mav;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 10.
	 * @described 선택된 명소를 수정 요청 처리
	 * @param request
	 * @param response
	 * @param spotDto
	 * @return
	 */
	@RequestMapping(value = "/user/spot/spotUpdate.do", method = RequestMethod.POST)
	public ModelAndView updateSpot(HttpServletRequest request, HttpServletResponse response, SpotDto spotDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("spotDto", spotDto);
		spotService.updateSpot(mav);
		return mav;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 11.
	 * @described 선택된 명소 삭제 처리
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/spot/spotDelete.do", method = RequestMethod.GET)
	public ModelAndView deleteSpot(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		spotService.deleteSpot(mav);
		return mav;
	}

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 11.
	 * @described 명소 평점 처리
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/user/spot/spotRating.ajax", method = RequestMethod.GET)
	public ModelAndView ratingSpot(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		spotService.ratingSpot(mav);
		return null;
	}
}
