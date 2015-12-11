package everywhere.com.mynetgear.ccvf2.admin.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.admin.dao.member.AdminMemberDao;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 서비스 구현부
 * @reference class
 */
@Component
public class AdminMemberServiceImp {
	@Autowired
	private AdminMemberDao adminMemberDao;
}
