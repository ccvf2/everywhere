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
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 9.
	 * @described 회원정보보기
	 * @param mav
	 */
	public void memberRead(ModelAndView mav);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 9.
	 * @described 회원정보수정
	 * @param mav
	 */
	public void memberUpdate(ModelAndView mav);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 9.
	 * @described 회원정보수정
	 * @param mav
	 */
	public void memberUpdateOk(ModelAndView mav);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 10.
	 * @described 회원삭제
	 * @param mav
	 */
	public void memberDelete(ModelAndView mav);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 10.
	 * @described 회원삭제
	 * @param mav
	 */
	public void memberDeleteOk(ModelAndView mav);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 20.
	 * @described 비밀번호 일괄 변환
	 */
	public void passwordUtil();
}
