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
	 * @param accompany_status_code 
	 * @param searchValue 
	 * @param searchValue 
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 게시판 게시글 수 가져오기
	 * @return
	 */
	int getAccompanyCount(String searchValue, String accompany_status_code);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 게시판 게시글 수만큼 게시글 리스트 가져오기
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	List<AccompanyDto> getAccompanyList(int startRow, int endRow, String searchValue, String accompany_status_code);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 8.
	 * @described 동행구하기 게시판 읽기
	 * @param accompany_no
	 * @return
	 */
	AccompanyDto readAccompany(int accompany_no);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 9.
	 * @described 세션 mem_no과 동행구하기 게시글 mem_no를 비교
	 * @param accompany_no
	 * @param mem_no 
	 * @return
	 */
	int checkUserAccompany(int accompany_no, int mem_no);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 9.
	 * @described 동행구하기 게시판 삭제
	 * @param accompany_no
	 * @param mem_no
	 * @return
	 */
	int deleteAccompany(int accompany_no, int mem_no);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 9.
	 * @described 동행 구하기 게시판 수정
	 * @param accompanyDto
	 * @return
	 */
	int updateAccompany(AccompanyDto accompanyDto);


	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 14.
	 * @described 동행구하기 게시판의 최근 5개 글을 가져온다. (공지 제외)
	 * @return
	 */
	List<AccompanyDto> getRecentAccompanyList();

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 18.
	 * @described 다음 시퀀스 가져옴
	 * @return
	 */
	int getAccompanyNextSeq();

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 22.
	 * @described 동행구하기 게시글을 가져온다.
	 * @param accompany_no
	 * @return
	 */
	AccompanyDto getOneAccompany(int accompany_no);


}
