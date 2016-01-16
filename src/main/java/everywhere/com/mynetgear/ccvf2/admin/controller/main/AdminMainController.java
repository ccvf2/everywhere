package everywhere.com.mynetgear.ccvf2.admin.controller.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dao.chart.ChartDao;
import everywhere.com.mynetgear.ccvf2.admin.service.main.AdminMainService;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.MailVO;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOService;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOServiceImp;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.comm.util.common.MailSend;

/**
 * @author 배성욱
 * @createDate 2015. 12. 5.
 * @described 관리자 메인페이지 컨트롤러
 * @reference Controller
 */
@Controller
public class AdminMainController {
	@Autowired
	private AdminMainService adminMainService;
	@Autowired
	private CommonCodeService commonCodeService;
	@Autowired
	private CommonFileIOService commonFileIOService;
	@Autowired
	private ChartDao chartDao;

	@Value("${attach.temp.path}")
	private String tempPath;
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 5.
	 * @return
	 */
	@RequestMapping(value="/admin/main/main.do", method=RequestMethod.GET)
	public ModelAndView mainPage() {
		ModelAndView mav= new ModelAndView();
		
		System.out.println("컨트롤러");
		adminMainService.mainPage(mav);
		return mav;
	}
	
	/**
	 * @author 김성광
	 * @createDate 2015. 12. 27.
	 * @described mainPage chart
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/admin/main/main.ajax", method=RequestMethod.GET)
	public void mainPageChart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date=sdf.format(d);
        System.out.println("date : " + date.substring(5, 7));
        String monthE=date.substring(5, 7);
        int monthS=Integer.parseInt(monthE)-2;
		String year=date.substring(0, 4);
		
		List<Integer> chartList=chartDao.getChartMonthList(monthS+"", monthE, year);
        
		JSONArray jarray=new JSONArray();
		for (int i = 0; i < chartList.size(); i++) {
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("stats_month", monthS+i);
			map.put("stats_count", chartList.get(i));
			
			jarray.add(map);
		}
		String jsonData = jarray.toJSONString();
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonData);
	}

	@RequestMapping(value="/admin/commoncode/code.do", method=RequestMethod.GET)
	public ModelAndView showCode() {
		ModelAndView mav= new ModelAndView();
		commonCodeService.callCodeSettingPage(mav);
		return mav;
	}
	@RequestMapping(value="/admin/commoncode/code.do", method=RequestMethod.POST)
	public ModelAndView showCode(HttpServletRequest request, HttpServletResponse response,CommonCodeDto dto) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("commonCodeDto",dto);
		commonCodeService.callCodeSettingPage(mav);
		return mav;
	}
	@RequestMapping(value="/admin/commoncode/codeModify.do", method=RequestMethod.POST)
	public ModelAndView modifyCode(HttpServletRequest request, HttpServletResponse response,CommonCodeDto dto) {
		ModelAndView mav= new ModelAndView();
		System.out.println("입력요청");
		mav.addObject("request",request);
		mav.addObject("commonCodeDto",dto);
		commonCodeService.callCodeSetting(mav);
		return mav;
	}
	
	
	
	
	
	
	
	//---------------------------------테스트 코드----------------------------------------------------------
	
/*	*//** 파일 테스트 
	 * @throws Exception *//*
	@RequestMapping(value="/test/test2.do", method=RequestMethod.GET)
	public ModelAndView filetest() throws Exception {
		System.out.println("파일테스트 입력요청 GET");
		ModelAndView mav= new ModelAndView();
		System.out.println(Constant.LOG_ID3+this.tempPath);

		//MailUtil mail = new MailUtil();
		//mail.name();
		MailSend mail = new MailSend();
		MailVO vo =new MailVO();
		mail.mailSender(vo);
		mav.setViewName("/admin/code/TESTFILE");
		return mav;
	}
	
	*//** 파일 테스트 
	 * @param request 
	 * @param response 
	 * @return *//*
	@RequestMapping(value="/test/test.do", method=RequestMethod.POST)
	public ModelAndView filetest(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav= new ModelAndView();
		System.out.println("파일테스트 입력요청 post");
		String param = request.getParameter("crud");
		String savePath = request.getParameter("savePath");
		String fileName = request.getParameter("fileName");
		CommonFileIOService dsdr= new CommonFileIOServiceImp();
		if(StringUtils.equals(param, Constant.SYNB_CRUD_C)){
			CommonFileIODto commonFileIODto= dsdr.requestWriteFileAndDTO(request, "file", tempPath);
			//CommonFileIODto가 null 이면 파일이 작성되지 않은것이다.
			if(commonFileIODto!=null){
				commonFileIODto.setType_code("a");
				commonFileIODto.setWrite_no(1);
				commonFileIOService.insertFileInfo(commonFileIODto);
			}
		}else{
			boolean dtoa= dsdr.requestDeleteFile(savePath, fileName);
			System.out.println(dtoa);
		}
		return null;
	}
	
	@RequestMapping(value="/test/reply.do", method=RequestMethod.GET)
	public ModelAndView commonReply(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/common/reply/commonReply");
		return mav;
	}*/
	
}
