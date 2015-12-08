package everywhere.com.mynetgear.ccvf2.user.service.member;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 김준호
 * @createDate 2015. 12. 7.
 * @described 멤버서비스
 * @reference class
 */
public interface MemberService {
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 8.
	 * @described 이메일체크
	 * @param mav
	 */
	public void emailCheck(ModelAndView mav);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 8.
	 * @described 회원가입
	 * @param mav
	 */
	public void registerOk(ModelAndView mav);

}
