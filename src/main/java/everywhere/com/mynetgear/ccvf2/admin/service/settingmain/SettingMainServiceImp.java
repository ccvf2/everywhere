package everywhere.com.mynetgear.ccvf2.admin.service.settingmain;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dao.settingmain.SettingMainDao;
import everywhere.com.mynetgear.ccvf2.admin.dto.settingmain.SettingMainDto;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;

/**
 * @author 배성욱
 * @createDate 2015. 12. 18.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class SettingMainServiceImp implements SettingMainService {
	@Autowired
	SettingMainDao settingMainDao;
	@Autowired
	CommonFileIOService commonFileIOService;
	@Value("${attach.admin.mainBackground.path}")
	private String backgroundPath; 
	
	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.admin.service.settingmain.SettingMainService#insertBackgroundImgChange(org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void insertBackgroundImgChange(ModelAndView mav) {
		int result=0;
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		SettingMainDto settingDto = (SettingMainDto)map.get("settingMainDto");
		
		//파일을 꺼내서 파일을 저장소에 저장함
		CommonFileIODto commonFileIODto=commonFileIOService.requestWriteFileAndDTO(request, "mainBackground", backgroundPath);
		commonFileIODto.setType_code(Constant.SERVICE_SETTING_BACKGROUNDIMG);
		//파일정보를 디비에 작성
		int seq = commonFileIOService.insertFileInfo(commonFileIODto);
		
		
		//파일고유번호 //PLANNER_NO
		settingDto.setPlanner_no(seq);
		//사용여부
		settingDto.setUse_yn(Constant.SYNB_YN_Y);
		//세팅URl : 이미지 위치.
		String path = commonFileIODto.getSave_name()+Constant.SYNB_DOT+commonFileIODto.getExtension();
		settingDto.setSetting_url(path);
		settingMainDao.insertBackgroundImgChange(settingDto);
		mav.setViewName("/admin/settingMain/settingMain");
	}

	@Override
	public void insertForgroundImgChange(ModelAndView mav) {
		int result=0;
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		SettingMainDto settingDto = (SettingMainDto)map.get("settingMainDto");
		
		//파일을 꺼내서 파일을 저장소에 저장함
		CommonFileIODto commonFileIODto=commonFileIOService.requestWriteFileAndDTO(request, "mainBackground", backgroundPath);
		commonFileIODto.setType_code(Constant.SERVICE_SETTING_FRONTIMG);
		//파일정보를 디비에 작성
		int seq = commonFileIOService.insertFileInfo(commonFileIODto);
		
		
		//파일고유번호 //PLANNER_NO
		settingDto.setPlanner_no(seq);
		//사용여부
		settingDto.setUse_yn(Constant.SYNB_YN_Y);
		//세팅URl : 이미지 위치.
		String path = commonFileIODto.getSave_name()+Constant.SYNB_DOT+commonFileIODto.getExtension();
		settingDto.setSetting_url(path);
		settingMainDao.insertForgroundImgChange(settingDto);
		mav.setViewName("/admin/settingMain/settingMain");
		
	}

}
