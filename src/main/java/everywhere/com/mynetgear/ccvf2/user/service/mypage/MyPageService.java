package everywhere.com.mynetgear.ccvf2.user.service.mypage;

import org.springframework.web.servlet.ModelAndView;

public interface MyPageService {

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 23.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 * @return
	 */
	public ModelAndView moveUserPage(ModelAndView mav);

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 23.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 * @return
	 */
	public ModelAndView myPage(ModelAndView mav);

	public ModelAndView mateInsert(ModelAndView mav);

	public ModelAndView mateDelete(ModelAndView mav);

	public ModelAndView getListFriends(ModelAndView mav);

	public ModelAndView updateProfilePhoto(ModelAndView mav);
}
