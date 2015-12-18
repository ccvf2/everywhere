package everywhere.com.mynetgear.ccvf2.user.service.planner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonFileIODao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOService;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dao.spot.SpotDao;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.ItemDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.MoneyDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

@Component
public class PlannerServiceImp implements PlannerService {
	@Autowired
	private PlannerDao plannerDao;
	@Autowired
	private SpotDao spotDao;
	@Autowired
	private CommonFileIODao commonFileIoDao;
	@Autowired
	private CommonFileIOService commonFileIOService;
	@Autowired
	private CommonCodeService commonCodeService;
	
	@Value("${attach.item.path}")
	private String itemPath;

	@Override
	public void insertPlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String mem_no = request.getParameter("mem_no");
		String title = request.getParameter("title");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String planner_ba_code = request.getParameter("planner_ba_code");
		
		PlannerDto plannerDto = new PlannerDto();
		plannerDto.setPlanner_no(plannerDao.getPlannerNextSeq());
		plannerDto.setMem_no(Integer.parseInt(mem_no));
		plannerDto.setTitle(title);
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			plannerDto.setStart_date(sdf.parse(start_date));
			if(!end_date.equals("")) plannerDto.setEnd_date(sdf.parse(end_date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		plannerDto.setPlanner_ba_code(planner_ba_code);
		plannerDto.setUse_yn(Constant.SYNB_YN_N);
		System.out.println(plannerDto);
		
		int check = plannerDao.insertPlanner(plannerDto);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.addObject("plannerDto", plannerDto);
		mav.setViewName("user/planner/addPlanner");
	}

	@Override
	public void getPlannerList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		
		List<PlannerDto> plannerList = plannerDao.getPlannerList(mem_no);
		
		mav.addObject("plannerList", plannerList);
		mav.setViewName("user/planner/plannerList");
	}

	@Override
	public void getOnePlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));
		
		PlannerDto plannerDto = plannerDao.getOnePlanner(planner_no);
		List<ItemDto> itemList = plannerDao.getItemList(planner_no);
		
		for(int i = 0; i < itemList.size(); i++){
			//아이템 별 명소 정보 가져오기
			SpotDto spot = spotDao.getOneSpot(itemList.get(i).getSpot_no());			
			if(spot != null){
				if(spot.getAttach_file() != null){
					String[] attach_no = spot.getAttach_file().split(",");
					// 명소 이미지 추가
					List<CommonFileIODto> fileList = new ArrayList<CommonFileIODto>();
					for(int j = 0; j < attach_no.length; j++){
						int file_no = Integer.parseInt(attach_no[j]);
						System.out.println("file_no : " + file_no);
						CommonFileIODto fileIODto =  commonFileIoDao.getOneFileDto(file_no);
						System.out.println(fileIODto);
						fileList.add(fileIODto);				
					}
					spot.setSpot_photoes(fileList);
				}
				itemList.get(i).setSpot(spot);
			}			
			
			// 아이템 별 사진 가져오기
			if(itemList.get(i).getAttach_photoes()!=null){
				System.out.println("*********************************************");
				String[] attach_no = itemList.get(i).getAttach_photoes().split(",");
				List<CommonFileIODto> fileList = new ArrayList<CommonFileIODto>();
				for(int j = 0; j < attach_no.length; j++){
					int file_no = Integer.parseInt(attach_no[j]);
					System.out.println("file_no : " + file_no);
					CommonFileIODto fileIODto =  commonFileIoDao.getOneFileDto(file_no);
					System.out.println(fileIODto);
					fileList.add(fileIODto);				
				}
				itemList.get(i).setItem_photoes(fileList);
			}
			
			List<MoneyDto> moneyList = plannerDao.getMoneyList(itemList.get(i).getItem_no());
			itemList.get(i).setMoneyList(moneyList);
		}
		
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + itemList.size());
		
		mav.addObject("plannerDto", plannerDto);
		mav.addObject("itemList", itemList);
		mav.setViewName("user/planner/plannerRead");
	}

	@Override
	public void writePlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));
		
		PlannerDto plannerDto = plannerDao.getOnePlanner(planner_no);
		mav.addObject("plannerDto", plannerDto);
		
		List<SpotDto> spotList = spotDao.getSpotAllList();
		for(int i = 0; i < spotList.size(); i++){
			String[] attach_no = spotList.get(i).getAttach_file().split(",");
			
			List<CommonFileIODto> fileList = new ArrayList<CommonFileIODto>();
			CommonFileIODto fileIODto = commonFileIoDao.getOneFileDto(Integer.parseInt(attach_no[0]));
			fileList.add(fileIODto);
			System.out.println(fileIODto);
			spotList.get(i).setSpot_photoes(fileList);
		}
		
		List<CommonCodeDto> countryList = commonCodeService.getListCodeGroup("B0000");		
		List<CommonCodeDto> spotTypeList = commonCodeService.getListCodeGroup("T0001");
		
		mav.addObject("countryList", countryList);
		mav.addObject("spotTypeList", spotTypeList);
		
		mav.addObject("spotList", spotList);
		
		long diff = plannerDto.getEnd_date().getTime() - plannerDto.getStart_date().getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        mav.addObject("day_count", diffDays+1);
        
		mav.setViewName("user/planner/addPlanner");
	}

	@Override
	public void writePlannerOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");		
		
		System.out.println("**** request ****");
		Enumeration params = request.getParameterNames(); 
		while(params.hasMoreElements()){
		 String paramName = (String)params.nextElement();
		 System.out.println(paramName + " : "+request.getParameter(paramName));
		}
		
		//플래너 추가
		PlannerDto plannerDto = new PlannerDto();
		
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));
		plannerDto.setPlanner_no(planner_no);		
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		plannerDto.setMem_no(mem_no);		
		plannerDto.setTitle(request.getParameter("planner_title"));
		plannerDto.setMemo(request.getParameter("planner_memo"));
		String start_date = request.getParameter("start_date");
		String day_count = request.getParameter("day_count");
		String end_date = request.getParameter("end_date");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");		
		
		try {
			plannerDto.setStart_date(dateFormat.parse(start_date));
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(plannerDto.getStart_date());
			cal.add(Calendar.DATE, Integer.parseInt(day_count));
			plannerDto.setEnd_date(cal.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		plannerDto.setUse_yn(request.getParameter("planner_use_yn"));
		
		//아이템 추가
		List<ItemDto> itemList = new ArrayList<ItemDto>();
		List<MoneyDto> moneyList = new ArrayList<MoneyDto>();		
		setWriteItems(request, itemList, moneyList, planner_no, mem_no);
		
		System.out.println(plannerDto);
		System.out.println(itemList);
		System.out.println(moneyList);		
				
		int check = plannerDao.insertPlanner(plannerDto, itemList, moneyList);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);
		
		mav.addObject("planner_no", plannerDto.getPlanner_no());
		mav.addObject("check", check);
		mav.setViewName("user/planner/plannerWriteOk");
	}
	
	public void setWriteItems(HttpServletRequest request, List<ItemDto> itemList, List<MoneyDto> moneyList, int planner_no, int mem_no){		 
		int day_count = Integer.parseInt(request.getParameter("day_count"));
		System.out.println("day_count : " + day_count);
		
		for(int i = 1; i <= day_count; i++){
			int item_count = Integer.parseInt(request.getParameter("d"+i+"_item_count"));
			for(int j = 1; j <= item_count; j++){
				String itemString = "d"+i+"_item"+j;
				System.out.println("itemString : " + itemString + "\t" + day_count);
				// 가계부에 item_no를 넣어주기 위해 미리 가져온다.
				int item_no = plannerDao.getItemNextSeq();
				ItemDto itemDto = new ItemDto();
				itemDto.setItem_no(item_no);
				itemDto.setPlanner_no(planner_no);
				itemDto.setMem_no(mem_no);
				int spot_no = Integer.parseInt(request.getParameter(itemString+"_spot_no"));
				itemDto.setSpot_no(spot_no);
				String itemOrder = i + "010" + j;
				itemDto.setItem_order(Integer.parseInt(itemOrder));
				itemDto.setNote(request.getParameter(itemString+"_note").replace("\r\n", "<br/>"));
				
				CommonFileIODto commonFileIODto = commonFileIOService.requestWriteFileAndDTO(request, itemString + "_attach_photoes", itemPath);
				if(commonFileIODto != null){
					commonFileIODto.setType_code(Constant.FILE_TYPE_ITEM);
					commonFileIODto.setWrite_no(planner_no);
					String item_photo_num = commonFileIOService.insertFileInfo(commonFileIODto) + ",";
					System.out.println("item_photo_num : " + item_photo_num);
					itemDto.setAttach_photoes(item_photo_num);
				}
				
				/* String 형식으로 바꿀 예정
				try {
					SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
					String start_time = request.getParameter(itemString+"_start_time"); 
					String end_time = request.getParameter(itemString+"_end_time");
					System.out.println("error : " + start_time + "," + end_time);
					if(!start_time.equals("") || start_time != null){
						Date date = timeFormat.parse(start_time);
						itemDto.setStart_time(new Timestamp(date.getTime()));
					}
					if(!end_time.equals("") || end_time != null){
						Date date = timeFormat.parse(end_time);
						itemDto.setEnd_time(new Timestamp(date.getTime()));
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				*/
				
				itemList.add(itemDto);
				
				//가계부
				int money_count = Integer.parseInt(request.getParameter(itemString+"_money_count"));
				for(int k = 1; k <= money_count; k++){
					String moneyString = itemString + "_money" + k;
					MoneyDto moneyDto = new MoneyDto();
					moneyDto.setPlanner_no(planner_no);
					moneyDto.setItem_no(item_no);
					moneyDto.setMem_no(mem_no);
					moneyDto.setSpot_no(spot_no);
					moneyDto.setMoney_type_code(request.getParameter(moneyString+"_type_code"));
					moneyDto.setMoney_currency_code(request.getParameter(moneyString+"_currency_code"));
					moneyDto.setMoney_title(request.getParameter(moneyString+"_title"));
					moneyDto.setPrice(Double.parseDouble(request.getParameter(moneyString+"_price")));
					moneyList.add(moneyDto);
				}
			}
		}
	}

	@Override
	public void deletePlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));
		
		int check = plannerDao.deletePlanner(planner_no);
		
		mav.addObject("check", check);
		mav.setViewName("user/planner/plannerDelete");
	}
	
	
}
