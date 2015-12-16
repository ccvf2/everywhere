package everywhere.com.mynetgear.ccvf2.user.dao.message;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import everywhere.com.mynetgear.ccvf2.user.dto.message.MessageDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 13.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class MessageDaoImp implements MessageDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	@Autowired
	private PlatformTransactionManager transactionManager;

	@Override
	public List<MessageDto> getListParsonTalk(MessageDto dto) {
		// 트랜잭션에 구동하는데 필요한 객체
		//TransactionDefinition definition = new DefaultTransactionDefinition();
		//TransactionStatus status=transactionManager.getTransaction(definition);
		
		List<MessageDto> list = null;
		//try {
			//읽음으로 표시를 위한 쿼리 업데이트
			sqlTemplate.update("update_parson_Talk",dto);
			//목록 불러오기
			list = sqlTemplate.selectList("select_list_parson_Talk",dto.getMsg_group_no());
			//transactionManager.commit(status);
		//} catch (Exception e) {
		//	sqlTemplate.rollback();
		//}
		return list;
	}

	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.user.dao.message.MessageDao#getListMessageBox(int)
	 */
	@Override
	public List<MessageDto> getListMessageBox(int mem_no) {
		List<MessageDto> list = sqlTemplate.selectList("select_list_messageBox",mem_no);
		return list;
	}

	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.user.dao.message.MessageDao#insertMessageSender(everywhere.com.mynetgear.ccvf2.user.dto.message.MessageDto)
	 */
	@Override
	public int insertMessageSender(MessageDto dto) {
		return sqlTemplate.insert("insert_message_send",dto);
	}

	/** 새로운 그룹넘버를 생성 */
	@Override
	public int getOneNewMessageGroupNumber() {
		return sqlTemplate.selectOne("get_message_group_number");
	}

	/** 메세지함을 삭제시 */
	@Override
	public int deleteMessageBox(MessageDto dto) {
		//1.삭제할대상목록을 가져온다.
		List<MessageDto> list= sqlTemplate.selectList("select_Check_message_list", dto);
		//2.대상목록을 돌면서 상태를 다시 가져온다.
		int listSize=list.size();
		for (int i = 0; i < listSize ; i++) {
			MessageDto tempDto =list.get(i);
			//3.대상을 확인한다.
			if(tempDto.getRemove_men_no()==0){
				// 3-1.대상이 비어 있으면 자기 시퀀스를 넣는다.
				sqlTemplate.update("delete_messageBox",tempDto);				
			}else if(tempDto.getRemove_men_no()==dto.getSend_mem_no()){
				// 3-2.대상에 상대방 시퀀스가 있으면 삭제한다.
				sqlTemplate.delete("real_delete_messageBox",tempDto);				
			}else{
				// 3-3.대상에 자기자신이 들어 있으면 아무작업도 하지 않는다.
			}
		}
		return 0;
	}

	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.user.dao.message.MessageDao#getOneCheckGroupNumber(everywhere.com.mynetgear.ccvf2.user.dto.message.MessageDto)
	 */
	@Override
	public int getOneCheckGroupNumber(MessageDto dto) {
		int result =0;
		result=sqlTemplate.selectOne("select_check_group_number",dto); 
		return 0;
	}
}
