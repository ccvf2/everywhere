package everywhere.com.mynetgear.ccvf2.user.service.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

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
	public ModelAndView myPage(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		MemberDto memberDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);
		System.out.println("========================\n"+memberDto.toString());
		
		mav.addObject("mateCheck", 2);
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
		
		System.out.println("친구 추가 완료 :(mateCheck) : " + mateCheck);
		
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
		
		//int uandMe=Integer.parseInt(request.getParameter("uandMe"));
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		System.out.println("----------------mem_no : " + mem_no);
		MemberDto memberDto = memberDao.memberRead(mem_no);
		System.out.println("---------------memberDto : " + memberDto.toString());
		
		List<MemberDto> friendsList=memberDao.getListFriends(mem_no);
		
		System.out.println("친구 몇명? :" +friendsList.size());
		
		
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
}
