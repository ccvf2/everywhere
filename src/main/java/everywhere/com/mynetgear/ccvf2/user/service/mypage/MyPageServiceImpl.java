package everywhere.com.mynetgear.ccvf2.user.service.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.comm.util.common.StringUtil;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
import everywhere.com.mynetgear.ccvf2.user.service.planner.PlannerService;

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
	private PlannerService plannerService;
	
	@Autowired
	private CommonFileIOService commonFileIOService;
	
	@Value("${attach.member.path}")
	private String memberPath;

	@Override
	public ModelAndView myPage(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		MemberDto memberDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int mem_no=memberDto.getMem_no();
		int boardSize=9;
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		System.out.println("mem_no : " + mem_no);
		int count=memberDao.getPlannerCount(mem_no);
		
		System.out.println("----------------getPlannerCount : " + count);
		String MYPAGE_CODE=Constant.MYPAGE_CODE_M;
		String search=Constant.SEARCH_N_MYPAGE_CODE;
		List<PlannerDto> plannerList=null;
		if(count>0) {
			plannerList=memberDao.getPlannerList(memberDto.getMem_no(), startRow, endRow, MYPAGE_CODE, search);
			System.out.println("---------------plannerList.size() : " + plannerList.size());
			
			for(int i=0; i<plannerList.size(); i++){
				PlannerDto dto= plannerList.get(i);
				StringUtils.clean(dto.getMemo());
				dto.setMemo(StringUtils.replace(dto.getMemo(), "<br/>", "\r\n"));
				System.out.println("dto.toString() : " + dto.toString()); 
				plannerList.set(i, dto);
			}
		}		
				
		memberDto=memberDao.memberRead(mem_no);
		
		mav.addObject("plannerList", plannerList);
		mav.addObject("mateCheck", 2);
		mav.addObject("memberDto", memberDto);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
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
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=9;
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		System.out.println("mate_no : " + mem_no);
		int count=memberDao.getPlannerCount(mate_no);
		
		System.out.println("----------------getPlannerCount : " + count);
		
		String MYPAGE_CODE=Constant.MYPAGE_CODE_U;
		String search=Constant.SEARCH_N_MYPAGE_CODE;
		List<PlannerDto> plannerList=null;
		if(count>0) {
			plannerList=memberDao.getPlannerList(mate_no, startRow, endRow, MYPAGE_CODE, search);
			
			for(int i=0; i<plannerList.size(); i++){
				PlannerDto dto= plannerList.get(i);
				StringUtils.clean(dto.getMemo());
				dto.setMemo(StringUtils.replace(dto.getMemo(), "<br/>", "\r\n"));
				System.out.println("dto.toString() : " + dto.toString()); 
				plannerList.set(i, dto);
			}
		}		
		
		memberDto=memberDao.memberRead(mate_no);
		
		System.out.println("----------memberDto 확인 : " + memberDto.toString());
		
		mav.addObject("plannerList", plannerList);
		mav.addObject("mateCheck", mateCheck);
		mav.addObject("memberDto", memberDto);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
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
		System.out.println("---------------mem_no : " + mem_no);
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=6;
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		System.out.println("------------startRow : " + startRow + " endRow : " + endRow + " currentPage : " + currentPage);
		int count=memberDao.getFriendsCount(mem_no);
		List<MemberDto> friendsList=null;
		if(count>0) {
			friendsList=memberDao.getListFriends(mem_no, startRow, endRow);
		}
		
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
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
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
			commonFileIODto.setType_code(Constant.FILE_TYPE_PROFILE);
			commonFileIODto.setWrite_no(memberDto.getMem_no());
			int mem_profile_photo = commonFileIOService.insertFileInfo(commonFileIODto);
			System.out.println("mem_profile_photo : " + mem_profile_photo);
			memberDto.setMem_profile_photo(""+mem_profile_photo);
		}
		System.out.println(memberDto);
		int result = memberDao.updateProfilePhoto(memberDto);
		System.out.println("result : " + result);
		
		memberDto=memberDao.memberRead(memberDto.getMem_no());
		
		List<PlannerDto> plannerList = plannerService.getPlannerListByMember(request);
		
		mav.addObject("plannerList", plannerList);
		mav.addObject("mateCheck", 2);
		mav.addObject("memberDto", memberDto);
		mav.addObject("result", result);
		mav.setViewName("/user/myPage/myPage");
		
		return mav;
	}

	@Override
	public ModelAndView searchFriends(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String search=request.getParameter("search").trim();
		search=search.toLowerCase();
		System.out.println("------------search : " + search);
		
		List<MemberDto> friendsList=memberDao.searchFriends(search);
		
		for(int i=0; i<friendsList.size(); i++){
			System.out.println("-----friendsList : " + friendsList.get(i).toString());
		}
		
		HttpSession session = request.getSession();
		MemberDto memberDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		memberDto=memberDao.memberRead(memberDto.getMem_no());
		mav.addObject("memberDto", memberDto);
		mav.addObject("friendsList", friendsList);
		mav.setViewName("/user/myPage/myPageFriends");
		
		return mav;
	}

	@Override
	public ModelAndView getBookMarkList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		String list_code=request.getParameter("list_code");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=9;
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		int count=memberDao.getBookMarkCount(mem_no);
		
		List<PlannerDto> plannerList=null;
		if(count>0) {
			plannerList=memberDao.getBookMarkList(mem_no, startRow, endRow, list_code);
		}
	
		mav.addObject("list_code", list_code);
		mav.addObject("plannerList", plannerList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/user/myPage/myPageBookMark");
		
		return mav;
	}

	@Override
	public ModelAndView myPageDeleteBookMark(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int item_no=Integer.parseInt(request.getParameter("item_no"));
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		
		System.out.println("item_no : " + item_no + " mem_no : " + mem_no);
		
		memberDao.myPageDeleteBookMark(item_no, mem_no);
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=10;
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		int count=memberDao.getBookMarkCount(mem_no);
		
		List<PlannerDto> plannerList=null;
		if(count>0) {
			//plannerList=memberDao.getBookMarkList(mem_no, startRow, endRow);
		}
	
		mav.addObject("plannerList", plannerList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/user/myPage/myPageBookMark");
		
		return mav;
	}
}
