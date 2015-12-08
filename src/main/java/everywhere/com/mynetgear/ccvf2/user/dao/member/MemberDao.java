package everywhere.com.mynetgear.ccvf2.user.dao.member;

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

}
