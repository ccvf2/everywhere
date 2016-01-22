package everywhere.com.mynetgear.ccvf2.user.service.main;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
import everywhere.com.mynetgear.ccvf2.user.dto.search.SpotDtoExt;

/**
 * @author 배성욱
 * @createDate 2015. 12. 18.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public interface UserMainService {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 18.
	 * @described 메인페이지 배경이미지 가져오는매소드
	 * @return
	 */
	public SettingMainDto getOneBackGroundImg();
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 21.
	 * @described 매소드의 용도를 적어주세요
	 * @return
	 */
	public List<PlannerDto> getListPlanner();
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 22.
	 * @described 매소드의 용도를 적어주세요
	 * @return
	 */
	public List<SettingMainDto> getOneForGroundImg();
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 23.
	 * @described 명소 6개만 가져오기 메인용
	 * @return
	 */
	public List<SpotDtoExt> getListSpotUserMain();
}
