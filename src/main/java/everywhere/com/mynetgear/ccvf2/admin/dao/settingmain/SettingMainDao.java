package everywhere.com.mynetgear.ccvf2.admin.dao.settingmain;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDtoExt;

/**
 * @author 배성욱
 * @createDate 2015. 12. 18.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public interface SettingMainDao {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12.19
	 * @described 매소드의 용도를 적어주세요
	 * @param settingDto
	 * @return
	 */
	public int insertBackgroundImgChange(SettingMainDto settingDto);
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 21.
	 * @described 매소드의 용도를 적어주세요
	 * @param settingDto
	 * @return
	 */
	public int insertForgroundImgChange(SettingMainDto settingDto);
	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 22.
	 * @described 백그라운드 목록을 불러오기
	 * @return
	 */
	public List<SettingMainDto> getListBackground();

	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 23.
	 * @described 운영자 선택을 위한 플레너 목록&검색값
	 * @param settingMainDtoExt
	 * @return
	 */
	public List<SettingMainDto> getListChoosePlanner(SettingMainDtoExt settingMainDtoExt);
	
	
}
