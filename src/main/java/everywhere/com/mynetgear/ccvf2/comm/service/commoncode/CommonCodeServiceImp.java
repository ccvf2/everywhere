package everywhere.com.mynetgear.ccvf2.comm.service.commoncode;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dao.commoncode.CommonCodeDao;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDtoExt;
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
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 공통코드 관리자 페이지로 이동합니다.
	 */
	@Override
	public void callCodeSettingPage(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		
		CommonCodeDtoExt dtoImp= new CommonCodeDtoExt();
		if(map.get("commonCodeDto")==null){
		}else{
			//검색조건이 들어있는 DTO
			dtoImp = (CommonCodeDto)map.get("commonCodeDto");
		}
		//검색된 코드목록을 뿌려줄List
		List<CommonCodeDto> list=commonCodeDao.getListCommonCodeInfo(dtoImp);
		
		//검색목록을뿌려줄List(선택목록)
		List<CommonCodeDto> searchConditionList=commonCodeDao.getListCommonCodeSearchConditionList();
		mav.addObject("searchCondition", dtoImp);
		mav.addObject("searchConditionList", searchConditionList);
		mav.addObject("codeList", list);
		mav.setViewName("/admin/code/codeSetting");
	}

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 공통코드 관리자 페이지로 에서 입력,수정 삭제 합니다.
	 */
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
			System.out.println(Constant.LOG_ID3+"수정으로 들어옴");
			result=commonCodeDao.updateCommonCodeInfo(dto);
		}else if (StringUtils.equalsIgnoreCase(Constant.SYNB_CRUD_D, code_CRUD)) {
			//코드 삭제
			System.out.println(Constant.LOG_ID3+"삭제로 들어옴");
			result=commonCodeDao.deleteCommonCodeInfo(dto);
		}else{
			System.out.println(Constant.LOG_ID3+"구현안됨");
			//에러
		}
		callCodeSettingPage(mav);
	}

//------------------------------------아래듸 매소드 들을 끌어다 쓰세여~^^-------------------------------------------------------
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 공통코드목록을 불러 옵니다.인자 값으로 "코드그룹(String code_group)"을 보내야 합니다.
	 */
	public List<CommonCodeDto> getListCodeGroup(String code_group) {
		CommonCodeDtoExt dto= new CommonCodeDtoExt();
		code_group=StringUtils.deleteWhitespace(code_group);
		dto.setSearch_code_group(code_group);
		List<CommonCodeDto> list=commonCodeDao.getListCommonCodeInfo(dto);
		return list;
	}
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 7.
	 * @described 공통코드목록을 불러 옵니다.인자 값으로 "코드그룹이름(String code_group_name)"을 보내야 합니다.
	 */
	public List<CommonCodeDto> getListCodeGroupName(String code_group_name) {
		CommonCodeDtoExt dto= new CommonCodeDtoExt();
		code_group_name=StringUtils.deleteWhitespace(code_group_name);
		dto.setSearch_code_group_name(code_group_name);
		List<CommonCodeDto> list=commonCodeDao.getListCommonCodeInfo(dto);
		return list;
	}

	/**
	 * @author 배성욱
	 * @param code_group_name 
	 * @return 
	 * @createDate 2015. 12. 9.
	 * @described 공통코드1건을 불러 옵니다.인자 값으로 "고유코드(String code)"을 보내야 합니다.
	 */
	@Override
	public CommonCodeDto getOneCodeGroup(String code) {
		code=StringUtils.deleteWhitespace(code);
		return commonCodeDao.getOneCommonCodeInfo(code);
	}

	/**
	 * @author 배성욱
	 * @param code_group_name 
	 * @return 
	 * @createDate 2015. 12. 9.
	 * @described 공통코드1건을 불러 옵니다.인자 값으로 "고유코드(int code_no)"을 보내야 합니다.
	 */
	@Override
	public CommonCodeDto getOneCodeGroup(int code_no) {
		return commonCodeDao.getOneCommonCodeInfo(code_no);
	}
}
