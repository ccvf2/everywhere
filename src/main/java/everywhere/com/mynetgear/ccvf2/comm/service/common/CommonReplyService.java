package everywhere.com.mynetgear.ccvf2.comm.service.common;

import java.util.List;

import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonReplyDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 8.
 * @described 공통댓글서비스 인터페이스
 * @reference interface
 */
@Component
public interface CommonReplyService {
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 8.
	 * @described 공통댓글 목록 가져오기.
	 * @param mem_no
	 * @param type_code
	 * @param item_no
	 * @return
	 */
	public List<CommonReplyDto> getListCommonReplyList(CommonReplyDto commonReplyDto);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 12.
	 * @described 공통댓글 삭제하기
	 * @param type_code
	 * @param reply_no
	 * @param mem_no
	 * @return
	 */
	public int deleteCommonReply(CommonReplyDto commonReplyDto);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 12.
	 * @described 공통댓글작성하기
	 * @param commonReplyDto
	 * @return
	 */
	public int inserCommonReply(CommonReplyDto commonReplyDto);
}
