package everywhere.com.mynetgear.ccvf2.admin.dao.settingmain;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 18.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class SettingMainDaoImp implements SettingMainDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	/* 트랜젝션 처리시 */
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	/** 메인페이지의 뒷부분 슬라이드 이미지 */
	@Override
	public int insertBackgroundImgChange(SettingMainDto settingDto) {
		int result=sqlTemplate.insert("insert_Background_Img_Change", settingDto);
		return result;
	}
	/** 메인페이지의 앞부분 슬라이드 이미지 */
	@Override
	public int insertForgroundImgChange(SettingMainDto settingDto) {
		int result=sqlTemplate.insert("insert_Forground_Img_Change", settingDto);
		return result;
	}

}
