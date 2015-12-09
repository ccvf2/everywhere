package everywhere.com.mynetgear.ccvf2.user.service.accompany;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.dao.commoncode.CommonCodeDao;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.util.common.CommonUtils;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.accompany.AccompanyDao;
import everywhere.com.mynetgear.ccvf2.user.dto.accompany.AccompanyDto;


/**
 * @author 곽성국
 * @createDate 2015. 12. 7.
 * @described 동행구하기 Service구현부
 * @reference class
 */
@Component
public class AccompanyServiceImp implements AccompanyService {
	@Autowired
	private AccompanyDao accompanyDao;

	
	@Autowired
	private CommonCodeDao commonCodeDao;
	
	@Override
	public void mainAccompany(ModelAndView mav) {
		mav.setViewName("user/accompany/accompanyMainPage");
	}

	@Override
	public void insertAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		//List<CommonCodeDto> genderList = commonCodeDao.getOneCommonCodeInfo("G0001");
		
		//게시판 번호 가져오는 것으로 바꿀 예정
		int accompany_no = 4;
		
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompany_no);
		
		mav.addObject("accompany_no", accompany_no);
		mav.setViewName("user/accompany/accompanyWrite");
	}

	@Override
	public void insertOkAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		AccompanyDto accompanyDto = new AccompanyDto();
		
		/*글쓴이: 임시라 변경 필요*/
		accompanyDto.setMem_no(64);
		
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		
		/*여행 시작일 - 여행 종료일 Date 형식으로 변경*/
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			accompanyDto.setStart_date(sdf.parse(start_date));
			accompanyDto.setEnd_date(sdf.parse(end_date));

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//System.out.println("blah:" + accompanyDto.getStart_date());
		/*성별 코드: 1. 남자, 2. 여자, 3. 둘다*/
		accompanyDto.setGender_code(request.getParameter("gender_code"));
		
		
		/*제목 및 HTML제거*/
		accompanyDto.setTitle(CommonUtils.deleteHTML(request.getParameter("title")));
		/*내용 및 HTML 제거*/
		accompanyDto.setContent(CommonUtils.deleteHTML(request.getParameter("content")));
		/*기본값으로 동행은 구해지지 않았다*/
		accompanyDto.setAccompany_status_code(Constant.SYNB_YN_N);
		accompanyDto.setUse_yn(Constant.SYNB_YN_Y);
		
		accompanyDto.printAll();
		int check = accompanyDao.insertAccompany(accompanyDto);
		
		
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);
		
		
	/*	CommonFileIOServiceImp nd=new CommonFileIOServiceImp();
		CommonFileIODto filedto= nd.requestWriteFileAndDTO(request, "file", savePath);*/
		
		
		mav.addObject("check", check);
		mav.setViewName("user/accompany/accompanyWriteOk");
	}

	@Override
	public void getAccompanyList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		int boardSize = 9;
		
		String pageNumber = request.getParameter("pageNumber");
		
		if(pageNumber == null) {
			pageNumber = "1"; 	
		}
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		// 게시글 수 가져옴
		int count = accompanyDao.getAccompanyCount();
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + count);
		
		List<AccompanyDto> accompanyList = null;
		if(count > 0) {
			accompanyList = accompanyDao.getAccompanyList(startRow, endRow);
		}
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompanyList.size());
		
//		mem_name테스터
//		for(int i = 0; i<accompanyList.size(); i++) {
//			EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompanyList.get(0).getMem_name());
//		}
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("accompanyList", accompanyList);
		mav.setViewName("user/accompany/accompanyList");
	}

	@Override
	public void readAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		int accompany_no = Integer.parseInt(request.getParameter("accompany_no"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompany_no + "\t" + currentPage);
		
		AccompanyDto accompanyDto = accompanyDao.readAccompany(accompany_no);
		// accompanyDto.printAll();
		
		// 세션에서 회원no 가져옴
		//int mem_no = (Integer) session.getAttribute("mem_no");
		// 세션이 없으므로 임시로 64로 둠
		int mem_no=64;
		int ownerCheck = accompanyDao.checkUserAccompany(accompany_no, mem_no);
		
		mav.addObject("ownerCheck", ownerCheck);
		mav.addObject("currentPage", currentPage);
		mav.addObject("accompanyDto", accompanyDto);
		mav.setViewName("user/accompany/accompanyRead");
	}

	@Override
	public void deleteAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		
		// 세션 회원no 가져옴
		//String mem_no = (String) session.getAttribute("mem_no");
		int accompany_no = Integer.parseInt(request.getParameter("accompany_no"));
		
		// 세션에서 회원no 가져옴
		//int mem_no = (Integer) session.getAttribute("mem_no");
		// 세션이 없으므로 임시로 64로 둠
		int mem_no=64;
		
		//게시글 write mem_no와 세션의 mem_no가 일치할때
	
		int check =	accompanyDao.deleteAccompany(accompany_no, mem_no);
		
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompany_no);
		mav.addObject("check", check);
		mav.setViewName("user/accompany/accompanyDelete");
	}

	@Override
	public void updateAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		int accompany_no = Integer.parseInt(request.getParameter("accompany_no"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompany_no + "\t" + currentPage);
		
		AccompanyDto accompanyDto = accompanyDao.readAccompany(accompany_no);
		// accompanyDto.printAll();
		
		// 세션에서 회원no 가져옴
		//int mem_no = (Integer) session.getAttribute("mem_no");
		// 세션이 없으므로 임시로 64로 둠
		int mem_no=64;
		int ownerCheck = accompanyDao.checkUserAccompany(accompany_no, mem_no);
		
		mav.addObject("ownerCheck", ownerCheck);
		mav.addObject("accompanyDto", accompanyDto);
		mav.setViewName("user/accompany/accompanyRead");
	}
}
