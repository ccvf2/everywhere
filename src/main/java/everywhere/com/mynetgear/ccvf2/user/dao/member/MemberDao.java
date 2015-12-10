package everywhere.com.mynetgear.ccvf2.user.dao.member;

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

}
