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
	public List<MailTemplateDto> getListMailtTemplat(MailTemplateDto dto);
}
