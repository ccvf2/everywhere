package everywhere.com.mynetgear.ccvf2.user.service.visitor;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 김준호
 * @createDate 2015. 12. 10.
 * @described 방명록서비스
 * @reference class
 */
public interface VisitorService {
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 10.
	 * @described 방명록작성
	 * @param mav
	 */
	public void visitorWrite(ModelAndView mav);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록작성
	 * @param mav
	 */
	public void visitorWriteOk(ModelAndView mav);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록수정
	 * @param mav
	 */
	public void visitorUpdate(ModelAndView mav);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록수정
	 * @param mav
	 */
	public void visitorUpdateOk(ModelAndView mav);

}
