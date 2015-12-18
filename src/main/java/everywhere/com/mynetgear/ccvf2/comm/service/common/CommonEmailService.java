package everywhere.com.mynetgear.ccvf2.comm.service.common;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 곽성국
 * @createDate 2015. 12. 17.
 * @described 공통 이메일 보내기 서비스 Inteface
 * @reference class
 */
public interface CommonEmailService {
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 17.
	 * @described 이메일 보내는 메소드
	 * @param mav
	 */
	void sendEmailOk(ModelAndView mav);
}
