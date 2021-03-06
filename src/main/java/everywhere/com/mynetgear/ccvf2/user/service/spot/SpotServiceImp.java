package everywhere.com.mynetgear.ccvf2.user.service.spot;

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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonFileIODao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOService;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dao.spot.SpotDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.dto.search.SpotDtoExt;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

@Component
public class SpotServiceImp implements SpotService{
	@Autowired
	private SpotDao spotDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CommonCodeService commonCodeService;
	@Autowired
	private CommonFileIOService commonFileIOService;
	@Autowired
	private CommonFileIODao commonFileIoDao;

	@Value("${attach.spot.path}")
	private String spotPath;
	
	@Override
	public void insertSpotView(ModelAndView mav) {
		List<CommonCodeDto> countryList = commonCodeService.getListCodeGroup("B0000");
		List<CommonCodeDto> spotTypeList = commonCodeService.getListCodeGroup("T0001");
		System.out.println(spotPath);
		mav.addObject("countryList", countryList);
		mav.addObject("spotTypeList", spotTypeList);
		mav.setViewName("/user/spot/spotWrite");
	}
	
	@Override
	public void insertSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);

		SpotDto spotDto = (SpotDto)map.get("spotDto");
		spotDto.setMem_no(userInfo.getMem_no());
		spotDto.setMem_email(userInfo.getMem_email());
		spotDto.setMem_level_code(userInfo.getMem_level_code());
		
		CommonFileIODto commonFileIODto = commonFileIOService.requestWriteFileAndDTO(request, "spot_image", spotPath);
		if(commonFileIODto != null){
			commonFileIODto.setType_code(Constant.FILE_TYPE_SPOT);
			commonFileIODto.setWrite_no(userInfo.getMem_no());
			String spot_photo_num = commonFileIOService.insertFileInfo(commonFileIODto) + ",";
			System.out.println("spot_photo_num : " + spot_photo_num);
			spotDto.setAttach_file(spot_photo_num);
		}
		
		System.out.println(spotDto);
		int result = spotDao.insertSpot(spotDto);
		System.out.println("result : " + result);
		
		mav.addObject("result", result);
		mav.setViewName("/user/spot/spotWriteOk");
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
	public void getSpotList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String country_code = request.getParameter("country_code");
		String city_code = request.getParameter("city_code");
		String spot_type_code = request.getParameter("spot_type_code");
		String search = request.getParameter("search");

		String spot_page = request.getParameter("spot_page");
		if(spot_page == null)
			spot_page = "1";
		int curr_page = Integer.parseInt(spot_page);
		int spotSize = 10;
		
		SpotDto spotDto = new SpotDto();
		spotDto.setCountry_code(country_code);
		spotDto.setCity_code(city_code);
		spotDto.setSpot_type_code(spot_type_code);
		spotDto.setSpot_name(search);
		List<SpotDto> selectSpotList = spotDao.getSpotList(spotDto, curr_page, spotSize);
		for(int i = 0; i < selectSpotList.size(); i++){
			if(selectSpotList.get(i).getAttach_file() != null){
				String[] attach_no = selectSpotList.get(i).getAttach_file().split(",");
				List<CommonFileIODto> fileList = new ArrayList<CommonFileIODto>();
				CommonFileIODto fileIODto = commonFileIoDao.getOneFileDto(Integer.parseInt(attach_no[0]));
				fileList.add(fileIODto);
				System.out.println(fileIODto);
				selectSpotList.get(i).setSpot_photoes(fileList);
			}
		}
		
		int total = spotDao.getTotalSpotSize(spotDto);
		int curr_spot = spotSize * curr_page;
		if(curr_spot > total)
			curr_spot = total;
		String spotPage = "(" + curr_spot + "/" + total + ")";

		JSONArray jsonArray = new JSONArray();
		JSONObject rootObj = new JSONObject();
		for (int i = 0; i < selectSpotList.size(); i++) {
			SpotDto dto = selectSpotList.get(i);
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
			rootObj.put("spotPage", spotPage);
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
	public void getOneSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int spot_no = Integer.parseInt(request.getParameter("spot_no"));
		
		SpotDto spotDto = spotDao.getOneSpot(spot_no);
		if(spotDto.getAttach_file() != null){
			String[] attach_no = spotDto.getAttach_file().split(",");
			List<CommonFileIODto> fileList = new ArrayList<CommonFileIODto>();
			for(int i = 0; i < attach_no.length; i++){
				int file_no = Integer.parseInt(attach_no[i]);
				System.out.println("file_no : " + file_no);
				CommonFileIODto fileIODto =  commonFileIoDao.getOneFileDto(file_no);
				System.out.println(fileIODto);
				fileList.add(fileIODto);				
			}
			spotDto.setSpot_photoes(fileList);
		}
		CommonCodeDto codeDto = new CommonCodeDto();
		
		codeDto = commonCodeService.getOneCodeGroup(spotDto.getCountry_code());
		String countryName = codeDto.getCode_name();
		
		codeDto = commonCodeService.getOneCodeGroup(spotDto.getCity_code());
		String cityName = codeDto.getCode_name();
		
		codeDto = commonCodeService.getOneCodeGroup(spotDto.getSpot_type_code());
		String spot_type = codeDto.getCode_name();
		
		double spotScore = 0;
		if(spotDto.getCount_star_score() != 0){
			spotScore = Math.round(spotDto.getTotal_star_score() / spotDto.getCount_star_score()*100)/100.0;
		}
		
		mav.addObject("spotDto", spotDto);
		mav.addObject("countryName", countryName);
		mav.addObject("cityName", cityName);
		mav.addObject("spot_type", spot_type);
		mav.addObject("spotScore", spotScore);
		mav.setViewName("/user/spot/spotRead");
	}

	@Override
	public void updateSpotView(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		int spot_no = Integer.parseInt(request.getParameter("spot_no"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		SpotDto spotDto = spotDao.getOneSpot(spot_no);
		
		if(spotDto.getMem_no() != userInfo.getMem_no())
			return;
		
		if(spotDto.getAttach_file() != null){
			String[] attach_no = spotDto.getAttach_file().split(",");
			List<CommonFileIODto> fileList = new ArrayList<CommonFileIODto>();
			for(int i = 0; i < attach_no.length; i++){
				int file_no = Integer.parseInt(attach_no[i]);
				System.out.println("file_no : " + file_no);
				CommonFileIODto fileIODto =  commonFileIoDao.getOneFileDto(file_no);
				System.out.println(fileIODto);
				fileList.add(fileIODto);
			}
			spotDto.setSpot_photoes(fileList);
		}
		List<CommonCodeDto> countryList = commonCodeService.getListCodeGroup("B0000");
		List<CommonCodeDto> cityList = commonCodeService.getListCodeGroup(spotDto.getCountry_code());
		List<CommonCodeDto> spotTypeList = commonCodeService.getListCodeGroup("T0001");
		
		mav.addObject("countryList", countryList);
		mav.addObject("cityList", cityList);
		mav.addObject("spotTypeList", spotTypeList);
		mav.addObject("spotDto", spotDto);
		mav.addObject("page", page);
		
		mav.setViewName("/user/spot/spotUpdate");
	}

	public void updateSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		SpotDto spotDto = (SpotDto)map.get("spotDto");
		int page = Integer.parseInt(request.getParameter("page"));
		
		CommonFileIODto commonFileIODto = commonFileIOService.requestWriteFileAndDTO(request, "spot_image", spotPath);
		if(commonFileIODto != null){
			commonFileIODto.setType_code(Constant.FILE_TYPE_SPOT);
			commonFileIODto.setWrite_no(userInfo.getMem_no());
			String spot_photo_num = commonFileIOService.insertFileInfo(commonFileIODto) + ",";
			System.out.println("spot_photo_num : " + spot_photo_num);
			spotDto.setAttach_file(spot_photo_num);
		}
		int result = spotDao.updateSpot(spotDto);
		System.out.println("result : " + result);
		
		mav.addObject("result", result);
		mav.addObject("spot_no", spotDto.getSpot_no());
		mav.addObject("page", page);
		mav.setViewName("/user/spot/spotUpdateOk");
	}

	@Override
	public void deleteSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);

		if(userInfo.getMem_level_code() != Constant.MEMBER_LEVEL_ADMIN)
			return;

		int spot_no = Integer.parseInt(request.getParameter("spot_no"));
		
		int result = spotDao.deleteSpot(spot_no);
		System.out.println("result : " + result);
		mav.addObject("result", result);
		mav.setViewName("/user/spot/spotDelete");
	}

	@Override
	public void ratingSpot(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		int spot_no = Integer.parseInt(request.getParameter("spot_no"));
		int score = Integer.parseInt(request.getParameter("score"));
		
		SpotDto spotDto = spotDao.getOneSpot(spot_no);
		spotDto.setTotal_star_score(spotDto.getTotal_star_score()+score);
		spotDto.setCount_star_score(spotDto.getCount_star_score()+1);
		
		int result = spotDao.ratingSpot(spotDto);
		
		double spotScore = 0;
		if(spotDto.getCount_star_score() != 0){
			spotScore = Math.round(spotDto.getTotal_star_score() / spotDto.getCount_star_score()*100)/100.0;
		}
		
		try {
			String str = result + "," + spotScore + "," + spotDto.getCount_star_score();
			response.setContentType("application/html;charset=utf8");
			PrintWriter out = response.getWriter();
			out.print(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void getMySpotList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		String search = request.getParameter("search");

		String spot_page = request.getParameter("spot_page");
		if(spot_page == null)
			spot_page = "1";
		int curr_page = Integer.parseInt(spot_page);
		int spotSize = 12;

		List<SpotDtoExt> mySpotList = spotDao.getMySpotList(userInfo.getMem_no(), search, curr_page, spotSize);
		int total = spotDao.getTotalMySpotSize(userInfo.getMem_no(), search);
		
		int pageBlock = 5;
		int pageCount = total/spotSize+(total%spotSize==0?0:1);
		int startPage=((curr_page-1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage>pageCount){
			endPage = pageCount;
		}
		userInfo = memberDao.memberRead(userInfo.getMem_no());
		
		mav.addObject("mySpotList", mySpotList);
		mav.addObject("memberDto", userInfo);
		mav.addObject("search", search);
		mav.addObject("total", total);
		mav.addObject("pageCount", pageCount);
		mav.addObject("currPage", curr_page);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.setViewName("/user/myPage/myPageSpot");
	}
}
