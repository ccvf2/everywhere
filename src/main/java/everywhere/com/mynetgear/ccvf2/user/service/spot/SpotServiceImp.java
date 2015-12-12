package everywhere.com.mynetgear.ccvf2.user.service.spot;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dao.commoncode.CommonCodeDao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonReplyDto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.user.dao.spot.SpotDao;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;


@Component
public class SpotServiceImp implements SpotService{
	@Autowired
	private SpotDao spotDao;
	
	@Autowired
	private CommonCodeService commonCodeService;	

	@Override
	public void addSpotPage(ModelAndView mav) {		
		List<CommonCodeDto> countryList = commonCodeService.getListCodeGroup("B0000");
		
		List<CommonCodeDto> spotTypeList = commonCodeService.getListCodeGroup("T0001");
		
		mav.addObject("countryList", countryList);
		mav.addObject("spotTypeList", spotTypeList);
		mav.setViewName("/user/spot/addSpotPage2");
	}

	@Override
	public void readCityList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String country_code = request.getParameter("country_code");
		
		List<CommonCodeDto> cityList = commonCodeService.getListCodeGroup(country_code);
		
		if(cityList.size() > 0){
			String result = "";
			for(int i = 0; i < cityList.size(); i++){
				result += cityList.get(i).getCode() + ",";
				result += cityList.get(i).getCode_name() + ",";
				result += cityList.get(i).getCode_value() + "|";
			}
			try {
				response.setContentType("application/html;charset=utf8");
				PrintWriter out = response.getWriter();
				out.print(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void selectSpotList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String country_code = request.getParameter("country_code");
		String city_code = request.getParameter("city_code");
		String spot_type_code = request.getParameter("spot_type_code");
		SpotDto spotDto = new SpotDto();
		spotDto.setCountry_code(country_code);
		spotDto.setCity_code(city_code);
		spotDto.setSpot_type_code(spot_type_code);
		List<SpotDto> countrySpotList = spotDao.getSpotList(spotDto);
		
		JSONArray jsonArray = new JSONArray();
		JSONObject rootObj = new JSONObject();
		for (int i = 0; i < countrySpotList.size(); i++) {
			SpotDto dto = countrySpotList.get(i);
			JSONObject obj = new JSONObject();
			obj.put("spot_no", dto.getSpot_no());
			obj.put("mem_no", dto.getMem_no());
			obj.put("country_code", dto.getCountry_code());
			obj.put("city_code", dto.getCity_code());
			obj.put("spot_name", dto.getSpot_name());
			obj.put("spot_type_code", dto.getSpot_type_code());
			obj.put("mem_level_code", dto.getMem_level_code());
			obj.put("spot_note", "\"" + dto.getSpot_note() + "\"");
			obj.put("spot_addr", "\"" + dto.getSpot_addr() + "\"");
			obj.put("spot_lat", dto.getSpot_lat());
			obj.put("spot_long", dto.getSpot_long());
			obj.put("total_star_score", dto.getTotal_star_score());
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
		}
	}

	@Override
	public void insertSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		SpotDto spotDto = (SpotDto)map.get("spotDto");		
		int result = spotDao.insertSpot(spotDto);
		System.out.println("result : " + result);
		
		mav.addObject("result", result);
	}

	@Override
	public void getSpotList(ModelAndView mav) {
		List<SpotDto> spotList = spotDao.getSpotAllList();
		
		List<CommonCodeDto> countryList = commonCodeService.getListCodeGroup("B0000");		
		List<CommonCodeDto> spotTypeList = commonCodeService.getListCodeGroup("T0001");
		
		mav.addObject("countryList", countryList);
		mav.addObject("spotTypeList", spotTypeList);
		mav.addObject("spotList", spotList);
		mav.setViewName("/user/spot/spotListPage");
	}

	@Override
	public void getOneSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int spot_no = Integer.parseInt(request.getParameter("spot_no"));
		
		SpotDto spotDto = spotDao.getOneSpot(spot_no);
		CommonCodeDto codeDto = new CommonCodeDto();
		
		codeDto = commonCodeService.getOneCodeGroup(spotDto.getCountry_code());
		String countryName = codeDto.getCode_name();
		
		codeDto = commonCodeService.getOneCodeGroup(spotDto.getCity_code());
		String cityName = codeDto.getCode_name();
		
		codeDto = commonCodeService.getOneCodeGroup(spotDto.getSpot_type_code());
		String spot_type = codeDto.getCode_name();
		
		mav.addObject("spotDto", spotDto);
		mav.addObject("countryName", countryName);
		mav.addObject("cityName", cityName);
		mav.addObject("spot_type", spot_type);
		mav.setViewName("/user/spot/spotReadPage");
	}

	@Override
	public void updateSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int spot_no = Integer.parseInt(request.getParameter("spot_no"));
		
		SpotDto spotDto = spotDao.getOneSpot(spot_no);
		List<CommonCodeDto> countryList = commonCodeService.getListCodeGroup("B0000");
		List<CommonCodeDto> cityList = commonCodeService.getListCodeGroup(spotDto.getCountry_code());
		List<CommonCodeDto> spotTypeList = commonCodeService.getListCodeGroup("T0001");
		
		mav.addObject("countryList", countryList);
		mav.addObject("cityList", cityList);
		mav.addObject("spotTypeList", spotTypeList);
		mav.addObject("spotDto", spotDto);
		
		mav.setViewName("/user/spot/spotUpdatePage");
	}
	
	public void updateOkSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		SpotDto spotDto = (SpotDto)map.get("spotDto");
		
		int result = spotDao.updateSpot(spotDto);
		System.out.println("result : " + result);
		
		mav.addObject("result", result);
	}

	@Override
	public void deleteSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int spot_no = Integer.parseInt(request.getParameter("spot_no"));
		
		int result = spotDao.deleteSpot(spot_no);
		System.out.println("result : " + result);
		mav.addObject("result", result);
	}	
}
