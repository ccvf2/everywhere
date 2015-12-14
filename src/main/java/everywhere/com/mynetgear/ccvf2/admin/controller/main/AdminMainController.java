package everywhere.com.mynetgear.ccvf2.admin.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import everywhere.com.mynetgear.ccvf2.admin.service.main.AdminMainService;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.MailVO;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOService;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOServiceImp;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import testpa.MailSend;

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

	@RequestMapping(value="/admin/commoncode/code.do", method=RequestMethod.GET)
	public ModelAndView showCode() {
		ModelAndView mav= new ModelAndView();
		commonCodeService.callCodeSettingPage(mav);
		return mav;
	}
	@RequestMapping(value="/admin/commoncode/code.do", method=RequestMethod.POST)
	public ModelAndView settingCode(HttpServletRequest request, HttpServletResponse response,CommonCodeDto dto) {
		ModelAndView mav= new ModelAndView();
		System.out.println("입력요청");
		mav.addObject("request",request);
		mav.addObject("commonCodeDto",dto);
		commonCodeService.callCodeSetting(mav);
		return mav;
	}
	
	/** 파일 테스트 
	 * @throws Exception */
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
	
	/** 파일 테스트 
	 * @param request 
	 * @param response 
	 * @return */
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
	}
	
}
