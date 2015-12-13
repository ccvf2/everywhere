package everywhere.com.mynetgear.ccvf2.user.service.message;

import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dto.message.MessageDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 13.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public interface MessageService {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 13.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 */
	public void getListParsonTalk(ModelAndView mav);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 13.
	 * @described 매소드의 용도를 적어주세요
	 * @param mav
	 */
	public void getListMessageBox(ModelAndView mav);
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 13.
	 * @described 매소드의 용도를 적어주세요
	 * @param dto
	 * @return
	 */
	public int insertMessageSender(MessageDto dto);
		
}
