package everywhere.com.mynetgear.ccvf2.user.controller.search;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView searchSpot(HttpServletRequest request, HttpServletResponse response, @RequestParam (value="spot_type_code", defaultValue= "T0000")String[] spot_type_code) { 
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("spot_type_code", spot_type_code);
		searchService.searchSpot(mav);
		return mav;
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
