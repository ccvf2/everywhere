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
	public List<CommonReplyDto> getListCommonReplyList(String type_code, int item_no);
}
