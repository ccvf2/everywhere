package everywhere.com.mynetgear.ccvf2.user.dao.member;

import java.util.HashMap;
import java.util.List;

import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

/**
 * @author 김준호
 * @createDate 2015. 12. 7.
 * @described 멤버Dao
 * @reference class
 */
public interface MemberDao {
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 8.
	 * @described 이메일체크
	 * @param email
	 * @return
	 */
	public String emailCheck(String email);
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 8.
	 * @described 회원가입
	 * @param memberDto
	 * @return
	 */
	public int registerOk(MemberDto memberDto);
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 9.
	 * @described 회원정보보기
	 * @param mem_no
	 * @return
	 */
	public MemberDto memberRead(int mem_no);
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 9.
	 * @described 회원정보수정
	 * @param memberDto
	 * @return
	 */
	public int memberUpdate(MemberDto memberDto);
	
	/**
	 * @author 김준호
	 * @createDate 2015. 12. 10.
	 * @described 회원삭제
	 * @param memberDto
	 * @return
	 */
	public int memberDelete(MemberDto memberDto);
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 15.
	 * @described 로그인시 비밀번호와아이디 체크.
	 * @param memberDto
	 * @return
	 */
	public int tryLoginInfo(MemberDto memberDto);
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 15.
	 * @described 비밀번호 아이디 체크 후 사용자 정보 가져오기
	 * @param memberDto
	 * @return
	 */
	public MemberDto getOneMemberInfo(MemberDto memberDto);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 19.
	 * @described email로 상대의 페이지로 이동
	 * @param mem_email
	 * @return
	 */
	public MemberDto getOneMemberInfoAsEmail(String mem_email);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 19.
	 * @described 친구 유무 체크
	 * @param mateMap
	 * @return
	 */
	public int getMateCheck(HashMap<String, Integer> mateMap);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 19.
	 * @described 친구추가
	 * @param mateMap
	 * @return
	 */
	public int mateInsert(HashMap<String, Integer> mateMap);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 19.
	 * @described 친구삭제
	 * @param mateMap
	 * @return
	 */
	public int mateDelete(HashMap<String, Integer> mateMap);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 19.
	 * @described 친구 목록
	 * @param mem_no
	 * @param endRow 
	 * @param startRow 
	 * @return
	 */
	public List<MemberDto> getListFriends(int mem_no, int startRow, int endRow);
	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 20.
	 * @described 비밀번호 일괄변환용 맴버목록
	 * @return
	 */
	public List<MemberDto> getListTotalMember();
	/**
	 * @author 배성욱
	 * @param dto 
	 * @createDate 2015. 12. 20.
	 * @described 비밀번호 일괄변환용 맴버목록
	 * @return
	 */
	public int chngePasswordMemberInfo(MemberDto dto);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 21.
	 * @described 프로필 업데이트
	 * @param memberDto
	 * @return
	 */
	public int updateProfilePhoto(MemberDto memberDto);

	/**
	 * @author 김성광
	 * @createDate 2015. 12. 23.
	 * @described 친구 검색
	 * @param search
	 * @return
	 */
	public List<MemberDto> searchFriends(String search);
	
	
	/**
	 * @author 김성광
	 * @createDate 2016. 1. 18.
	 * @described 친구 수
	 * @param mem_no
	 * @return
	 */
	public int getFriendsCount(int mem_no);

}
