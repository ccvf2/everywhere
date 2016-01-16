package everywhere.com.mynetgear.ccvf2.admin.dao.mailtemplat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dto.mailtemplat.MailTemplateDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 10.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class MailTemplatDaoImp implements MailTemplatDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	/* 트랜젝션 처리시 */
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Override
	public List<MailTemplateDto> getListMailTemplate(MailTemplateDto dto) {
		List<MailTemplateDto> list= null;
		list=sqlTemplate.selectList("select_mailTemplate_list",dto);
		return list;
	}

	/**
	 * @author 배성욱
	 * @createDate 2016. 1. 14.
	 * @described 메일템플릿 데이터베이스 전송
	 * @reference class
	 * @param dto
	 * @return int
	 */
	@Override
	public int insertMailTemplate(MailTemplateDto dto) {
		int result=0;
		result= sqlTemplate.insert("insert_email_template", dto);
		return result;
	}
	
	
	
	
}
