package everywhere.com.mynetgear.ccvf2.user.service.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
import everywhere.com.mynetgear.ccvf2.user.dao.main.UserMainDao;

/**
 * @author 배성욱
 * @createDate 2015. 12. 18.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class UserMainServiceImp implements UserMainService {
	@Autowired
	private UserMainDao userMainDao;
	
	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.user.service.main.UserMainService#getOneBackGroundImg()
	 */
	@Override
	public SettingMainDto getOneBackGroundImg() {
		SettingMainDto dto = userMainDao.getOneBackGroundImg();
		return dto;
	}
	

}
