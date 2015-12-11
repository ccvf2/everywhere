package everywhere.com.mynetgear.ccvf2.admin.service.mailtemplat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dao.mailtemplat.MailTemplatDao;
import everywhere.com.mynetgear.ccvf2.admin.dto.mailtemplat.MailTemplatDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 10.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class MailTemplatServiceImp implements MailTemplatService{

	@Autowired
	MailTemplatDao mailTemplatdao;
	@Override
	public void mailTemplatList(ModelAndView mav) {
		MailTemplatDto dto = new MailTemplatDto();
		List<MailTemplatDto> list = mailTemplatdao.getListMailtTemplat(dto);
		mav.addObject("mailTemplatList",list);
		mav.setViewName("/admin/mailTemplat/mailTemplatList");
		//mav.setViewName("/admin/main/adminMainPage");
	}

}
