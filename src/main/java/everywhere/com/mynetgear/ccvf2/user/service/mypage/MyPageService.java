package everywhere.com.mynetgear.ccvf2.user.service.mypage;

import org.springframework.web.servlet.ModelAndView;

public interface MyPageService {

	public ModelAndView moveUserPage(ModelAndView mav);

	public ModelAndView myPage(ModelAndView mav);

	public ModelAndView mateInsert(ModelAndView mav);

	public ModelAndView mateDelete(ModelAndView mav);

	public ModelAndView getListFriends(ModelAndView mav);
}
