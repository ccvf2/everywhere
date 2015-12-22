package everywhere.com.mynetgear.ccvf2.user.dao.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;

/**
 * @author 배성욱
 * @createDate 2015. 12. 18.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class UserMainDaoImp implements UserMainDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	@Autowired
	private PlatformTransactionManager transactionManager;

	@Override
	public SettingMainDto getOneBackGroundImg() {
		SettingMainDto dto = new SettingMainDto();
		dto.setUse_yn(Constant.SYNB_YN_Y);
		dto.setSetting_type_code(Constant.SERVICE_SETTING_BACKGROUNDIMG);
		dto.setSetting_spot_code(Constant.SERVICE_SETTING_SPOT_BACKGROUNDIMG);
		SettingMainDto result=sqlTemplate.selectOne("select_service_main_slide_back_img", dto);
		//System.out.println(result);
		//List<Object> list=sqlTemplate.selectOne("select_service_main_background_img", dto);
		return  result;
		//return null;
	}

	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.user.dao.main.UserMainDao#getOneForGroundImg()
	 */
	@Override
	public List<SettingMainDto> getOneForGroundImg() {
		SettingMainDto dto = new SettingMainDto();
		dto.setUse_yn(Constant.SYNB_YN_Y);
		dto.setSetting_type_code(Constant.SERVICE_SETTING_FRONTIMG);
		dto.setSetting_spot_code(Constant.SERVICE_SETTING_SPOT_FRONTIMG);
		List<SettingMainDto> list=sqlTemplate.selectList("select_service_main_slide_fornt_img", dto);
		return  list;
	}

}
