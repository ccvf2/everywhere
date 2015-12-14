package everywhere.com.mynetgear.ccvf2.user.service.accompany;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.dao.commoncode.CommonCodeDao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOService;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.CommonUtils;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.accompany.AccompanyDao;
import everywhere.com.mynetgear.ccvf2.user.dto.accompany.AccompanyDto;
import oracle.jdbc.Const;


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
	private CommonCodeService commonCodeService;
	
	@Autowired
	private CommonFileIOService commonFileIOService;

	@Value("${attach.accompany.path}")
	private String accompanyPath;
	
	
	@Override
	public void mainAccompany(ModelAndView mav) {
		mav.setViewName("user/accompany/accompanyMainPage");
	}

	@Override
	public void insertAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 성별 코드 가져옴
		List<CommonCodeDto> genderList = commonCodeService.getListCodeGroup("G0001");
		//게시글 종류 코드 가져옴
		List<CommonCodeDto> postTypeList = commonCodeService.getListCodeGroup("H0001");
		
		mav.addObject("postTypeList", postTypeList);
		mav.addObject("genderList", genderList);
		mav.setViewName("user/accompany/accompanyWrite");
	}

	@Override
	public void insertOkAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		AccompanyDto accompanyDto = new AccompanyDto();
		int check = 0;
		
		
		/*글쓴이: 임시라 변경 필요*/
//		int mem_no = request.getParameter("mem_no");
		String mem_no = "64";
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String gender_code = request.getParameter("gender_code");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		
		try {
			if(mem_no.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "회원 번호가 입력되지 않았습니다. ");
			} else if (!(gender_code.equals(Constant.ACCOMPANY_GENDER_BOTH) || gender_code.equals(Constant.ACCOMPANY_GENDER_MALE) || gender_code.equals(Constant.ACCOMPANY_GENDER_FEMALE))){
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "gender_code Error");
			} else if (title.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "제목은 반드시 입력되어야함 ");
			} else if (content.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "내용이 입력되지 않았습니다.");
			} else {
				// 실제 구현부
				
				accompanyDto.setMem_no(Integer.parseInt(mem_no));

				/*제목 및 HTML제거*/
				accompanyDto.setTitle(CommonUtils.deleteHTML(title));
				
				/*내용 및 HTML 제거*/
				accompanyDto.setContent(CommonUtils.deleteHTML(content));
				System.out.println(accompanyDto.getContent());

				/*enter값 처리*/
				accompanyDto.setContent(accompanyDto.getContent().replace("\r\n", "<br/>"));
				/*성별 코드: 1. 남자, 2. 여자, 3. 둘다*/
				accompanyDto.setGender_code(gender_code);
				
				/*기본값으로 동행은 구해지지 않았다*/
				accompanyDto.setAccompany_status_code(request.getParameter("accompany_status_code"));
				
				
				/*여행 시작일 - 여행 종료일 Date 형식으로 변경*/
				try {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					accompanyDto.setStart_date(sdf.parse(start_date));
					accompanyDto.setEnd_date(sdf.parse(end_date));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				accompanyDto.setUse_yn(Constant.SYNB_YN_Y);
				
				if(request.getParameter("file")!=null) {
					CommonFileIODto commonFileIODto = commonFileIOService.requestWriteFileAndDTO(request, "file", accompanyPath);
					commonFileIOService.insertFileInfo(commonFileIODto);
				}
				
				check = accompanyDao.insertAccompany(accompanyDto);
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			mav.addObject("check", check);
			mav.setViewName("user/accompany/accompanyWriteOk");
		}
	}

	@Override
	public void getAccompanyList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//한 페이지에 보여줄 게시물 수 (추후 변경 필요)
		int boardSize = 9;
		
		//요청한 페이지
		String pageNumber = request.getParameter("pageNumber");
		
		if(pageNumber==null){
			pageNumber = "1"; 
		}
		/*if(StringUtils.equals(pageNumber, Constant.SYNB_NULL)) {
			pageNumber = "1"; 	
		}*/
		
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
		
		//게시글 종류 코드 가져옴
		List<CommonCodeDto> postTypeList = commonCodeService.getListCodeGroup("H0001");
		
		mav.addObject("count", count);
		mav.addObject("postTypeList", postTypeList);
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
		// 세션에서 회원no 가져옴 (수정 및 삭제 버튼을 보여줄지 여부를 선택하기 위함)
		//int mem_no = (Integer) session.getAttribute("mem_no");
		int mem_no=64;//임시
		int ownerCheck = accompanyDao.checkUserAccompany(accompany_no, mem_no);
		
		//성별 코드 가져옴
		List<CommonCodeDto> genderList = commonCodeService.getListCodeGroup("G0001");
		
		//게시글 종류 코드 가져옴
		List<CommonCodeDto> postTypeList = commonCodeService.getListCodeGroup("H0001");
		
		mav.addObject("postTypeList", postTypeList);
		mav.addObject("genderList", genderList);
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
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompany_no + "\t" + mem_no);
		
		mav.addObject("check", check);
		mav.setViewName("user/accompany/accompanyDelete");
	}

	@Override
	public void updateAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		int accompany_no = Integer.parseInt(request.getParameter("accompany_no"));
		int currentPage = Integer.parseInt(request.getParameter("pageNumber"));
		
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompany_no + "\t" + currentPage);
		
		//성별 코드 가져옴
		List<CommonCodeDto> genderList = commonCodeService.getListCodeGroup("G0001");
		//게시글 종류 코드 가져옴
		List<CommonCodeDto> postTypeList = commonCodeService.getListCodeGroup("H0001");
		
		AccompanyDto accompanyDto = accompanyDao.readAccompany(accompany_no);
		 accompanyDto.printAll();
		
		// 세션에서 회원no 가져옴
		//int mem_no = (Integer) session.getAttribute("mem_no");
		// 세션이 없으므로 임시로 64로 둠
		int mem_no=64;
		int ownerCheck = accompanyDao.checkUserAccompany(accompany_no, mem_no);
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("genderList", genderList);
		mav.addObject("postTypeList", postTypeList);
		mav.addObject("ownerCheck", ownerCheck);
		mav.addObject("accompanyDto", accompanyDto);
		mav.setViewName("user/accompany/accompanyUpdate");
	}

	@Override
	public void updateOkAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		int check = 0;
		AccompanyDto accompanyDto = new AccompanyDto();
		
		String accompany_no = request.getParameter("accompany_no");
		/*글쓴이: 임시라 변경 필요*/
//		int mem_no = request.getParameter("mem_no");
		String mem_no = "64";
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String gender_code = request.getParameter("gender_code");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		try {
			if(accompany_no.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "게시글 번호가 없습니다.");
			} else if(mem_no.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "회원 정보가 없음");
			} else if (!(gender_code.equals(Constant.ACCOMPANY_GENDER_BOTH) || gender_code.equals(Constant.ACCOMPANY_GENDER_MALE) || gender_code.equals(Constant.ACCOMPANY_GENDER_FEMALE))){
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "gender_code Error");
			} else if (title.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "제목은 반드시 입력되어야함 ");
			} else if (content.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "내용이 입력되지 않았습니다.");
			} else {
				// 실제 구현부
				accompanyDto.setAccompany_no(Integer.parseInt(accompany_no));
				accompanyDto.setMem_no(Integer.parseInt(mem_no));
				/*제목 및 HTML제거*/
				accompanyDto.setTitle(CommonUtils.deleteHTML(title));
				/*내용 및 HTML 제거*/
				accompanyDto.setContent(CommonUtils.deleteHTML(content));
				/*enter값 처리*/
				accompanyDto.setContent(accompanyDto.getContent().replace("\r\n", "<br/>"));;
				/*성별 코드: 1. 남자, 2. 여자, 3. 둘다*/
				accompanyDto.setGender_code(gender_code);
				
				/*기본값으로 동행은 구해지지 않았다*/
				accompanyDto.setAccompany_status_code(request.getParameter("accompany_status_code"));
				
				/*여행 시작일 - 여행 종료일 Date 형식으로 변경*/
				try {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					accompanyDto.setStart_date(sdf.parse(start_date));
					accompanyDto.setEnd_date(sdf.parse(end_date));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				accompanyDto.setUse_yn(Constant.SYNB_YN_Y);
				
				//테스트 용
				accompanyDto.printAll();
				
//				파일 추가 필요
				/*	CommonFileIOServiceImp nd=new CommonFileIOServiceImp();
					CommonFileIODto filedto= nd.requestWriteFileAndDTO(request, "file", savePath);*/
					
				check = accompanyDao.updateAccompany(accompanyDto);
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			mav.addObject("check", check);
			mav.addObject("accompanyDto", accompanyDto);
			mav.addObject("currentPage", currentPage);
			mav.setViewName("user/accompany/accompanyUpdateOk");
		}
		
	}
}
