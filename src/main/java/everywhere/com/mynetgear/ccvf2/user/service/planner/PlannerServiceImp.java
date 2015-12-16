package everywhere.com.mynetgear.ccvf2.user.service.planner;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.ItemDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.MoneyDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

@Component
public class PlannerServiceImp implements PlannerService {
	@Autowired
	private PlannerDao plannerDao;
	@Autowired
	private MemberDao memberDao;

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
		
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + itemList.size());
		
		mav.addObject("plannerDto", plannerDto);
		mav.addObject("itemList", itemList);
		mav.setViewName("user/planner/plannerRead");
	}

	@Override
	public void updatePlanner(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int planner_no = Integer.parseInt(request.getParameter("planner_no"));
		
		PlannerDto plannerDto = plannerDao.getOnePlanner(planner_no);
		
		mav.addObject("plannerDto", plannerDto);
		mav.setViewName("user/planner/addPlanner");
		//mav.setViewName("user/planner/NewFile2");
	}

	@Override
	public void updatePlannerOk(ModelAndView mav) {
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
		String end_date = request.getParameter("end_date");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");		
		
		try {
			plannerDto.setStart_date(dateFormat.parse(start_date));
			plannerDto.setEnd_date(dateFormat.parse(end_date));
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
				try {
					SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
					String start_time = request.getParameter(itemString+"_start_time");
					if(!start_time.equals("")){
						Date date = timeFormat.parse(start_time);
						itemDto.setStart_time(new Timestamp(date.getTime()));
					}
					String end_time = request.getParameter(itemString+"_end_time");
					if(!end_time.equals("")){
						Date date = timeFormat.parse(end_time);
						itemDto.setEnd_time(new Timestamp(date.getTime()));
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
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
