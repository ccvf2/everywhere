package everywhere.com.mynetgear.ccvf2.user.dao.member;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

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

	@Override
	public String emailCheck(String email) {
		String mem_email=sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.member.emailCheck", email);
		System.out.println("MemberDaoImp mem_email:"+mem_email);
		return mem_email;
	}

	@Override
	public int registerOk(MemberDto memberDto) {
		return sqlTemplate.insert("everywhere.com.mynetgear.ccvf2.user.mapper.member.memberRegist", memberDto);
	}

	@Override
	public MemberDto memberRead(int mem_no) {
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.member.memberRead", mem_no);
	}

	@Override
	public int memberUpdate(MemberDto memberDto) {
		return sqlTemplate.update("everywhere.com.mynetgear.ccvf2.user.mapper.member.memberUpdate", memberDto);
	}

	@Override
	public int memberDelete(MemberDto memberDto) {
		return sqlTemplate.update("everywhere.com.mynetgear.ccvf2.user.mapper.member.memberDelete", memberDto);
	}

	/** 아이디 비밀번호 체크 */
	@Override
	public int tryLoginInfo(MemberDto memberDto) {
		return sqlTemplate.selectOne("tryLoginInfo", memberDto);
	}
	/** 아이디 비밀번호 체크 후 로그인사용자 정보가져오기 */
	@Override
	public MemberDto getOneMemberInfo(MemberDto memberDto) {
		return sqlTemplate.selectOne("getOneMemberInfo", memberDto);
	}
	
	/** email로 회원 정보(Dto) 가져오기*/
	@Override
	public MemberDto getOneMemberInfoAsEmail(String mem_email) {
		return sqlTemplate.selectOne("getOneMemberInfoAsEmail", mem_email);
	}
	
	/** 친구 유무 확인*/
	@Override
	public int getMateCheck(HashMap<String, Integer> mateMap) {
		return sqlTemplate.selectOne("getMateCheck", mateMap);
	}

	/** 친구 추가*/
	@Override
	public int mateInsert(HashMap<String, Integer> mateMap) {
		return sqlTemplate.insert("mateInsert", mateMap);
	}

	/** 친구 삭제*/
	@Override
	public int mateDelete(HashMap<String, Integer> mateMap) {
		return sqlTemplate.delete("mateDelete", mateMap);
	}

	/** 친구 목록*/
	@Override
	public List<MemberDto> getListFriends(int mem_no) {
		return sqlTemplate.selectList("getListFriends", mem_no);
	}
	
	
	/** 비밀번호 일괄변환 */
	@Override
	public List<MemberDto> getListTotalMember() {
		return sqlTemplate.selectList("passwordChnge");
	}

	@Override
	public int chngePasswordMemberInfo(MemberDto dto) {
		return sqlTemplate.update("chngePasswordMemberInfo",dto);
	}

}
