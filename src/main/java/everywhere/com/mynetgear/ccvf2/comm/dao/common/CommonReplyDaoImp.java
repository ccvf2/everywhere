package everywhere.com.mynetgear.ccvf2.comm.dao.common;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonReplyDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 8.
 * @described 공통댓글 Data Access Object 인터페이스
 * @reference class
 */
@Component
public class CommonReplyDaoImp implements CommonReplyDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	/* 트랜젝션 처리시 */
	@Autowired
	private PlatformTransactionManager transactionManager;
	/** 공통댓글 목록 불러오기 */
	@Override
	public List<CommonReplyDto> getListCommonReplyList(CommonReplyDto commonReplyDto) {
		return sqlTemplate.selectList("select_Common_list_reply",commonReplyDto);
	}
	
	/** 공통댓글 삭제하기 */
	@Override
	public int deleteCommonReply(CommonReplyDto commonReplyDto) {
		return sqlTemplate.delete("delete_Common_reply",commonReplyDto);
	}

	/** 공통댓글 삭제하기 */
	@Override
	public int insertCommonReply(CommonReplyDto commonReplyDto) {
		return sqlTemplate.insert("insert_Common_reply",commonReplyDto);
	}

}
