package everywhere.com.mynetgear.ccvf2.admin.dao.settingmain;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDtoExt;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

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
	
	/** 백그라운드 설정 목록을 불러 온다. */
	@Override
	public List<SettingMainDto> getListBackground() {
		return sqlTemplate.selectList("select_list_Background_setting");
	}
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 23.
	 * @described 운영자 선택을 위한 플레너 목록&검색값
	 * @reference class
	 * @param settingMainDtoExt
	 * @return
	 */
	@Override
	public List<SettingMainDto> getListChoosePlanner(SettingMainDtoExt settingMainDtoExt) {
		List<Object> list=sqlTemplate.selectList("select_list_planner_setting_main", settingMainDtoExt);
		
		return null;
	}

}
