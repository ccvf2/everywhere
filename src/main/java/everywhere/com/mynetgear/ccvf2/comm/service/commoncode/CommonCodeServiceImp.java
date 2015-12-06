package everywhere.com.mynetgear.ccvf2.comm.service.commoncode;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dao.commoncode.CommonCodeDao;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;

/**
 * @author 배성욱
 * @createDate 2015. 12. 7.
 * @described 공통코드 서비스 구현부
 * @reference class
 */
@Component
public class CommonCodeServiceImp implements CommonCodeService {
	@Autowired
	private CommonCodeDao commonCodeDao;
	
	@Override
	public void callCodeSettingPage(ModelAndView mav) {
		List<CommonCodeDto> list=commonCodeDao.getListCommonCodeInfo();
		mav.addObject("codeList", list);
		mav.setViewName("/admin/code/codeSetting");
	}

	@Override
	public void callCodeSetting(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		CommonCodeDto dto= (CommonCodeDto)map.get("commonCodeDto");
		String code_CRUD= request.getParameter("code_CRUD");
		
		int result=0;
		if (StringUtils.equalsIgnoreCase(Constant.SYNB_CRUD_C, code_CRUD)) {
			//코드 입력
			result=commonCodeDao.insertCommonCodeInfo(dto);
			mav.addObject("errorMsg", "잘입력되었습니다.");
			mav.addObject("result", result);
		}else if (StringUtils.equalsIgnoreCase(Constant.SYNB_CRUD_U, code_CRUD)) {
			//코드 수정
			System.out.println(Constant.LOG_ID3+"구현안됨");
		}else if (StringUtils.equalsIgnoreCase(Constant.SYNB_CRUD_D, code_CRUD)) {
			//코드 삭제
			System.out.println(Constant.LOG_ID3+"구현안됨");
		}else{
			System.out.println(Constant.LOG_ID3+"구현안됨");
			//에러
		}
		callCodeSettingPage(mav);
	}


	

}
