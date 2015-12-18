package everywhere.com.mynetgear.ccvf2.comm.service.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonFileIODao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.MailVO;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import testpa.MailSend;

/**
 * @author 곽성국
 * @createDate 2015. 12. 17.
 * @described 공통 이메일 보내기 서비스 Class
 * @reference class
 */

@Component
public class CommonEmailServiceImp implements CommonEmailService {
	@Autowired
	private CommonFileIODao commonFileIODao;
	
	@Autowired
	private CommonFileIOService commonFileIOService;
	
	@Value("${attach.email.path}")
	private String emailPath;
	
	@Override
	public void sendEmailOk(ModelAndView mav) {
		Map <String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MailVO mailVo = (MailVO) map.get("mailVo");
		
		System.out.println(mailVo.getMail_receiver_email());
		System.out.println(mailVo.getMail_receiver_name());
		System.out.println(mailVo.getMail_title());
		System.out.println(mailVo.getMail_content());
		
		MailSend mailSend = new MailSend();
		int checkMail = mailSend.mailSender(mailVo);
		if(checkMail > 0) {
			System.out.println("메일이 보내짐");
		}
		// file 항목의 이름 email_file
		/*CommonFileIODto commonFileIODto = commonFileIOService.requestWriteFileAndDTO(request, "email_file", emailPath);
		if(commonFileIODto != null) {
			commonFileIODto.setType_code(Constant.FILE_TYPE_EMAIL);
			//commonFileIODto.setWrite_no(write_no);
			//commonFileIODto
			
			//파일 정보를 db에 삽입하고 제대로 DB에 삽입 되면 1반환
			int check = commonFileIOService.insertFileInfo(commonFileIODto);
			EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);
			
			//mailVo.getMail_attach_name()
		}*/
		
		mav.addObject("checkMail", checkMail);
	}
}
