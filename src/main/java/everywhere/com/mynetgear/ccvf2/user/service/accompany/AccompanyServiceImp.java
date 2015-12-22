package everywhere.com.mynetgear.ccvf2.user.service.accompany;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonFileIODao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOService;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.CommonUtils;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.accompany.AccompanyDao;
import everywhere.com.mynetgear.ccvf2.user.dto.accompany.AccompanyDto;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

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
	
	@Autowired
	private CommonFileIODao commonFileIODao;

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
		// 게시글 종류 코드 가져옴
		List<CommonCodeDto> postTypeList = commonCodeService.getListCodeGroup("H0001");

		// 최근 글 용 리스트 5개 가져옴
		List<AccompanyDto> recentAccompanyList = null;
		recentAccompanyList = accompanyDao.getRecentAccompanyList();

		mav.addObject("recentAccompanyList", recentAccompanyList);
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

		/* 글쓴이: 임시라 변경 필요 */
		// int mem_no = request.getParameter("mem_no");
		String mem_no = request.getParameter("mem_no");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String gender_code = request.getParameter("gender_code");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		try {
			if (mem_no.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "회원 번호가 입력되지 않았습니다. ");
			} else if (!(gender_code.equals(Constant.ACCOMPANY_GENDER_BOTH)
					|| gender_code.equals(Constant.ACCOMPANY_GENDER_MALE)
					|| gender_code.equals(Constant.ACCOMPANY_GENDER_FEMALE))) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "gender_code Error");
			} else if (title.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "제목은 반드시 입력되어야함 ");
			} else if (content.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "내용이 입력되지 않았습니다.");
			} else {
				// 실제 구현부
				accompanyDto.setMem_no(Integer.parseInt(mem_no));

				/* 제목 및 HTML제거 */
				accompanyDto.setTitle(CommonUtils.deleteHTML(title));

				/* 내용 및 HTML 제거 */
				accompanyDto.setContent(CommonUtils.deleteHTML(content));
				System.out.println(accompanyDto.getContent());

				/* enter값 처리 */
				accompanyDto.setContent(accompanyDto.getContent().replace("\r\n", "<br/>"));
				/* 성별 코드: 1. 남자, 2. 여자, 3. 둘다 */
				accompanyDto.setGender_code(gender_code);

				/* 기본값으로 동행은 구해지지 않았다 */
				accompanyDto.setAccompany_status_code(request.getParameter("accompany_status_code"));

				/* 여행 시작일 - 여행 종료일 Date 형식으로 변경 */
				try {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					accompanyDto.setStart_date(sdf.parse(start_date));
					accompanyDto.setEnd_date(sdf.parse(end_date));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				accompanyDto.setUse_yn(Constant.SYNB_YN_Y);

				// 파일 쓰기를 위해 시퀀스를 가져온다.
				int accompany_no_nextSeq = accompanyDao.getAccompanyNextSeq();
				accompanyDto.setAccompany_no(accompany_no_nextSeq);

				CommonFileIODto commonFileIODto = commonFileIOService.requestWriteFileAndDTO(request, "accompany_file",
						accompanyPath);

				if (commonFileIODto != null) {
					commonFileIODto.setType_code(Constant.FILE_TYPE_ACCOMPANY);
					commonFileIODto.setWrite_no(accompanyDto.getAccompany_no());
					int accompanyPhoto = commonFileIOService.insertFileInfo(commonFileIODto);
					System.out.println("accompanyPhoto : " + accompanyPhoto);
					accompanyDto.setAttach_file("" + accompanyPhoto);
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
		// 검색 파라메터
		String searchValue = request.getParameter("search");
		// 카테고리 파라메터
		String accompany_status_code = request.getParameter("accompany_status_code");
		// 한 페이지에 보여줄 게시물 수 (추후 변경 필요)
		int boardSize = 15;

		// 요청한 페이지
		String pageNumber = request.getParameter("pageNumber");

		if (pageNumber == null) {
			pageNumber = "1";
		}
		/*
		 * if(StringUtils.equals(pageNumber, Constant.SYNB_NULL)) { pageNumber =
		 * "1"; }
		 */

		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;

		// 게시글 수 가져옴
		int count = 0;

		count = accompanyDao.getAccompanyCount(searchValue, accompany_status_code);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + count);

		// 게시물 리스트 가져옴
		List<AccompanyDto> accompanyList = null;
		if (count > 0) {
			accompanyList = accompanyDao.getAccompanyList(startRow, endRow, searchValue, accompany_status_code);
		}

		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompanyList.size());

		// mem_name테스터
		// for(int i = 0; i<accompanyList.size(); i++) {
		// EverywhereAspect.logger.info(EverywhereAspect.logMsg +
		// accompanyList.get(0).getMem_name());
		// }

		// 게시글 종류 코드 가져옴
		List<CommonCodeDto> postTypeList = commonCodeService.getListCodeGroup("H0001");

		// 최근 글 용 리스트 5개 가져옴
		List<AccompanyDto> recentAccompanyList = null;
		recentAccompanyList = accompanyDao.getRecentAccompanyList();

		mav.addObject("searchValue", searchValue);
		mav.addObject("recentAccompanyList", recentAccompanyList);
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
		//int mem_no = (Integer) session.getAttribute("mem_no");
		//성별 코드 가져옴
		List<CommonCodeDto> genderList = commonCodeService.getListCodeGroup("G0001");
		
		//게시글 종류 코드 가져옴
		List<CommonCodeDto> postTypeList = commonCodeService.getListCodeGroup("H0001");
		
		
		//최근 글 용 리스트 5개 가져옴
		List<AccompanyDto> recentAccompanyList = null;
		recentAccompanyList = accompanyDao.getRecentAccompanyList();
		
		mav.addObject("recentAccompanyList", recentAccompanyList);
		mav.addObject("postTypeList", postTypeList);
		mav.addObject("genderList", genderList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("accompanyDto", accompanyDto);
		mav.setViewName("user/accompany/accompanyRead");
	}

	@Override
	public void deleteAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int accompany_no = Integer.parseInt(request.getParameter("accompany_no"));
		MemberDto memberDto = (MemberDto) request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		AccompanyDto accompanyDto = accompanyDao.getOneAccompany(accompany_no);
		// 게시글 write mem_no와 세션의 mem_no가 일치할때

		int check = accompanyDao.deleteAccompany(accompany_no, memberDto.getMem_no());
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompany_no + "\t" + memberDto.getMem_no());
		if(check > 0) {
			commonFileIOService.requestDeleteFile(accompanyPath, accompanyDto.getAttach_file());
		}
		mav.addObject("check", check);
		mav.setViewName("user/accompany/accompanyDelete");
	}

	@Override
	public void updateAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int accompany_no = Integer.parseInt(request.getParameter("accompany_no"));
		
		String currentPage = request.getParameter("pageNumber");
		if(currentPage == null) {
			currentPage = "1";
		}

		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompany_no + "\t" + currentPage);

		// 성별 코드 가져옴
		List<CommonCodeDto> genderList = commonCodeService.getListCodeGroup("G0001");
		// 게시글 종류 코드 가져옴
		List<CommonCodeDto> postTypeList = commonCodeService.getListCodeGroup("H0001");

		AccompanyDto accompanyDto = accompanyDao.getOneAccompany(accompany_no);
		//AccompanyDto accompanyDto = accompanyDao.(accompany_no);
		accompanyDto.printAll();

		// 세션에서 회원no 가져옴
		MemberDto memberDto = (MemberDto) request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		int ownerCheck = accompanyDao.checkUserAccompany(accompany_no, memberDto.getMem_no());
		
				
		// 최근 글 용 리스트 5개 가져옴
		List<AccompanyDto> recentAccompanyList = null;
		recentAccompanyList = accompanyDao.getRecentAccompanyList();

		mav.addObject("recentAccompanyList", recentAccompanyList);
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
		String currentPage = request.getParameter("pageNumber");
		if(currentPage == null) {
			currentPage = "1";
		}

		int check = 0;
		AccompanyDto accompanyDto = new AccompanyDto();

		String accompany_no = request.getParameter("accompany_no");
		/* 세션 가져옴 */
		MemberDto memberDto = (MemberDto) request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);

		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String gender_code = request.getParameter("gender_code");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		try {
			if (accompany_no.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "게시글 번호가 없습니다.");
			} else if (memberDto == null) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "회원 정보가 없음");
			} else if (!(gender_code.equals(Constant.ACCOMPANY_GENDER_BOTH)
					|| gender_code.equals(Constant.ACCOMPANY_GENDER_MALE)
					|| gender_code.equals(Constant.ACCOMPANY_GENDER_FEMALE))) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "gender_code Error");
			} else if (title.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "제목은 반드시 입력되어야함 ");
			} else if (content.equals(Constant.SYNB_NULL)) {
				EverywhereAspect.logger.info(EverywhereAspect.logMsg + "내용이 입력되지 않았습니다.");
			} else {
				// 실제 구현부
				accompanyDto.setAccompany_no(Integer.parseInt(accompany_no));
				accompanyDto.setMem_no(memberDto.getMem_no());
				/* 제목 및 HTML제거 */
				accompanyDto.setTitle(CommonUtils.deleteHTML(title));
				/* 내용 및 HTML 제거 */
				accompanyDto.setContent(CommonUtils.deleteHTML(content));
				/* enter값 처리 */
				accompanyDto.setContent(accompanyDto.getContent().replace("\r\n", "<br/>"));
				;
				/* 성별 코드: 1. 남자, 2. 여자, 3. 둘다 */
				accompanyDto.setGender_code(gender_code);

				/* 기본값으로 동행은 구해지지 않았다 */
				accompanyDto.setAccompany_status_code(request.getParameter("accompany_status_code"));

				/* 여행 시작일 - 여행 종료일 Date 형식으로 변경 */
				try {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					accompanyDto.setStart_date(sdf.parse(start_date));
					accompanyDto.setEnd_date(sdf.parse(end_date));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				accompanyDto.setUse_yn(Constant.SYNB_YN_Y);
				
				
				CommonFileIODto commonFileIODto = commonFileIOService.requestWriteFileAndDTO(request, "accompany_file",
						accompanyPath);

				if (commonFileIODto != null) {
					//기존 파일 삭제
					//기존에 업로드 되어있던 파일을 삭제하기 위해서 업데이트 이전의 DTO를 가져옴
					AccompanyDto oldAccompanyDto = accompanyDao.getOneAccompany(accompanyDto.getAccompany_no());
					commonFileIOService.requestDeleteFile(accompanyPath, oldAccompanyDto.getAttach_file());
					//새로운 파일 쓰기 작업 시작
					commonFileIODto.setType_code(Constant.FILE_TYPE_ACCOMPANY);
					commonFileIODto.setWrite_no(accompanyDto.getAccompany_no());
					int accompanyPhoto = commonFileIOService.insertFileInfo(commonFileIODto);
					System.out.println("accompanyPhoto : " + accompanyPhoto);
					//DTO의 파일 이름이 바뀌었다.
					accompanyDto.setAttach_file("" + accompanyPhoto);
				}

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
