package everywhere.com.mynetgear.ccvf2.admin.service.mailtemplate;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dao.mailtemplat.MailTemplatDao;
import everywhere.com.mynetgear.ccvf2.admin.dto.mailtemplat.MailTemplateDto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;

/**
 * @author 배성욱
 * @createDate 2015. 12. 10.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class MailTemplateServiceImp implements MailTemplateService{

	@Autowired
	MailTemplatDao mailTemplatedao;
	@Autowired
	CommonCodeService commonCodeService;
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 12. 28.
	 * @described 메일템플릿 목록을 불러옴
	 * @reference class
	 * @param mav
	 */
	@Override
	public void mailTemplateList(ModelAndView mav) {
		MailTemplateDto dto = new MailTemplateDto();
		List<MailTemplateDto> list = mailTemplatedao.getListMailTemplate(dto);
		mav.addObject("mailTemplatList",list);
		mav.setViewName("/admin/mailTemplate/mailTemplateList");
	}
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 20.
	 * @described 클래스전체의 하는(큰)일을 적어주세요.
	 * @reference class
	 * @param mav
	 */
	@Override
	public void mailTemplateInsertView(ModelAndView mav) {
		//메일템플릿사용여부 공통코드 목록
		List<CommonCodeDto>selectCode0=commonCodeService.getListCodeGroup(Constant.MAIL_TEMPLATE_ACTIVE_GROUP_CODE);
		mav.addObject("templateActive", selectCode0);
		//메일템플릿종류 공통코드 목록
		List<CommonCodeDto>selectCode1=commonCodeService.getListCodeGroup(Constant.MAIL_TEMPLATE_GROUP_CODE);
		mav.addObject("templateGroupCodeList", selectCode1);
		
		mav.setViewName("/admin/mailTemplate/mailTemplateInsert");
	}
	
	
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 10.
	 * @described 메일템플릿을 등록
	 * @reference class
	 * @param mav
	 */
	@Override
	public void mailTemplateInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		MailTemplateDto dto = (MailTemplateDto)map.get("matilTemplateDto");
		int result= mailTemplatedao.insertMailTemplate(dto);
	}
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 20.
	 * @described 메일템플릿 작성 전 활성화된 폼이 있는지 확인.
	 * @reference class
	 * @param mav
	 */
	@Override
	public void mailTemplateActiveCheck(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		HttpServletResponse response= (HttpServletResponse)map.get("response");
		
		//DAO로 요청할 객체 생성
		MailTemplateDto dto = new MailTemplateDto();
		//AJAX요청으로 들어온 값을 객체에 삽입
		dto.setMtemp_active(request.getParameter("activeCode"));
		dto.setMtemp_group_code(request.getParameter("groupCode"));
		int result=mailTemplatedao.mailTemplateActiveCheck(dto);
		
		try {
			response.setContentType("application/html;charset=utf8");
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
