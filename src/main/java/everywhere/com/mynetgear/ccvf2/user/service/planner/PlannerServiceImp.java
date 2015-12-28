package everywhere.com.mynetgear.ccvf2.user.service.planner;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.GregorianCalendar;
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
import everywhere.com.mynetgear.ccvf2.user.dao.bookmark.BookMarkDao;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dao.spot.SpotDao;
import everywhere.com.mynetgear.ccvf2.user.dao.sweet.SweetDao;
import everywhere.com.mynetgear.ccvf2.user.dto.bookmark.BookMarkDto;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.ItemDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.MoneyDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;
import everywhere.com.mynetgear.ccvf2.user.dto.sweet.SweetDto;

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
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SweetDao sweetDao;
	@Autowired
	private BookMarkDao bookMarkDao;
	
	@Value("${attach.item.path}")
	private String itemPath;
	
	@Value("${attach.planner.path}")
	private String plannerPath;

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

		int check = plannerDao.insertPlanner(plannerDto);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);

		long diff = plannerDto.getEnd_date().getTime() - plannerDto.getStart_date().getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);

		getSpotList(mav);
		mav.addObject("plannerDto", plannerDto);
		mav.addObject("check", check);
		mav.addObject("day_count", diffDays+1);
		mav.setViewName("user/planner/addPlanner");
	}

	@Override
	public List<PlannerDto> getPlannerListByMember(HttpServletRequest request) {
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		String mem_no = request.getParameter("mem_no");

		// 자기 페이지에서 plannerList를 불러오면 request에 mem_no가 없음 
		PlannerDto plannerDto = new PlannerDto();
		if(mem_no == null){
			plannerDto.setMem_no(userInfo.getMem_no());
			plannerDto.setUse_yn(Constant.SYNB_YN_D);
		}else{
			plannerDto.setMem_no(Integer.parseInt(mem_no));
			plannerDto.setUse_yn(Constant.SYNB_YN_Y);
		}

		return plannerDao.getPlannerListByMember(plannerDto);
	}
	
	@Override
	public void getPlannerListForAll(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		PlannerDto plannerDto =(PlannerDto)map.get("plannerDto");
		
		List<PlannerDto> plannerList = plannerDao.getPlannerListForAll(plannerDto);
		
		List<CommonCodeDto> selectCode=commonCodeService.getListCodeGroup(Constant.SCHEDULE_TYPE_GROUP);
		List<CommonCodeDto> sortCode=commonCodeService.getListCodeGroup(Constant.SERACH_SORT_GROUPCODE);
		
		//페이징 및 검색 정보를 가진DTO
		mav.addObject("plannerDto",plannerDto);
		
		mav.addObject("selectCode",selectCode);
		mav.addObject("sortCode",sortCode);
		mav.addObject("plannerList", plannerList);
		mav.setViewName("user/planner/plannerList");
	}

	@Override
	public void getOnePlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));

		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		int mem_no = 0;
		if(userInfo != null)
			mem_no = userInfo.getMem_no();

		PlannerDto plannerDto = plannerDao.getOnePlanner(planner_no);
		
		// planner 날짜 정보 계산
		long diff = plannerDto.getEnd_date().getTime() - plannerDto.getStart_date().getTime();
		int dayCount = (int) diff / (24 * 60 * 60 * 1000);
		String[] dateList = new String[dayCount+1];
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd (E)");
		Calendar cal = new GregorianCalendar();
		cal.setTime(plannerDto.getStart_date());
		System.out.println("****Date****");
		for(int i = 0; i <= dayCount; i++){
			dateList[i] = sdf.format(cal.getTime());
			System.out.println(dateList[i]);
			cal.add(Calendar.DATE, 1);
		}

		// Planner 작성자의 정보를 가져온다.
		MemberDto plannerWriter = new MemberDto();
		plannerWriter = memberDao.memberRead(plannerDto.getMem_no());

		// Planner에 저장되어 있는 아이템 항목들을 가져오기
		List<ItemDto> itemList = plannerDao.getItemList(planner_no);
		double[] moneyTotal = new double[9];

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

			// 아이템 별 가계부 가져오기
			List<MoneyDto> moneyList = plannerDao.getMoneyList(itemList.get(i).getItem_no());
			itemList.get(i).setMoneyList(moneyList);

			// 총 비용을 더해주기
			for(int j = 0; j < moneyList.size(); j++){
				String type_code = moneyList.get(j).getMoney_type_code();
				if(type_code.equals(Constant.MONEY_FLIGHT)){
					moneyTotal[0]+=moneyList.get(j).getPrice();
				}else if(type_code.equals(Constant.MONEY_ACCOMM)){
					moneyTotal[1]+=moneyList.get(j).getPrice();
				}else if(type_code.equals(Constant.MONEY_TRANSIT)){
					moneyTotal[2]+=moneyList.get(j).getPrice();
				}else if(type_code.equals(Constant.MONEY_SHOPPING)){
					moneyTotal[3]+=moneyList.get(j).getPrice();
				}else if(type_code.equals(Constant.MONEY_FOOD)){
					moneyTotal[4]+=moneyList.get(j).getPrice();
				}else if(type_code.equals(Constant.MONEY_ADMISSION)){
					moneyTotal[5]+=moneyList.get(j).getPrice();
				}else if(type_code.equals(Constant.MONEY_PLAY)){
					moneyTotal[6]+=moneyList.get(j).getPrice();
				}else if(type_code.equals(Constant.MONEY_ETC)){
					moneyTotal[7]+=moneyList.get(j).getPrice();
				}
				moneyTotal[8]+=moneyList.get(j).getPrice();
			}
		}

		EverywhereAspect.logger.info(EverywhereAspect.logMsg + itemList.size());
		
		// 해당 Planner의 추천 개수를 가져오기
		int sweet_count = sweetDao.getTotalSweet(planner_no);
		int bookmark_count = 0;
		
		// 해당 Planner의 추천, 즐겨찾기 등 버튼 활성화 정보를 가저오기
		// 로그인 안한 사람은 숫자 -1, 
		int checkSweet = -1;
		int checkBookMark = -1;
		// 로그인 한 사람과 글 쓴 사람이 동일하면 숫자 2
		if(mem_no == plannerDto.getMem_no()){
			checkSweet = 2;
			checkBookMark = 2;
		}
		//로그인 했으나 추천&즐겨찾기 안했으면 숫자 0, 했으면 숫자 1가 리턴된다.
		if(mem_no != 0 && mem_no != plannerDto.getMem_no()){
			SweetDto sweetDto = new SweetDto();
			sweetDto.setMem_no(mem_no);
			sweetDto.setPlanner_no(planner_no);
			checkSweet = sweetDao.isSweet(sweetDto);
			
			BookMarkDto bookMarkDto = new BookMarkDto();
			bookMarkDto.setMem_no(mem_no);
			bookMarkDto.setBookmark_type_code(Constant.SCHEDULE_TYPE_PLANNER);
			bookMarkDto.setItem_no(planner_no);
			checkBookMark = bookMarkDao.isBookMarked(bookMarkDto);
			bookmark_count = bookMarkDao.getTotalBookMark(bookMarkDto);
		}

		mav.addObject("plannerDto", plannerDto);
		mav.addObject("dateList", dateList);
		mav.addObject("moneyTotal", moneyTotal);
		mav.addObject("plannerWriter", plannerWriter);
		mav.addObject("itemList", itemList);
		mav.addObject("sweet_count", sweet_count);
		mav.addObject("bookmark_count", bookmark_count);
		mav.addObject("checkSweet", checkSweet);
		mav.addObject("checkBookMark", checkBookMark);
		mav.setViewName("user/planner/plannerRead");
	}

	@Override
	public void writePlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));

		PlannerDto plannerDto = plannerDao.getOnePlanner(planner_no);
		mav.addObject("plannerDto", plannerDto);
		
		getSpotList(mav);

		long diff = plannerDto.getEnd_date().getTime() - plannerDto.getStart_date().getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);
		mav.addObject("day_count", diffDays+1);

		mav.setViewName("user/planner/addPlanner");
	}

	@Override
	public void getSpotList(ModelAndView mav) {
		List<SpotDto> spotList = spotDao.getSpotAllListForPlanner();
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
	}

	@Override
	public void writePlannerOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);

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
		int mem_no = userInfo.getMem_no();
		plannerDto.setMem_no(mem_no);		
		plannerDto.setTitle(request.getParameter("planner_title"));
		plannerDto.setMemo(request.getParameter("planner_memo").replace("\r\n", "<br/>"));

		CommonFileIODto commonFileIODto = commonFileIOService.requestWriteFileAndDTO(request, "attach_file", plannerPath);
		if(commonFileIODto != null){
			commonFileIODto.setType_code(Constant.FILE_TYPE_SCHEDULE);
			commonFileIODto.setWrite_no(mem_no);
			String planner_photo_num = commonFileIOService.insertFileInfo(commonFileIODto) + "";
			plannerDto.setAttach_file(planner_photo_num);
		}

		String start_date = request.getParameter("start_date");
		String day_count = request.getParameter("day_count");		
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
				itemDto.setItem_time(request.getParameter(itemString+"_time"));

				CommonFileIODto commonFileIODto = commonFileIOService.requestWriteFileAndDTO(request, itemString + "_attach_photoes", itemPath);
				if(commonFileIODto != null){
					commonFileIODto.setType_code(Constant.FILE_TYPE_ITEM);
					
					commonFileIODto.setWrite_no(mem_no);
					String item_photo_num = commonFileIOService.insertFileInfo(commonFileIODto) + ",";
					System.out.println("item_photo_num : " + item_photo_num);
					itemDto.setAttach_photoes(item_photo_num);
				}

				String item_time = request.getParameter(itemString+"_time");
				itemDto.setItem_time(item_time);

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
					// 가계부 방어코드
					String price = request.getParameter(moneyString+"_price");
					if(price == null || price.equals("")){
						price = "0";
					}
					moneyDto.setPrice(Double.parseDouble(price));
					moneyList.add(moneyDto);
				}
			}
		}
	}

	@Override
	public void lockPlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));
		boolean isLock = Boolean.parseBoolean(request.getParameter("isLock"));
		PlannerDto plannerDto = new PlannerDto();

		if(isLock == true)
			plannerDto.setUse_yn(Constant.SYNB_YN_N);
		else
			plannerDto.setUse_yn(Constant.SYNB_YN_Y);

		plannerDto.setPlanner_no(planner_no);
		plannerDto.setMem_no(userInfo.getMem_no());
		
		int check = plannerDao.updatePlannerStatus(plannerDto);
		
		try {
			response.setContentType("application/html;charset=utf8");
			PrintWriter out = response.getWriter();
			out.print(check+","+isLock);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deletePlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));
		
		PlannerDto plannerDto = new PlannerDto();
		plannerDto.setUse_yn(Constant.SYNB_YN_D);
		plannerDto.setPlanner_no(planner_no);
		plannerDto.setMem_no(userInfo.getMem_no());

		int check = plannerDao.updatePlannerStatus(plannerDto);

		mav.addObject("check", check);
		mav.addObject("planner_no", planner_no);
		mav.setViewName("user/planner/plannerDelete");
	}
	
	@Override
	public void updatePlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));

		PlannerDto plannerDto = plannerDao.getOnePlanner(planner_no);

		// Planner에 저장되어 있는 아이템 항목들을 가져오기
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

			// 아이템 별 가계부 가져오기
			List<MoneyDto> moneyList = plannerDao.getMoneyList(itemList.get(i).getItem_no());
			itemList.get(i).setMoneyList(moneyList);
		}
		
		long diff = plannerDto.getEnd_date().getTime() - plannerDto.getStart_date().getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);

		getSpotList(mav);
		mav.addObject("day_count", diffDays+1);

		mav.addObject("plannerDto", plannerDto);
		mav.addObject("itemList", itemList);
		mav.setViewName("user/planner/plannerUpdate");
	}
}
