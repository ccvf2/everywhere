package everywhere.com.mynetgear.ccvf2.admin.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import everywhere.com.mynetgear.ccvf2.admin.service.member.AdminMemberService;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 컨트롤러
 * @reference class
 */
@Controller
public class AdminMemberController {
	@Autowired
	private AdminMemberService adminMemberService;
}
