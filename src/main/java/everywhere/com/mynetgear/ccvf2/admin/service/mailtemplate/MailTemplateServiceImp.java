package everywhere.com.mynetgear.ccvf2.admin.service.mailtemplate;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dao.mailtemplat.MailTemplatDao;
import everywhere.com.mynetgear.ccvf2.admin.dto.mailtemplat.MailTemplateDto;

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

}
