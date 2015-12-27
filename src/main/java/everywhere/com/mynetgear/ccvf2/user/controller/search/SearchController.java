package everywhere.com.mynetgear.ccvf2.user.controller.search;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.service.search.SearchService;

/**
 * @author 곽성국
 * @createDate 2015. 12. 18.
 * @described 명소, 스케줄, 통합검색 컨트롤러
 * @reference class
 */
@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 18.
	 * @described 명소를 검색한다.
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/search/searchSpot.do", method=RequestMethod.GET)
	public ModelAndView searchSpot(HttpServletRequest request, HttpServletResponse response) { 
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		searchService.searchSpot(mav);
		return mav;
	}
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 21.
	 * @described ajax 요청을 통해 명소 리스트를 json으로 반환함
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/search/getSpotList.ajax", method=RequestMethod.GET)
	public ModelAndView getSpotList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		searchService.getSpotList(mav);
		System.out.println("getSpotList.ajax is called!!!!!!!!!!!!!!");
		return null;
	}
	
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 23.
	 * @described 다음 페이지의 명소 리스트를 가져오는 메소드
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/search/getMoreSpotList.ajax", method=RequestMethod.GET)
	public ModelAndView getMoreSpotList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		searchService.getMoreSpotList(mav);
		return null;
	}
	
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 19.
	 * @described 스케줄을 검색한다.
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/search/searchPlanner.do", method=RequestMethod.GET)
	public ModelAndView searchPlanner(HttpServletRequest request, HttpServletResponse response) { 
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		searchService.searchPlanner(mav);
		return mav;
	}
	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 19.
	 * @described 명소 및 스케줄을 검색한다.
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/search/searchTotal.do", method=RequestMethod.GET)
	public ModelAndView searchTotal(HttpServletRequest request, HttpServletResponse response) { 
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		searchService.searchTotal(mav);
		return mav;
	}
}
