package everywhere.com.mynetgear.ccvf2.comm.service.commoncode;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 7.
 * @described 공통코드 서비스 인터페이스(관리자 코드 수정 페이지로 이동합니다.)
 * @reference Interface
 */
public interface CommonCodeService {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 코드셋팅페이지 요청(관리자 코드 수정 페이지로 이동합니다.)
	 * @param mav 
	 */
	public void callCodeSettingPage(ModelAndView mav);
	
	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 코드셋팅요청(관리자 코드 수정 페이지로 이동합니다.)
	 * @param request 
	 * @param response 
	 */
	public void callCodeSetting(ModelAndView mav);

	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 9.
	 * @described 공통코드 불러 옵니다.인자 값으로 "코드그룹"을 보내야 합니다.
	 */
	public List<CommonCodeDto> getListCodeListGroup(String code_group);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 9.
	 * @described 공통코드 불러 옵니다.인자 값으로 "코드그룹"을 보내야 합니다.
	 */
	public List<CommonCodeDto> getListCodeListGroupName(String code_group_name);
}
