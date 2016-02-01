package everywhere.com.mynetgear.ccvf2.user.service.search;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonFileIODao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dao.search.SearchDao;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
import everywhere.com.mynetgear.ccvf2.user.dto.search.SpotDtoExt;
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
	
	@Autowired
	private CommonFileIODao commonFileIODao;
	
	@Autowired
	private PlannerDao plannerDao;
	
	@Override
	public void searchSpot(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String[] spot_type_code = (String[]) map.get("spot_type_code");
		SpotDtoExt spotDto = new SpotDtoExt();
		
		//스트링 배열을 배열 리스트로 변경
		spotDto.setConditionList1(Arrays.asList(spot_type_code));
		
		//나라 검색값
		spotDto.setSearchCondition1(request.getParameter("selectCountry"));
		//도시 검색값
		spotDto.setSearchCondition2(request.getParameter("selectCity"));
		//명소명 검색값
		spotDto.setSearchWord1(request.getParameter("searchSpot"));
		
		//페이징 관련
		//현재 페이지
		String spotPage = request.getParameter("spotPage");
		//넘어온 페이지 값이 없으면 1로
		if(spotPage == null)
			spotPage = "1";
		int currentPage = Integer.parseInt(spotPage);
		//한페이지에 보여줄 명소 개수
		int spotSize = 15;
		
		spotDto.setCurrentPage(currentPage);
		spotDto.setStartPage((currentPage-1) * spotSize + 1);
		spotDto.setEndPage(currentPage*spotSize);
		
		//명소 검색결과 수
		spotDto.setTotalCount(searchDao.getSpotCount(spotDto));
		//명소 검색 결과 리스트
		List<SpotDto> searchSpotList = searchDao.getSpotList(spotDto);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + searchSpotList.size());
		
		//사진 가져옴
		for(int i = 0; i < searchSpotList.size(); i++) {
			if(searchSpotList.get(i).getAttach_file() != null) {
				String[] attach_no = searchSpotList.get(i).getAttach_file().split(",");
				List<CommonFileIODto> fileList = new ArrayList<CommonFileIODto>();
				CommonFileIODto fileIODto = commonFileIODao.getOneFileDto(Integer.parseInt(attach_no[0]));
				fileList.add(fileIODto);
				System.out.println(fileIODto);
				searchSpotList.get(i).setSpot_photoes(fileList);
			}
		}
		
		//명소 타입
		List<CommonCodeDto> countryList = commonCodeService.getListCodeGroup("B0000");
		//나라 타입
		List<CommonCodeDto> spotTypeList = commonCodeService.getListCodeGroup("T0001");
		
		//한 페이지에 나올 명소 수
		mav.addObject("boardSize", spotSize);
		
		mav.addObject("spotDto", spotDto);
		mav.addObject("searchSpotList", searchSpotList);
		mav.addObject("countryList", countryList);
		mav.addObject("spotTypeList", spotTypeList);
		mav.setViewName("user/search/searchSpot");
	}
	
	@Override
	public void searchPlanner(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		/*스케줄 검색*/
	}

	@Override
	public void searchTotal(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		//searchTotal로 요청한 검색어를 받아야함
		String searchValue = request.getParameter("search");
		
		int currentPage = 1;
		//한 페이지에 보여줄 게시물 수
		int boardSize = 6;
		SpotDtoExt spotDto = new SpotDtoExt();
		
		spotDto.setStartPage((currentPage-1) * boardSize + 1);
		spotDto.setEndPage(currentPage*boardSize);
		spotDto.setSearchWord1(searchValue);
		spotDto.setSearchWord2(searchValue);
		
		//검색된 명소 결과 수 가져옴
		int spotCount = 0;
		int plannerCount = 0;
		spotCount = searchDao.getSpotCount(spotDto);
		//plannerCount = searchDao.getPlannerCount(searchValue);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + "spotCount:" + spotCount + "\tplannerCount:" + plannerCount);
		
		List<SpotDto> searchSpotList = searchDao.getSpotList(spotDto);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + searchSpotList.size());
		for(int i = 0; i < searchSpotList.size(); i++) {
			if(searchSpotList.get(i).getAttach_file() != null) {
				String[] attach_no = searchSpotList.get(i).getAttach_file().split(",");
				List<CommonFileIODto> fileList = new ArrayList<CommonFileIODto>();
				CommonFileIODto fileIODto = commonFileIODao.getOneFileDto(Integer.parseInt(attach_no[0]));
				fileList.add(fileIODto);
				System.out.println(fileIODto);
				searchSpotList.get(i).setSpot_photoes(fileList);
			}
		}
		
		PlannerDto plannerDto = new PlannerDto();
		plannerDto.setSearchWord1(searchValue);
		
		//스케줄의 글 전체 개수를 가져오는 쿼리
		int plannerListTotalCount = plannerDao.getPlannerListForAllCount(plannerDto);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + plannerListTotalCount);
		plannerDto.setTotalCount(plannerListTotalCount);
		plannerDto.setStartRow(1);
		plannerDto.setEndRow(6);
		List<PlannerDto> plannerList = plannerDao.getPlannerListForAll(plannerDto);
		//글종류를 나타내는 코드 목록
		List<CommonCodeDto> selectCode=commonCodeService.getListCodeGroup(Constant.SCHEDULE_TYPE_GROUP);
		
		// 나라 리스트로 도시 리스트를 가져옴
		List<CommonCodeDto> countryList = commonCodeService.getListCodeGroup("B0000");
		List<CommonCodeDto> placeList = new ArrayList<CommonCodeDto>();
		for(int i=0; i<countryList.size(); i++) {
			placeList.addAll(commonCodeService.getListCodeGroup(countryList.get(i).getCode()));
		}
		// 나라 리스트와 도시 리스트를 한 곳에 합체
		placeList.addAll(countryList);
		
		List<CommonCodeDto> spotTypeList = commonCodeService.getListCodeGroup("T0001");
		
		
		mav.addObject("searchValue", searchValue);
		mav.addObject("searchSpotList", searchSpotList);
		mav.addObject("placeList", placeList);
		mav.addObject("spotTypeList", spotTypeList);
		mav.addObject("countryList", countryList);
		mav.addObject("spotCount", spotCount);
		mav.addObject("plannerList", plannerList);
		mav.addObject("plannerDto", plannerDto);
		mav.addObject("plannerCount", plannerCount);
		mav.addObject("selectCode", selectCode);
		mav.setViewName("user/search/searchTotal");
	}
}
