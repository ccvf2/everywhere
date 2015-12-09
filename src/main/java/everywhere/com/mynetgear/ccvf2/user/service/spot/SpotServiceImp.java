package everywhere.com.mynetgear.ccvf2.user.service.spot;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dao.commoncode.CommonCodeDao;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.user.dao.spot.SpotDao;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;


@Component
public class SpotServiceImp implements SpotService{
	@Autowired
	private SpotDao spotDao;
	
	@Autowired
	private CommonCodeDao commonCodeDao;

	@Override
	public void addSpotPage(ModelAndView mav) {
		List<CommonCodeDto> countryList = commonCodeDao.getListByGroupCode("B0000");
		List<CommonCodeDto> spotTypeList = commonCodeDao.getListByGroupCode("T0001");
		mav.addObject("countryList", countryList);
		mav.addObject("spotTypeList", spotTypeList);
		mav.setViewName("/user/spot/addSpotPage");
	}

	@Override
	public void readCityList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String country_code = request.getParameter("country_code");
		System.out.println("country_code : " + country_code);
		List<CommonCodeDto> cityList = commonCodeDao.getListByGroupCode(country_code);
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
	public void insertSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		SpotDto spotDto = (SpotDto)map.get("spotDto");
		
		int result = spotDao.insertSpot(spotDto);
		System.out.println("result : " + result);
		
		mav.addObject("result", result);
	}

	@Override
	public void getSpotList(ModelAndView mav) {
		List<SpotDto> spotList = spotDao.getSpotList();
		List<CommonCodeDto> countryList = commonCodeDao.getListByGroupCode("B0000");
		List<CommonCodeDto> spotTypeList = commonCodeDao.getListByGroupCode("T0001");
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
		String countryName = commonCodeDao.getCodeName(spotDto.getCountry_code());
		String cityName = commonCodeDao.getCodeName(spotDto.getCity_code());
		String spot_type = commonCodeDao.getCodeName(spotDto.getSpot_type_code());
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
		List<CommonCodeDto> countryList = commonCodeDao.getListByGroupCode("B0000");
		List<CommonCodeDto> cityList = commonCodeDao.getListByGroupCode(spotDto.getCountry_code());
		List<CommonCodeDto> spotTypeList = commonCodeDao.getListByGroupCode("T0001");
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
