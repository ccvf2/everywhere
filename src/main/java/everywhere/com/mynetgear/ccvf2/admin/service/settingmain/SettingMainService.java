package everywhere.com.mynetgear.ccvf2.admin.service.settingmain;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 배성욱
 * @createDate 2015. 12. 18.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public interface SettingMainService {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 18.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 * @return
	 */
	public void insertBackgroundImgChange(ModelAndView mav);
	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 21.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 */
	public void insertForgroundImgChange(ModelAndView mav);
	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 22.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 */
	public void getListBackground(ModelAndView mav);
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 23.
	 * @described 서비스 메인의 운영자 추천 선택 화면
	 * @param mav
	 */
	public void getChoosePlannerView(ModelAndView mav);
}
