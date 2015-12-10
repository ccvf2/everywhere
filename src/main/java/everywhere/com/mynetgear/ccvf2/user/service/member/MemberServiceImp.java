package everywhere.com.mynetgear.ccvf2.user.service.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

/**
 * @author 김준호
 * @createDate 2015. 12. 7.
 * @described 멤버서비스 구현부
 * @reference class
 */
@Component
public class MemberServiceImp implements MemberService {
	@Autowired
	private MemberDao memberDao;

	@Override
	public void emailCheck(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		
		String email=request.getParameter("email");
		// EverywhereAspect.logger.info(EverywhereAspect.logger+","+email);
		
		String mem_email=memberDao.emailCheck(email);
		System.out.println("memberService emailCheck mem_email:"+mem_email);
		// EverywhereAspect.logger.info(EverywhereAspect.logger+","+mem_email);
		
		int check=0;
		if(mem_email.equals(email)&& mem_email!=null) {
			check=1;
		}else{
			check=0;
		}
		System.out.println("memberService emailCheck check:"+check);
		
		try {
			response.setContentType("application/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void registerOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		memberDto.setMem_level_code(Constant.MEMBER_LEVEL_USER);
		memberDto.setMem_p_status_code(Constant.MEMBER_P_STATUS_ACTIVE);
		memberDto.setMem_profile_photo("null");
		memberDto.setMem_status_code(Constant.MEMBER_STATUS_LOCK);
		System.out.println("memberService registerOk memberDto:"+memberDto.toString());
		
		int check=memberDao.registerOk(memberDto);
		System.out.println("memberService registerOk check:"+check);
		
		mav.addObject("check", check);
		mav.setViewName("/user/member/registerOk");	
	}

	@Override
	public void memberRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		System.out.println("memberService read mem_no:"+mem_no);
		
		MemberDto memberDto=memberDao.memberRead(mem_no);
		System.out.println("memberService read memberDto:"+memberDto.toString());
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("/user/member/memberRead");
	}

	@Override
	public void memberUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		System.out.println("memberService update mem_no:"+mem_no);
		memberDto.setMem_no(mem_no);
		
		memberDto=memberDao.memberRead(mem_no);
		System.out.println("memberService update memberDto:"+memberDto.toString());
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("user/member/memberUpdate");
	}

	@Override
	public void memberUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		System.out.println("memberService updateOk memberDto:"+memberDto.toString());
		
		int check=memberDao.memberUpdate(memberDto);
		System.out.println("memberService updateOk check:"+check);
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		memberDto=memberDao.memberRead(mem_no);
		
		mav.addObject("check", check);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("user/member/memberUpdateOk");
	}

	@Override
	public void memberDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		System.out.println("memberService delete mem_no:"+mem_no);
		memberDto.setMem_no(mem_no);
		
		memberDto=memberDao.memberRead(mem_no);
		System.out.println("memberServiceImp delete memberDto:"+memberDto.toString());
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("user/member/memberDelete");
	}

	@Override
	public void memberDeleteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		memberDto.setMem_no(mem_no);
		memberDto.setMem_status_code(Constant.MEMBER_STATUS_WITHDRAW);
		
		int check=memberDao.memberDelete(memberDto);
		System.out.println("memberService deleteOk check:"+check);
		
		mav.addObject("check", check);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("user/member/memberDeleteOk");
	}

}
