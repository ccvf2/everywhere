package everywhere.com.mynetgear.ccvf2.user.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.service.member.MemberService;

/**
 * @author 김준호
 * @createDate 2015. 12. 7.
 * @described 회원가입
 * @reference class
 */
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 7.
	 * @described 회원가입
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/member/register.do", method=RequestMethod.GET)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/user/member/register");	
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 8.
	 * @described 이메일체크
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/member/emailCheck.ajax",  method=RequestMethod.GET)
	public ModelAndView emailCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("response", response);
		memberService.emailCheck(mav);
		
		return null;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 8.
	 * @described 회원가입
	 * @param request
	 * @param response
	 * @param memberDto 
	 * @return
	 */
	@RequestMapping(value="/user/member/register.do", method=RequestMethod.POST)
	public ModelAndView registerOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		memberService.registerOk(mav);
		
		return mav;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 9.
	 * @described 회원정보보기
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/member/memberRead.do", method=RequestMethod.GET)
	public ModelAndView memberRead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		memberService.memberRead(mav);
		
		return mav;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 9.
	 * @described 회원정보수정
	 * @param request
	 * @param response
	 * @param memberDto
	 * @return
	 */
	@RequestMapping(value="/user/member/memberUpdate.do", method=RequestMethod.GET)
	public ModelAndView memberUpdate(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		System.out.println("memberController update mem_no:"+mem_no);
		
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		System.out.println("memberController update memberDto:"+memberDto.toString());
		mav.addObject("mem_no", mem_no);
		memberService.memberUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 9.
	 * @described 회원정보수정
	 * @param request
	 * @param response
	 * @param memberDto
	 * @return
	 */
	@RequestMapping(value="/user/member/memberUpdate.do", method=RequestMethod.POST)
	public ModelAndView memberUpdateOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		System.out.println("memberController updateOk memberDto:"+memberDto.toString());
		memberService.memberUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 10.
	 * @described 회원삭제
	 * @param request
	 * @param response
	 * @param memberDto
	 * @return
	 */
	@RequestMapping(value="/user/member/memberDelete.do", method=RequestMethod.GET)
	public ModelAndView memberDelete(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		System.out.println("memberController delete mem_no:"+mem_no);
		
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		System.out.println("memberController delete memberDto:"+memberDto.toString());
		mav.addObject("mem_no", mem_no);
		memberService.memberDelete(mav);
		
		return mav;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 10.
	 * @described 회원삭제
	 * @param request
	 * @param response
	 * @param memberDto
	 * @return
	 */
	@RequestMapping(value="/user/member/memberDelete.do", method=RequestMethod.POST)
	public ModelAndView memberDeleteOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		System.out.println("memberController deleteOk memberDto:"+memberDto.toString());
		memberService.memberDeleteOk(mav);
		
		return mav;
	}

}
