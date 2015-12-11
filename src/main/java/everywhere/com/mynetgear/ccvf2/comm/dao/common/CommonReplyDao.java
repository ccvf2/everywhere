package everywhere.com.mynetgear.ccvf2.comm.dao.common;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonReplyDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 8.
 * @described 공통댓글 Data Access Object 인터페이스
 * @reference interface
 */
public interface CommonReplyDao {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 8.
	 * @described 댓글목록을 불러오기
	 * @param map
	 * @return
	 */
	public List<CommonReplyDto> getListCommonReplyList(CommonReplyDto commonReplyDto);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 12.
	 * @described 댓글 삭제
	 * @param commonReplyDto
	 * @return
	 */
	public int deleteCommonReply(CommonReplyDto commonReplyDto);		
}
