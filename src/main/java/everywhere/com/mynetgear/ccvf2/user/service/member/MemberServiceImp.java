package everywhere.com.mynetgear.ccvf2.user.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;

/**
 * @author 김준호
 * @createDate 2015. 12. 7.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class MemberServiceImp implements MemberService {
	@Autowired
	private MemberDao memberDao;

}
