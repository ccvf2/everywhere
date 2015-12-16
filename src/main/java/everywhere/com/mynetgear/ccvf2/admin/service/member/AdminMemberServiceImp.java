package everywhere.com.mynetgear.ccvf2.admin.service.member;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dao.member.AdminMemberDao;
import everywhere.com.mynetgear.ccvf2.admin.dto.member.AdminMemberDto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
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
		
		adminMemberDto.setSearch(request.getParameter("search"));
		adminMemberDto.setMemLevel(request.getParameter("memLevel")); 
		adminMemberDto.setMemStatus(request.getParameter("memStatus"));
		adminMemberDto.setPhoneStatus(request.getParameter("phoneStatus"));
		
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		
		/*여행 시작일 - 여행 종료일 Date 형식으로 변경*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(start_date != null) {
				adminMemberDto.setStart_date(sdf.parse(start_date));
			}
			if (end_date != null) {
				adminMemberDto.setEnd_date(sdf.parse(end_date));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		List<MemberDto> memberList = null;
		memberList = adminMemberDao.getMemberList(adminMemberDto);
		// System.out.println(memberList.size());

		// 사용자 레벨 공통 코드 가져옴
		List<CommonCodeDto> memLevelList = commonCodeService.getListCodeGroup("M0001");
		// 계정활성상태 공통 코드 가져옴
		List<CommonCodeDto> memStatusList = commonCodeService.getListCodeGroup("M1001");
		// 핸드폰인증상태 공통 코드 가져옴
		List<CommonCodeDto> phoneStatusList = commonCodeService.getListCodeGroup("M2001");

		
		mav.addObject("memLevelList", memLevelList);
		mav.addObject("memStatusList", memStatusList);
		mav.addObject("phoneStatusList", phoneStatusList);
		
		mav.addObject("memberList", memberList);

		mav.setViewName("/admin/member/adminMemberList");
	}
}
