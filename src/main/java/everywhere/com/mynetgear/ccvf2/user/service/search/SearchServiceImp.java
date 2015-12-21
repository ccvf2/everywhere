package everywhere.com.mynetgear.ccvf2.user.service.search;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dao.search.SearchDao;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 18.
 * @described 검색 서비스 구현
 * @reference class
 */
@Component
public class SearchServiceImp implements SearchService {
	@Autowired
	private SearchDao searchDao;
	
	@Autowired
	private CommonCodeService commonCodeService;
	
	@Override
	public void searchSpot(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		//검색한 값이 들어와야 할듯
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		List<CommonCodeDto> countryList = commonCodeService.getListCodeGroup("B0000");
		List<CommonCodeDto> spotTypeList = commonCodeService.getListCodeGroup("T0001");
		
		
		
		
		mav.addObject("countryList", countryList);
		mav.addObject("spotTypeList", spotTypeList);
		mav.setViewName("user/search/searchSpot");
	}


	@Override
	public void getSpotList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		//현재 페이지
		String spotPage = request.getParameter("spotPage");
		//넘어온 페이지 값이 없으면 1로
		if(spotPage == null)
			spotPage = "1";
		int currentPage = Integer.parseInt(spotPage);
		
		//국가코드, 도시코드, 명소타입 코드
		String country_code = request.getParameter("country_code");
		String city_code = request.getParameter("city_code");
		String spot_type_code = request.getParameter("spot_type_code");

		SpotDto spotDto = new SpotDto();
		spotDto.setCountry_code(country_code);
		spotDto.setCity_code(city_code);
		spotDto.setSpot_type_code(spot_type_code);
		spotDto.setCurrentPage(currentPage);
		List<SpotDto> searchSpotList = searchDao.getSpotList(spotDto);
	}
	
	@Override
	public void searchPlanner(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
	}

	@Override
	public void searchTotal(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//검색 값
		String searchValue = request.getParameter("search");
		
		//한 페이지에 보여줄 게시물 수
		int boardSize = 6;
		
		int currentPage = 1;
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		//검색된 결과 수 가져옴
		int spotCount = 0;
		int plannerCount = 0;
		
		spotCount = searchDao.getSpotCount(searchValue);
		plannerCount = searchDao.getPlannerCount(searchValue);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + "spotCount:" + spotCount + "\tplannerCount:" + plannerCount);
		//추후 변경 필요
		//게시글 리스트 가져옴
		SpotDto spotDto = new SpotDto();
		spotDto.setCurrentPage(currentPage);
		List<SpotDto> spotList = searchDao.getSpotList(spotDto);
		List<PlannerDao> plannerList = searchDao.getPlannerList(startRow, endRow, searchValue);
		
		mav.addObject("spotList", spotList);
		mav.addObject("spotCount", spotCount);
		mav.addObject("plannerList", plannerList);
		mav.addObject("plannerCount", plannerCount);
		mav.setViewName("user/search/searchTotal");
	}



}
