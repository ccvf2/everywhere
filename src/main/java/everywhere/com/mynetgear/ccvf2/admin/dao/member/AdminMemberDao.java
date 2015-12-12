package everywhere.com.mynetgear.ccvf2.admin.dao.member;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 DAO 인터페이스
 * @reference class
 */
public interface AdminMemberDao {

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 11.
	 * @described 사용자 리스트 get
	 * @return
	 */
	List<MemberDto> getMemberList();

}
