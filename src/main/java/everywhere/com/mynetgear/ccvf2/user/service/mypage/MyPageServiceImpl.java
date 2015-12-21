package everywhere.com.mynetgear.ccvf2.user.service.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonFileIODao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

/**
 * @author 김성광
 * @createDate 2015. 12. 19.
 * @described MyPage
 * @reference class
 */
@Component
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PlannerDao plannerDao;
	
	@Autowired
	private CommonFileIOService commonFileIOService;
	@Autowired
	private CommonFileIODao commonFileIoDao; 
	
	@Value("${attach.member.path}")
	private String memberPath;
	

	@Override
	public ModelAndView myPage(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		MemberDto memberDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		int mem_no=64;
		List<PlannerDto> plannerList = plannerDao.getPlannerList(mem_no);
		
		CommonFileIODto commonFileIODto=commonFileIoDao.getOneFileDto(Integer.parseInt(memberDto.getMem_profile_photo()));
		
		mav.addObject("commonFileIODto", commonFileIODto);
		mav.addObject("plannerList", plannerList);
		mav.addObject("mateCheck", 2);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("/user/myPage/myPage");
		return mav;
	}
	
	@Override
	public ModelAndView moveUserPage(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		int mate_no=Integer.parseInt(request.getParameter("mem_no"));
		
		MemberDto memberDto = memberDao.memberRead(mate_no);
		
		HttpSession session = request.getSession();
		MemberDto myDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		int mem_no=myDto.getMem_no();
		HashMap<String, Integer> mateMap=new HashMap<String, Integer>();
		
		mateMap.put("mem_no", mem_no);
		mateMap.put("mate_no", mate_no);
		
		int mateCheck=memberDao.getMateCheck(mateMap);
		
		mav.addObject("mateCheck", mateCheck);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("/user/myPage/myPage");
		
		return mav;
	}


	@Override
	public ModelAndView mateInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		MemberDto myDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		int mate_no=Integer.parseInt(request.getParameter("mem_no"));
		MemberDto memberDto = memberDao.memberRead(mate_no);
		
		HashMap<String, Integer> mateMap=new HashMap<String, Integer>();
		
		mateMap.put("mem_no", myDto.getMem_no());
		mateMap.put("mate_no", mate_no);
		
		int mateCheck=memberDao.mateInsert(mateMap);
		
		mav.addObject("mateCheck", mateCheck);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("/user/myPage/myPage");
		return mav;
	}

	@Override
	public ModelAndView mateDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		MemberDto myDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		int mate_no=Integer.parseInt(request.getParameter("mem_no"));
		MemberDto memberDto = memberDao.memberRead(mate_no);
		
		HashMap<String, Integer> mateMap=new HashMap<String, Integer>();
		
		mateMap.put("mem_no", myDto.getMem_no());
		mateMap.put("mate_no", mate_no);
		
		int mateCheck=memberDao.mateDelete(mateMap);

		if(mateCheck==1) mateCheck=0;
		
		mav.addObject("mateCheck", mateCheck);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("/user/myPage/myPage");
		return mav;
	}

	@Override
	public ModelAndView getListFriends(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		MemberDto memberDto = memberDao.memberRead(mem_no);
		
		List<MemberDto> friendsList=memberDao.getListFriends(mem_no);
		
		HttpSession session = request.getSession();
		MemberDto myDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		int mem_no_session=myDto.getMem_no();
		int mateCheck=2;
		
		if(mem_no_session!=mem_no){
			HashMap<String, Integer> mateMap=new HashMap<String, Integer>();
			mateMap.put("mem_no", mem_no_session);
			mateMap.put("mate_no", mem_no);
			
			mateCheck=memberDao.getMateCheck(mateMap);
		}
		
		mav.addObject("mateCheck", mateCheck);
		mav.addObject("memberDto", memberDto);
		mav.addObject("friendsList", friendsList);
		mav.setViewName("/user/myPage/myPageFriends");
		
		return mav;
	}

	@Override
	public ModelAndView updateProfilePhoto(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto) map.get("memberDto");
		
		
		CommonFileIODto commonFileIODto = commonFileIOService.requestWriteFileAndDTO(request, "mem_profile", memberPath);
		
		if(commonFileIODto != null){
			commonFileIODto.setType_code(Constant.FILE_TYPE_SPOT);
			commonFileIODto.setWrite_no(memberDto.getMem_no());
			int mem_profile_photo = commonFileIOService.insertFileInfo(commonFileIODto);
			System.out.println("mem_profile_photo : " + mem_profile_photo);
			memberDto.setMem_profile_photo(""+mem_profile_photo);
		}
		System.out.println(memberDto);
		int result = memberDao.updateProfilePhoto(memberDto);
		System.out.println("result : " + result);
		
		
		memberDto=memberDao.memberRead(memberDto.getMem_no());
		commonFileIODto=commonFileIoDao.getOneFileDto(Integer.parseInt(memberDto.getMem_profile_photo()));
		
		
		int mem_no=64;
		List<PlannerDto> plannerList = plannerDao.getPlannerList(mem_no);

		
		mav.addObject("commonFileIODto", commonFileIODto);
		mav.addObject("plannerList", plannerList);
		mav.addObject("mateCheck", 2);
		mav.addObject("memberDto", memberDto);
		mav.addObject("result", result);
		mav.setViewName("/user/myPage/myPage");
		
		
		return mav;
	}
}
