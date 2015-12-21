package everywhere.com.mynetgear.ccvf2.user.service.search;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonFileIODao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
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
	
	@Autowired
	private CommonFileIODao commonFileIODao;
	
	@Override
	public void searchSpot(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//처음에 header 에서 요청한 검색어를 받아야함
		
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
		
		List<CommonCodeDto> countryList = commonCodeService.getListCodeGroup("B0000");
		List<CommonCodeDto> spotTypeList = commonCodeService.getListCodeGroup("T0001");
		
		mav.addObject("searchSpotList", searchSpotList);
		mav.addObject("countryList", countryList);
		mav.addObject("spotTypeList", spotTypeList);
		mav.setViewName("user/search/searchSpot");
	}


	@Override
	public void getSpotList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
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
		
		
		
		
		
/*
		SpotDto spotDto = new SpotDto();
		spotDto.setCountry_code(country_code);
		spotDto.setCity_code(city_code);
		spotDto.setSpot_type_code(spot_type_code);
		spotDto.setCurrentPage(currentPage);
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
		
		JSONArray jsonArray = new JSONArray();
		JSONObject rootObj = new JSONObject();
		for (int i = 0; i < searchSpotList.size(); i++) {
			SpotDto dto = searchSpotList.get(i);
			JSONObject obj = new JSONObject();
			obj.put("spot_no", dto.getSpot_no());
			obj.put("mem_no", dto.getMem_no());
			obj.put("country_code", StringUtils.clean(dto.getCountry_code()));
			obj.put("city_code", StringUtils.clean(dto.getCity_code()));
			obj.put("spot_name", StringUtils.clean(dto.getSpot_name()));
			obj.put("spot_type_code", StringUtils.clean(dto.getSpot_type_code()));
			obj.put("mem_level_code", StringUtils.clean(dto.getMem_level_code()));
			obj.put("spot_note", StringUtils.clean(dto.getSpot_note()));
			obj.put("spot_addr", StringUtils.clean(dto.getSpot_addr()));
			obj.put("spot_lat", dto.getSpot_lat());
			obj.put("spot_long", dto.getSpot_long());
			obj.put("total_star_score", dto.getTotal_star_score());
			if(dto.getSpot_photoes() != null){
				obj.put("spot_photo_save_name", StringUtils.clean(dto.getSpot_photoes().get(0).getSave_name()));
				obj.put("spot_photo_extension", StringUtils.clean(dto.getSpot_photoes().get(0).getExtension()));
			}else
			{
				obj.put("spot_photo_save_name", StringUtils.clean("No_Image"));
				obj.put("spot_photo_extension", StringUtils.clean("png"));
			}
			jsonArray.add(obj);
		}
		
		try{
			rootObj.put("spot", jsonArray);
			String json = rootObj.toJSONString();
			System.out.println(json);
			response.setContentType("application/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}*/
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
