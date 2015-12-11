package everywhere.com.mynetgear.ccvf2.admin.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 DAO 구현부
 * @reference class
 */
@Component
public class AdminMemberDaoImp {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
}
