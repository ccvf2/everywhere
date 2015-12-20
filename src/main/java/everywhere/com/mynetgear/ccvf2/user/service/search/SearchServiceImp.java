package everywhere.com.mynetgear.ccvf2.user.service.search;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
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
	
	@Override
	public void searchSpot(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
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
		
		//게시글 리스트 가져옴
		List<SpotDto> spotList = searchDao.getSpotList(startRow, endRow, searchValue);
		List<PlannerDao> plannerList = searchDao.getPlannerList(startRow, endRow, searchValue);
		
		mav.addObject("spotList", spotList);
		mav.addObject("spotCount", spotCount);
		mav.addObject("plannerList", plannerList);
		mav.addObject("plannerCount", plannerCount);
		mav.setViewName("user/search/searchTotal");
	}
}
