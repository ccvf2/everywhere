package everywhere.com.mynetgear.ccvf2.user.dao.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import everywhere.com.mynetgear.ccvf2.user.dto.message.MessageDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 13.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public interface MessageDao {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 13.
	 * @described 매소드의 용도를 적어주세요
	 * @param msg_group_no
	 * @return
	 */
	public List<MessageDto> getListParsonTalk(MessageDto dto);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 13.
	 * @described 매소드의 용도를 적어주세요
	 * @param mem_no
	 * @return
	 */
	public List<MessageDto> getListMessageBox(int mem_no);
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 13.
	 * @described 매소드의 용도를 적어주세요
	 * @param dto
	 * @return
	 */
	public int insertMessageSender(MessageDto dto);
	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 13.
	 * @described 매소드의 용도를 적어주세요
	 * @return
	 */
	public int getOneNewMessageGroupNumber();
	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 14.
	 * @described 메세지함 삭제 시
	 * @param dto
	 * @return
	 */
	public int deleteMessageBox(MessageDto dto);
}
