package everywhere.com.mynetgear.ccvf2.admin.dao.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.admin.dto.member.AdminMemberDto;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 11.
 * @described 관리자 회원관리 DAO 구현부
 * @reference class
 */
@Component
public class AdminMemberDaoImp implements AdminMemberDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;


	@Override
	public List<MemberDto> getMemberList(AdminMemberDto adminMemberDto) {
		return sqlTemplate.selectList("everywhere.com.mynetgear.ccvf2.admin.mapper.member.getMemberList", adminMemberDto);
	}


	@Override
	public int updateMemberStatus(MemberDto memberDto) {
		return sqlTemplate.update("everywhere.com.mynetgear.ccvf2.admin.mapper.member.updateMemberStatus", memberDto);
	}


	@Override
	public int getMemberCount(AdminMemberDto adminMemberDto) {
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.admin.mapper.member.getMemberCount", adminMemberDto);
	}
}
