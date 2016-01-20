package everywhere.com.mynetgear.ccvf2.admin.dao.mailtemplat;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dto.mailtemplat.MailTemplateDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 10.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public interface MailTemplatDao {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 11.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 * @return
	 */
	public List<MailTemplateDto> getListMailTemplate(MailTemplateDto dto);
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 14.
	 * @described 메일템플릿등록을 실행
	 * @param dto
	 * @return
	 */
	public int insertMailTemplate(MailTemplateDto dto);
	
	
	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 20.
	 * @described 메일템플릿을 등록하기 전에 활성화가된 양식이 있는지확인
	 * @param dto
	 * @return
	 */
	public int mailTemplateActiveCheck(MailTemplateDto dto);
}
