package everywhere.com.mynetgear.ccvf2.admin.service.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dao.member.AdminMemberDao;
import everywhere.com.mynetgear.ccvf2.admin.dto.member.AdminMemberDto;
import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.comm.util.common.StringUtil;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 서비스 구현부
 * @reference class
 */
@Component
public class AdminMemberServiceImp implements AdminMemberService {
	@Autowired
	private AdminMemberDao adminMemberDao;

	@Autowired
	private CommonCodeService commonCodeService;

	@Override
	public void adminMemberList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		AdminMemberDto adminMemberDto = new AdminMemberDto();

		adminMemberDto.setMem_level_code(request.getParameter("memLevel"));
		adminMemberDto.setMem_status_code(request.getParameter("memStatus"));
		adminMemberDto.setMem_p_status_code(request.getParameter("phoneStatus"));
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		adminMemberDto.setMem_name(request.getParameter("name"));
		adminMemberDto.setMem_email(request.getParameter("email"));

		// 여행 시작일 - 여행 종료일 Date 형식으로 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		try {
			if (start_date != null) {
				adminMemberDto.setStart_date(sdf.parse(request.getParameter("start_date")));
			}
			if (end_date != null) {
				adminMemberDto.setEnd_date(sdf.parse(request.getParameter("end_date")));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		// 한 페이지에 보여줄 회원 수
		// 페이징 완성 되면 변경 예정
		adminMemberDto.setPageBlock(999999);
		
		// 요청한 페이지
		String pageNumber = request.getParameter("pageNumber");
		// 요청한 페이지가 없으면 1로 초기화
		if(pageNumber == null) {
			pageNumber = "1";
		}
		
		//현제페이지
		adminMemberDto.setCurrentPage(Integer.parseInt(pageNumber));
		//페이징에 필요한 부분 계산
		adminMemberDto.pageingCalculation(adminMemberDto.getPageBlock());
		// 검색되 회원 수 가져옴
		adminMemberDto.setTotalCount(adminMemberDao.getMemberCount(adminMemberDto));
		

		List<MemberDto> memberList = null;
		// 회원리스트 가져옴
		memberList = adminMemberDao.getMemberList(adminMemberDto);
		// System.out.println(memberList.size());

		// 사용자 레벨 공통 코드 가져옴
		List<CommonCodeDto> memLevelList = commonCodeService.getListCodeGroup("M0001");
		// 계정활성상태 공통 코드 가져옴
		List<CommonCodeDto> memStatusList = commonCodeService.getListCodeGroup("M1001");
		// 핸드폰인증상태 공통 코드 가져옴
		List<CommonCodeDto> phoneStatusList = commonCodeService.getListCodeGroup("M2001");

		mav.addObject("adminMemberDto", adminMemberDto);
		mav.addObject("memLevelList", memLevelList);
		mav.addObject("memStatusList", memStatusList);
		mav.addObject("phoneStatusList", phoneStatusList);

		mav.addObject("memberList", memberList);

		mav.setViewName("/admin/member/adminMemberList");
	}

	@Override
	public void adminMemberStatusUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		// 업데이트할 회원번호
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		String mem_status_code = request.getParameter("mem_status_code");

		MemberDto memberDto = new MemberDto();
		memberDto.setMem_no(mem_no);
		memberDto.setMem_status_code(mem_status_code);

		int check = adminMemberDao.updateMemberStatus(memberDto);
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);
		
		try {
			response.setContentType("application/html;charset=utf8");
			PrintWriter out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
