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

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 24.
	 * @described 친구추가
	 * @param mav
	 * @return
	 */
	public ModelAndView mateInsert(ModelAndView mav);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 24.
	 * @described 친구삭제
	 * @param mav
	 * @return
	 */
	public ModelAndView mateDelete(ModelAndView mav);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 24.
	 * @described 친구리스트
	 * @param mav
	 * @return
	 */
	public ModelAndView getListFriends(ModelAndView mav);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 25.
	 * @described 회원 프로필사진
	 * @param mav
	 * @return
	 */
	public ModelAndView updateProfilePhoto(ModelAndView mav);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 27.
	 * @described 친구 검색
	 * @param mav
	 * @return
	 */
	public ModelAndView searchFriends(ModelAndView mav);
	
	
	/**
	 * @author 김성광
	 * @createDate 2016. 1. 22.
	 * @described 즐겨찾기페이지
	 * @param mav
	 * @return
	 */
	public ModelAndView getBookMarkList(ModelAndView mav);

	/**
	 * @author 김성광
	 * @createDate 2016. 1. 22.
	 * @described 마이페이지 북마크 해제
	 * @param mav
	 * @return 
	 */
	public ModelAndView myPageDeleteBookMark(ModelAndView mav);
}
