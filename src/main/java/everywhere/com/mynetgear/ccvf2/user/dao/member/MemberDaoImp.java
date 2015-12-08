package everywhere.com.mynetgear.ccvf2.user.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;

/**
 * @author 김준호
 * @createDate 2015. 12. 7.
 * @described 멤버Dao 구현부
 * @reference class
 */
@Component
public class MemberDaoImp implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	@Autowired
	private PlatformTransactionManager transactionManager;

	@Override
	public String emailCheck(String email) {
		String mem_email=sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.member.emailCheck", email);
		System.out.println("MemberDaoImp mem_email:"+mem_email);
		return mem_email;
	}

}
