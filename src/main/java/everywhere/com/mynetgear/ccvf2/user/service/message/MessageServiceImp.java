package everywhere.com.mynetgear.ccvf2.user.service.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.message.MessageDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
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
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		//보내는 사람정보가 없을경우 세션에서 담아준다.
		if(dto.getSend_mem_no()==0){
			MemberDto memberDto = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
			dto.setSend_mem_no(memberDto.getMem_no());
		}
		
		
		//방번호가 있는지 없는지 체크한다.
		if(dto.getMsg_group_no()==0){
			//보낼사람 정보가 있는지 확인
			if(dto.getRecv_mem_no()==0){
				//그사람과 대화한 방이 있는지 확인
				int checkNumber=messageDao.getOneCheckGroupNumber(dto);
				if(checkNumber==0){
					//그 방번호가 없으면 생성
					int newGroupNumber=messageDao.getOneNewMessageGroupNumber();
					dto.setMsg_group_no(newGroupNumber);
				}else{
					//있으면 그 방번호를 삽입
					dto.setMsg_group_no(checkNumber);
				}
			}else{
				//방번호 생성(첫대화)
				int newGroupNumber=messageDao.getOneNewMessageGroupNumber();
				dto.setMsg_group_no(newGroupNumber);
			}
		}else{
			List<MessageDto> list = messageDao.getListParsonTalk(dto);
			mav.addObject("parsonTalkList",list);
			System.out.println(Constant.LOG_ID1+ list.size());
		}
		
		
		
		mav.addObject("msg_group_no",dto.getMsg_group_no());
		mav.setViewName("/user/message/messageTalkList2");
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

	
	/**메세지함 삭제 시 */
	@Override
	public void deleteMessageBox(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MessageDto dto = (MessageDto)map.get("messageDto");
		int result = messageDao.deleteMessageBox(dto);
	}


}
