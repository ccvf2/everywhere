package everywhere.com.mynetgear.ccvf2.user.dao.visitor;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.dto.visitor.VisitorDto;

/**
 * @author 김준호
 * @createDate 2015. 12. 10.
 * @described 방명록 Dao
 * @reference class
 */
public interface VisitorDao {
	/**
	 * @author 김준호
	 * @param mem_no 
	 * @createDate 2015. 12. 10.
	 * @described 방명록갯수
	 * @return
	 */
	public int getVisitorCount(int mem_no);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 10.
	 * @described 방명록리스트
	 * @param startRow
	 * @param endRow
	 * @param mem_no 
	 * @return
	 */
	public List<VisitorDto> getVisitorList(int startRow, int endRow, int mem_no);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록작성
	 * @param visitorDto
	 * @return
	 */
	public int visitorInsert(VisitorDto visitorDto);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록수정
	 * @param visitor_no
	 * @return
	 */
	public VisitorDto visitorSelect(int visitor_no);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록수정
	 * @param visitorDto
	 * @return
	 */
	public int visitorUpdate(VisitorDto visitorDto);
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 11.
	 * @described 방명록삭제
	 * @param visitor_no
	 * @return
	 */
	public int visitorDelete(int visitor_no);
}
