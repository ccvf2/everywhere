package everywhere.com.mynetgear.ccvf2.user.dao.accompany;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.user.dto.accompany.AccompanyDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 7.
 * @described 동행구하기 DAO
 * @reference class
 */
public interface AccompanyDao {

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 게시판 쓰기
	 * @param accompanyDto
	 * @return
	 */
	int insertAccompany(AccompanyDto accompanyDto);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 게시판 게시글 수 가져오기
	 * @return
	 */
	int getAccompanyCount();

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 게시판 게시글 수만큼 게시글 리스트 가져오기
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	List<AccompanyDto> getAccompanyList(int startRow, int endRow);

}
