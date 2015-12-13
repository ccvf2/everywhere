package everywhere.com.mynetgear.ccvf2.user.service.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.message.MessageDao;
import everywhere.com.mynetgear.ccvf2.user.dto.message.MessageDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 13.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class MessageServiceImp implements MessageService {

	@Autowired
	MessageDao messageDao;
	
	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.user.service.message.MessageService#getListParsonTalkList(org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void getListParsonTalk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MessageDto dto = (MessageDto)map.get("messageDto");
		//글을 읽는사람 *하드코딩*
		//int mem_no=73;
		//int msg_group_no=99999;
		
		//HashMap<String, Integer>map = new HashMap<String, Integer>();
		//MessageDto dto = new MessageDto();
		//dto.setRecv_mem_no(mem_no);
		//dto.setMsg_group_no(msg_group_no);
		//map.put("mem_no", mem_no);
		//map.put("msg_group_no", msg_group_no);
		
		List<MessageDto> list = messageDao.getListParsonTalk(dto);
		System.out.println(Constant.LOG_ID1+ list.size());
		mav.addObject("parsonTalkList",list);
		mav.setViewName("/user/message/messageTalkList");
	}
	
	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.user.service.message.MessageService#getListMessageBox(org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void getListMessageBox(ModelAndView mav) {
		Map<String, Object>map = mav.getModelMap();
		int mem_no =(Integer)map.get("mem_no"); 
		List<MessageDto> list = messageDao.getListMessageBox(mem_no);
		mav.addObject("messageBoxList",list);
		mav.setViewName("/user/message/messageBox");
	}

	/** 메세지 보내기 */ 
	@Override
	public int insertMessageSender(MessageDto dto) {
		int result=0;
			if (dto.getMsg_group_no()==0) {
				//그룹넘버가 없을 경우 생성.
				int newGroupNo=messageDao.getOneNewMessageGroupNumber();
				dto.setMsg_group_no(newGroupNo);
			}
		result=messageDao.insertMessageSender(dto);
		return result;
	}


}
