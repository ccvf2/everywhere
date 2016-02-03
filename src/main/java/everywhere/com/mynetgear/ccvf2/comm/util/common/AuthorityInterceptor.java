package everywhere.com.mynetgear.ccvf2.comm.util.common;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 13.
 * @described 로그인세션체크를 위한 인터셉터
 * @reference class
 */
@Controller("authorityInterceptor")
public class AuthorityInterceptor extends HandlerInterceptorAdapter {
	
/*    *//** Message *//*
    @Resource(name = "messageSource")
    protected MessageSource messageSource;*/

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println(Constant.LOG_ID1+"인터셉터");
			
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		String uri = request.getRequestURI();
		
		List<String> urlList = new ArrayList<String>();
		urlList.add("/user/main/main.do");
		urlList.add("/user/login/login.do");
		urlList.add("/user/login/loginout.do");
		urlList.add("/common/code/codelist.ajax");
		urlList.add("/user/member/register.do");
		urlList.add("/WEB-INF/views/user/main/");
		urlList.add("/WEB-INF/views/user/");
		urlList.add("/user/member/emailCheck.ajax");
		urlList.add("/user/main/assets/");
		urlList.add("/user/spot/spotRead.do");
		urlList.add("/user/planner/readPlanner.do");
		urlList.add("/user/planner/plannerList.do");
		urlList.add("/user/planner/updatePlanner.do"); //희진) 추후 삭제 예정
		urlList.add("/user/accompany/accompanyList.do");
		urlList.add("/user/accompany/accompanyRead.do");
		urlList.add("/user/search/searchSpot.do");
		urlList.add("/user/search/searchPlanner.do");
		urlList.add("/user/search/searchTotal.do");
		urlList.add("/password/passwordChanghe.do");
		urlList.add("/xmlparse/parse.do"); //성욱) 추후 삭제 예정
		urlList.add("/admin/mailtemplate/mailTemplateActiveCheck.ajax");
		urlList.add("/common/reply/replylist.ajax");
		urlList.add("/user/spot/selectCountry.ajax");

		for (String urlException : urlList) {
			if (uri.indexOf(urlException) > -1) {
				return true;
			}
		}
		
		//팝업창인경우
/*		if (uri.indexOf("select.au") > -1
				|| uri.indexOf("popup.au") > -1) {
			return true;
		}*/
		
		//로그인세션이 존재하는 경우
		if (userInfo != null) {
			//이미 로그인을 한경우에 로그인 페이지로 접근시 메인화면으로 강제이동
			if (uri.indexOf("/user/login/login") > -1) {
				response.sendRedirect("/user/main/main.do");
				return false;
			}
			else {
				return true;
			}
		} 
		//로그인안된 경우
		else {
			// 로그인페이지 세션체크X
			if (uri.indexOf("/user/login/login") > -1) {
				return true;
			}
			else {
				request.setAttribute(Constant.CALLBACK_URL, uri);
				request.setAttribute("alert_msg", "로그인이 필요한 페이지 입니다.");
				// 로그인화면으로 이동.
				RequestDispatcher disp =request.getRequestDispatcher("/user/login/login.do");
				disp.forward(request, response);
				//response.sendRedirect("/user/login/login.do");
				return false;
			}
		}
	}
	
	/**
	 * Client IP 반환.
	 * 
	 * @param request
	 * @return
	 */
	public String getClientIp(HttpServletRequest request) {
		String clientIp = request.getHeader("Proxy-Client-IP");
		if (clientIp == null) {
			clientIp = request.getHeader("WL-Proxy-Client-IP");
			if (clientIp == null) {
				clientIp = request.getHeader("X-Forwarded-For");
				if (clientIp == null) {
					clientIp = request.getRemoteAddr();
				}
			}
		}
		return clientIp;
	}
}
