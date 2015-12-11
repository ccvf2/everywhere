package everywhere.com.mynetgear.ccvf2.user.controller.visitor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView visitorWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		System.out.println("VisitorController write mem_no:"+mem_no);
		mav.addObject("request", request);
		mav.addObject("mem_no", mem_no);
		visitorService.visitorWrite(mav);
		
		return mav;
	}
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 매소드의 용도를 적어주세요
	 * @param request
	 * @param response
	 * @param visitorDto 
	 * @return
	 */
	@RequestMapping(value="/user/visitor/visitorWrite.do", method=RequestMethod.POST)
	public ModelAndView visitorWriteOk(HttpServletRequest request, HttpServletResponse response, VisitorDto visitorDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("visitorDto", visitorDto);
		visitorService.visitorWriteOk(mav);
		
		return mav;
	}

}
