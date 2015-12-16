package everywhere.com.mynetgear.ccvf2.user.service.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

@Component
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MemberDao memberDao;

	@Override
	public ModelAndView moveUserPage(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		MemberDto dto = memberDao.memberRead(mem_no);
		
		mav.addObject("dto", dto);
		mav.setViewName("/user/myPage/myPage");
		
		return mav;
	}
}
