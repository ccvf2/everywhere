package everywhere.com.mynetgear.ccvf2.user.service.main;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.comm.util.common.StringUtil;
import everywhere.com.mynetgear.ccvf2.user.dao.main.UserMainDao;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dao.spot.SpotDao;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
import everywhere.com.mynetgear.ccvf2.user.dto.search.SpotDtoExt;

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
	@Autowired
	private PlannerDao plannerDao;
	@Autowired
	private SpotDao spotDao;
	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.user.service.main.UserMainService#getOneBackGroundImg()
	 */
	@Override
	public SettingMainDto getOneBackGroundImg() {
		SettingMainDto dto = userMainDao.getOneBackGroundImg();
		
		if(dto==null){
			dto= new SettingMainDto();
			//만약 저장된 이미지가 없으면 기본이미지를 출력한다.
			dto.setSetting_url("/assets/plugins/parallax-slider/img/bg.jpg");
		}else{
			if(StringUtils.equals(dto.getSetting_url(), Constant.SYNB_NULL)){
				dto.setSetting_url("/assets/plugins/parallax-slider/img/bg.jpg");
			}else{
				String path="/attatchFile/admin/mainBackground/"+dto.getSetting_url();
				dto.setSetting_url(path);
			}
		}
		return dto;
	}
	@Override
	public List<SettingMainDto> getOneForGroundImg() {
		List<SettingMainDto> list = userMainDao.getOneForGroundImg();
		
		return list;
	}

	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.user.service.main.UserMainService#getListPlanner()
	 */
	@Override
	public List<PlannerDto> getListPlanner() {
		List<PlannerDto> list=plannerDao.getListPlanner_main();
		return list;
	}
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 23.
	 * @described 메인에 뿌릴 명소 6개 가져오기.
	 * @reference class
	 * @return
	 */
	@Override
	public List<SpotDtoExt> getListSpotUserMain() {
		List<SpotDtoExt> list=spotDao.getListSpotUserMain();
		return list;
	}
	
	
	

}
