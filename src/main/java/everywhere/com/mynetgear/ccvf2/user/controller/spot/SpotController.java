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
 * @described 명소 추가 컨트롤러
 * @reference Controller
 */
@Controller
public class SpotController {
	@Autowired
	private SpotService spotService;
	
	/**
	 * @author 안희진
	 * @createDate 2015. 12. 7.
	 * @described 장소 추가 화면 페이지
	 * @return
	 */
	@RequestMapping(value="/user/spot/addSpotPage.do", method=RequestMethod.GET)
	public ModelAndView addSpotPage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		spotService.addSpotPage(mav);
		return mav;
	}
	
	@RequestMapping(value="/user/spot/selectCountry.ajax", method=RequestMethod.GET)
	public ModelAndView readCityList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		spotService.readCityList(mav);
		return null;
	}
	
	@RequestMapping(value="/user/spot/getSpotList.ajax", method=RequestMethod.GET)
	public ModelAndView selectSpotList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		spotService.getSpotList(mav);
		return null;
	}
	
	@RequestMapping(value="/user/spot/addSpotWrite.do", method=RequestMethod.POST)
	public ModelAndView insertSpot(HttpServletRequest request, HttpServletResponse response, SpotDto spotDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav.addObject("spotDto", spotDto);
		spotService.insertSpot(mav);
		
		return null;
	}

	@RequestMapping(value="/user/spot/spotReadPage.do", method=RequestMethod.GET)
	public ModelAndView getOneSpot(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		spotService.getOneSpot(mav);
		return mav;
	}
	
	@RequestMapping(value="/user/spot/updateSpot.do", method=RequestMethod.GET)
	public ModelAndView updateSpot(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		spotService.updateSpot(mav);
		return mav;
	}
	
	@RequestMapping(value="/user/spot/updateOkSpot.do", method=RequestMethod.POST)
	public ModelAndView updateSpot(HttpServletRequest request, HttpServletResponse response, SpotDto spotDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("spotDto", spotDto);
		spotService.updateOkSpot(mav);
		return mav;
	}
	
	@RequestMapping(value="/user/spot/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteSpot(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		spotService.deleteSpot(mav);
		return mav;
	}
	
	@RequestMapping(value="/user/spot/ratingSpot.ajax", method=RequestMethod.GET)
	public ModelAndView ratingSpot(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		spotService.ratingSpot(mav);
		return null;
	}
}
