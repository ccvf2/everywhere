package everywhere.com.mynetgear.ccvf2.admin.service.member;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 서비스
 * @reference class
 */
public interface AdminMemberService {

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 11.
	 * @described 관리자 회원관리 회원리스트
	 * @param mav
	 */
	void adminMemberList(ModelAndView mav);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 17.
	 * @described 관리자 회원관리 회원상태 변경 ajax 처리
	 * @param mav
	 */
	void adminMemberStatusUpdate(ModelAndView mav);

}
