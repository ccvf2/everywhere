package everywhere.com.mynetgear.ccvf2.comm.service.common;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonReplyDao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonReplyDto;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;

/**
 * @author 배성욱
 * @createDate 2015. 12. 8.
 * @described 공통댓글서비스 클래스
 * @reference class
 */
@Component
public class CommonReplyServiceImp implements CommonReplyService {
	@Autowired
	private CommonReplyDao commonReplyDao;
	/*
	 * 공통댓글 목록 불러오기
	 */
	@Override
	public List<CommonReplyDto> getListCommonReplyList(String type_code, int item_no) {
		List<CommonReplyDto> replyList = null;
		String errorMsg =Constant.SYNB_NULL;
		try {
			if(StringUtils.equals(Constant.SYNB_NULL, type_code)){
				errorMsg+="타입코드가 입력안되었습니다./";
			}else if(item_no==0){
				errorMsg+="글번호가 입력안되었습니다./";
			}else{
				//실제구현부
				CommonReplyDto commonReplyDto = new CommonReplyDto();
				commonReplyDto.setType_code(type_code);
				commonReplyDto.setItem_no(item_no);
				
				replyList = commonReplyDao.getListCommonReplyList(commonReplyDto);
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(errorMsg);
		}finally {
			System.out.println(errorMsg);
		}
		return replyList;
	}

}
