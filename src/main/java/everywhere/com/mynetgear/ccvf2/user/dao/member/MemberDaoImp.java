package everywhere.com.mynetgear.ccvf2.user.dao.member;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

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
	public List<MemberDto> getListFriends(int mem_no, int startRow, int endRow) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mem_no", mem_no);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("MEMBER_STATUS_ACTIVE", Constant.MEMBER_STATUS_ACTIVE);
		
		return sqlTemplate.selectList("getListFriends", map);
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

	@Override
	public int updateProfilePhoto(MemberDto memberDto) {
		return sqlTemplate.insert("updateProfilePhoto", memberDto);
	}

	@Override
	public List<MemberDto> searchFriends(String search) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("MEMBER_STATUS_ACTIVE", Constant.MEMBER_STATUS_ACTIVE);
		
		return sqlTemplate.selectList("searchFriends", map);
	}

	@Override
	public int getFriendsCount(int mem_no) {
		System.out.println("---------getFriendsCountDaoImpl");
		return sqlTemplate.selectOne("getFriendsCount", mem_no);
	}

	@Override
	public List<PlannerDto> getBookMarkList(int mem_no, int startRow, int endRow, String list_code) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mem_no", mem_no);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("list_code", list_code);
		map.put("USE_YN", Constant.SYNB_YN_Y);
		
		return sqlTemplate.selectList("getBookMarkList", map);
	}

	@Override
	public void myPageDeleteBookMark(int item_no, int mem_no) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("item_no", item_no);
		map.put("mem_no", mem_no);
		sqlTemplate.delete("myPageDeleteBookMark", map);
	}

	@Override
	public int getBookMarkCount(int mem_no) {
		return sqlTemplate.selectOne("getBookMarkCount", mem_no);
	}

	@Override
	public int getPlannerCount(int mem_no) {
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.member.getPlannerCount", mem_no);
	}

	@Override
	public List<PlannerDto> getPlannerList(int mem_no, int startRow, int endRow, String MYPAGE_CODE, String search) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("mem_no", mem_no);
		map.put("MYPAGE_CODE", MYPAGE_CODE);
		map.put("search", search);
		return sqlTemplate.selectList("everywhere.com.mynetgear.ccvf2.user.mapper.member.getPlannerList", map);
	}

}
