package everywhere.com.mynetgear.ccvf2.user.dao.main;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 18.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public interface UserMainDao {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 18.
	 * @described 서비스 메인 페이지의 백그라운드 이미지를 DB로부터 가져오는 매소드
	 * @return
	 */
	public SettingMainDto getOneBackGroundImg();
	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 22.
	 * @described 매소드의 용도를 적어주세요
	 * @return
	 */
	public List<SettingMainDto> getOneForGroundImg();
}
