package everywhere.com.mynetgear.ccvf2.comm.controller.login;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.service.login.LoginService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;


/**
 * @author 배성욱
 * @createDate 2015. 12. 14.
 * @described 로그인을 처리하는 Controller
 * @reference class
 */
@Controller
public class LoginController {
	@Autowired
	LoginService loginService; 

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 14.
	 * @described 매소드의 용도를 적어주세요
	 * @param request
	 * @param response
	 * @param dto
	 * @param callback_url
	 * @return
	 */
	@RequestMapping(value = "/user/login/login.do", method = RequestMethod.POST)
	public ModelAndView HandleMemberLogin(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("memberLogin") MemberDto dto, @RequestParam(value=Constant.CALLBACK_URL,defaultValue="/user/main/main.do")String callback_url
			, @RequestParam(value=Constant.CALLBACK_PARAM,defaultValue="")String callback_param) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", dto);
		mav.addObject("callback_url", callback_url);
		mav.addObject("callback_param", callback_param);
		loginService.HandleMemberLogin(mav);
		return mav;
	}

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 15.
	 * @described 로그인페이지로 이동
	 * @param request
	 * @param response
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/user/login/login.do", method = RequestMethod.GET)
	public ModelAndView memberLoginpage(HttpServletRequest request, HttpServletResponse response) {
		String uri= (String)request.getAttribute(Constant.CALLBACK_URL);
		ModelAndView mav = new ModelAndView("/common/login/login");
		
		//1.request객체 안에 모든 파라메터를 맵으로 받는다.
		Map<?, ?>parMap=request.getParameterMap();
		
		StringBuffer parmata= new StringBuffer(); 
		if(!parMap.isEmpty()){
			String paramateName="";

			//2.받은맵에서 키를 구한다.
			Iterator<?>it =parMap.keySet().iterator();
			while (it.hasNext()) {
				paramateName=it.next().toString();
				//3.주소를 만든다.
				parmata.append(paramateName);
				parmata.append("=");
				parmata.append(request.getParameter(paramateName));
				parmata.append("&");
			}
		}
		//4.마지막'&'를 제거
		String callback_param=StringUtils.substring(parmata.toString(), 0, parmata.toString().length()-1);
		System.out.println(callback_param);
		mav.addObject(Constant.CALLBACK_URL, uri);
		mav.addObject(Constant.CALLBACK_PARAM, callback_param);
		
		return mav;
	}
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 19.
	 * @described 로그인페이지로 이동(모달)
	 * @param request
	 * @param response
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/user/login/loginModal.do", method = RequestMethod.GET)
	public ModelAndView memberLoginModal(HttpServletRequest request, HttpServletResponse response) {
		String uri= (String)request.getAttribute(Constant.CALLBACK_URL);
		ModelAndView mav = new ModelAndView("/common/login/loginModal");
		mav.addObject(Constant.CALLBACK_URL, uri);
		return mav;
	}

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 15.
	 * @described 로그아웃 기능 구현
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/user/login/loginout.do", method = RequestMethod.GET)
	public ModelAndView requestLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(Constant.LOG_ID1+"로그아웃");
		// 세션처리
		HttpSession session = request.getSession();
		session.invalidate();
		
		String url = "/user/main/main.do";
		ModelAndView mav =new ModelAndView("forward:"+url);
		mav.addObject("alert_msg","로그아웃되었습니다.");
		return mav;

	}


	
/*	public static void main(String[] args) {
		System.out.println("update tbl_law_admin set admin_password='" + SecurityUtil.Sha256Encrypt("admin","dudansqjqfud!")+"' where admin_id='admin';");
	}*/
}
