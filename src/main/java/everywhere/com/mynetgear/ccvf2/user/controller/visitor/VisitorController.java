package everywhere.com.mynetgear.ccvf2.user.controller.visitor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.visitor.VisitorDto;
import everywhere.com.mynetgear.ccvf2.user.service.visitor.VisitorService;

/**
 * @author 김준호
 * @createDate 2015. 12. 10.
 * @described 방명록 컨트롤러
 * @reference class
 */
@Controller
public class VisitorController {
	@Autowired
	private VisitorService visitorService;
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 10.
	 * @described 방명록작성
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/visitor/visitorWrite.do", method=RequestMethod.GET)
	public ModelAndView visitorWrite(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="uandMe", defaultValue="S0001")String uandMe) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		// 코드값에 따라 자신의 페이지 이동 & 타회원 페이지 이동
		//String uandMe=request.getParameter("uandMe");
		
		if(StringUtils.equals(uandMe,Constant.MYPAGE_CODE_M)){
			//System.out.println("마이페이지로 이동");
			visitorService.visitorWrite(mav);
		}else{
			//System.out.println("타회원 페이지로 이동");
			visitorService.friendWrite(mav);
		}
		return mav;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록작성
	 * @param request
	 * @param response
	 * @param visitorDto 
	 * @return
	 */
	@RequestMapping(value="/user/visitor/visitorWrite.do", method=RequestMethod.POST)
	public ModelAndView visitorWriteOk(HttpServletRequest request, HttpServletResponse response, VisitorDto visitorDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("visitorDto", visitorDto);
		visitorService.visitorWriteOk(mav);
		
		return mav;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록수정
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/visitor/visitorUpdate.do", method=RequestMethod.GET)
	public ModelAndView visitorUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		visitorService.visitorUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록수정
	 * @param request
	 * @param response
	 * @param visitorDto
	 * @return
	 */
	@RequestMapping(value="/user/visitor/visitorUpdate.do", method=RequestMethod.POST)
	public ModelAndView visitorUpdateOk(HttpServletRequest request, HttpServletResponse response, VisitorDto visitorDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("visitorDto", visitorDto);
		visitorService.visitorUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록삭제
	 * @param request
	 * @param response
	 * @param visitorDto 
	 * @return
	 */
	@RequestMapping(value="/user/visitor/visitorDelete.do", method=RequestMethod.GET)
	public ModelAndView visitorDelete(HttpServletRequest request, HttpServletResponse response, VisitorDto visitorDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("visitorDto", visitorDto);
		visitorService.visitorDelete(mav);
		
		return mav;
	}

}
