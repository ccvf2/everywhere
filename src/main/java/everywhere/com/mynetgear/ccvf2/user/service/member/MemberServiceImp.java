package everywhere.com.mynetgear.ccvf2.user.service.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.comm.util.common.SecurityUtil;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

/**
 * @author 김준호
 * @createDate 2015. 12. 7.
 * @described 멤버서비스 구현부
 * @reference class
 */
@Component
public class MemberServiceImp implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CommonCodeService commonCodeService;

	@Override
	public void emailCheck(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		
		String email=StringUtils.trimToEmpty(request.getParameter("email"));
		
		String mem_email=StringUtils.trimToEmpty(memberDao.emailCheck(email));
		System.out.println("memberService emailCheck mem_email:"+mem_email);
		
		int check=0;
		if( StringUtils.equals(email, mem_email) ) {
			check=1;
		}else{
			check=0;
		}
		System.out.println("memberService emailCheck check:"+check);
		
		try {
			response.setContentType("application/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void registerOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		//비밀번호 암호화
		String pw=SecurityUtil.Sha256Encrypt(memberDto.getMem_email(), memberDto.getMem_pwd());
		memberDto.setMem_pwd(pw);
		
		System.out.println("memberDto getMem_p_status_code2 :"+memberDto.getMem_p_status_code());
		if(!memberDto.getMem_p_status_code().equals("M2001")) {
			memberDto.setMem_p_status_code(Constant.MEMBER_P_STATUS_LOCK);
		}
		
		memberDto.setMem_level_code(Constant.MEMBER_LEVEL_USER);
		memberDto.setMem_profile_photo(Constant.SYNB_NULL);
		memberDto.setMem_status_code(Constant.MEMBER_STATUS_LOCK);
		System.out.println("memberService registerOk memberDto:"+memberDto.toString());
		
		int check=memberDao.registerOk(memberDto);
		System.out.println("memberService registerOk check:"+check);
		
		mav.addObject("check", check);
		mav.setViewName("/user/member/registerOk");	
	}

	@Override
	public void memberRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		System.out.println("memberService read mem_no:"+mem_no);
		
		MemberDto memberDto=memberDao.memberRead(mem_no);
		System.out.println("memberService read memberDto:"+memberDto.toString());
		memberDto=memberDao.memberRead(mem_no);
		List<CommonCodeDto> list=commonCodeService.getListCodeGroup("I0001");
		
		mav.addObject("interestList", list);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("/user/member/memberRead");
	}

	@Override
	public void memberUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		System.out.println("memberService update mem_no:"+mem_no);
		memberDto.setMem_no(mem_no);
		
		memberDto=memberDao.memberRead(mem_no);
		System.out.println("memberService update memberDto:"+memberDto.toString());
		List<CommonCodeDto> list=commonCodeService.getListCodeGroup("I0001");
		
		mav.addObject("interestList", list);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("/user/member/memberUpdate");
	}

	@Override
	public void memberUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		if(!memberDto.getMem_p_status_code().equals("M2001")) {
			memberDto.setMem_p_status_code(Constant.MEMBER_P_STATUS_LOCK);
		}
		
		//비밀번호 암호화
		String pw =SecurityUtil.Sha256Encrypt(memberDto.getMem_email(), memberDto.getMem_pwd());
		memberDto.setMem_pwd(pw);
		
		System.out.println("memberService updateOk memberDto:"+memberDto.toString());
		
		int check=memberDao.memberUpdate(memberDto);
		System.out.println("memberService updateOk check:"+check);
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		memberDto=memberDao.memberRead(mem_no);
		
		mav.addObject("check", check);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("/user/member/memberUpdateOk");
	}

	@Override
	public void memberDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		System.out.println("memberService delete mem_no:"+mem_no);
		memberDto.setMem_no(mem_no);
		
		memberDto=memberDao.memberRead(mem_no);
		System.out.println("memberServiceImp delete memberDto:"+memberDto.toString());
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("/user/member/memberDelete");
	}

	@Override
	public void memberDeleteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		//비밀번호 암호화
		String pw=SecurityUtil.Sha256Encrypt(memberDto.getMem_email(), memberDto.getMem_pwd());
		memberDto.setMem_pwd(pw);
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		memberDto.setMem_no(mem_no);
		memberDto.setMem_status_code(Constant.MEMBER_STATUS_WITHDRAW);
		
		int check=memberDao.memberDelete(memberDto);
		System.out.println("memberService deleteOk check:"+check);
		
		mav.addObject("check", check);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("/user/member/memberDeleteOk");
	}

	/* (non-Javadoc)
	 * @see everywhere.com.mynetgear.ccvf2.user.service.member.MemberService#passwordUtil()
	 */
	@Override
	public void passwordUtil() {
		// TODO Auto-generated method stub
		List<MemberDto> list=memberDao.getListTotalMember();
		
		int listSize=list.size();
		for (int i = 0; i < listSize; i++) {
			MemberDto dto = list.get(i);
			//dto.setMem_email(StringUtils.deleteWhitespace(dto.getMem_email()));
			String pw=SecurityUtil.Sha256Encrypt(dto.getMem_email(), dto.getMem_pwd());
			
			if(dto.getMem_pwd().length()<=15){
				dto.setMem_pwd(pw);
				int result=memberDao.chngePasswordMemberInfo(dto);
				
				if(result>0){
					System.out.println("이름:"+dto.getMem_name()+"이메일:"+dto.getMem_email()+"여부: 성공!");
				}else{
					System.out.println(Constant.LOG_ID3+"실패!!!!   이름:"+dto.getMem_name()+"이메일:"+dto.getMem_email());
				}
			}else{
				System.out.println(Constant.LOG_ID2+"이름:"+dto.getMem_name()+"이메일:"+dto.getMem_email()+"여부: 이미암호화된코드");
			}
		}
		System.out.println(Constant.LOG_ID1+"----------------------------------------------------END-------------------------");
		
	}

}
