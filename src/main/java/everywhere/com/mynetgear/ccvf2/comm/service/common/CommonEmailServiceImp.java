package everywhere.com.mynetgear.ccvf2.comm.service.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 곽성국
 * @createDate 2015. 12. 17.
 * @described 공통 이메일 보내기 서비스 Class
 * @reference class
 */

@Component
public class CommonEmailServiceImp implements CommonEmailService {

	@Override
	public void sendEmail(ModelAndView mav) {
		Map <String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
	}
}
