package everywhere.com.mynetgear.ccvf2.comm.util.common;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

@Controller("authorityInterceptor")
public class AuthorityInterceptor extends HandlerInterceptorAdapter {
	
    /** Message */
    @Resource(name = "messageSource")
    protected MessageSource messageSource;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		String uri = request.getRequestURI();
		
		List<String> urlList = new ArrayList<String>();
		urlList.add("/app");
		urlList.add("/login/loginapp.au");
		urlList.add("/login/loginappencrypt.au");

		for (String urlException : urlList) {
			if (uri.indexOf(urlException) > -1) {
				return true;
			}
		}
		
		//팝업창인경우
		if (uri.indexOf("select.au") > -1
				|| uri.indexOf("popup.au") > -1) {
			return true;
		}
		
		//로그인세션이 존재하는 경우
		if (userInfo != null) {
			//이미 로그인을 한경우에 로그인 페이지로 접근시 메인화면으로 강제이동
			if (uri.indexOf("/login/login") > -1) {
				response.sendRedirect("/");
				return false;
			}
			else {
				return true;
			}
		} 
		//로그인안된 경우
		else {
			// 로그인페이지 세션체크X
			if (uri.indexOf("/login/login") > -1) {
				return true;
			}
			else {
				// 로그인화면으로 이동.
				response.sendRedirect("/login/login.au");
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