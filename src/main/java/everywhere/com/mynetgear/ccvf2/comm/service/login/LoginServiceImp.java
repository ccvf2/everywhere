package everywhere.com.mynetgear.ccvf2.comm.service.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.comm.util.common.SecurityUtil;
import everywhere.com.mynetgear.ccvf2.comm.util.common.StringUtil;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 14.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class LoginServiceImp implements LoginService {
	@Autowired
	private MemberDao memberDao;

	@Override
	public void HandleMemberLogin(ModelAndView mav) {
		String returnAddress="";
		
		String errMsg = "";
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		String callback_url=map.get("callback_url").toString();
		String callback_param=map.get("callback_param").toString();
		MemberDto dto = (MemberDto)map.get("memberDto");
		// XSS 처리fhrm
		String mem_email = dto.getMem_email();
		mem_email = StringUtils.trim(mem_email);
		mem_email = StringUtil.removeXSS(mem_email, false);
		dto.setMem_email(mem_email);
		
		String mem_pwd = dto.getMem_pwd();
		mem_pwd = StringUtils.trim(mem_pwd);
		mem_pwd = StringUtil.removeXSS(mem_pwd, false);

		//비밀번호 암호화
		String pw=SecurityUtil.Sha256Encrypt(mem_email, mem_pwd);
		dto.setMem_pwd(pw);
		
		// 아이디 존재 여부 확인
		int exisiID=memberDao.tryLoginInfo(dto);
		if (exisiID==1) {
			try {
				MemberDto member = memberDao.getOneMemberInfo(dto);

					// 세션처리
					HttpSession session = request.getSession();
					session.setAttribute(Constant.SYNN_LOGIN_OBJECT, member);
					
					if(StringUtils.equals(callback_url, Constant.SYNB_NULL)){
						callback_url="/user/main/main.do";
						mav.clear();
						returnAddress="redirect:"+ callback_url;
					}else{
						if(StringUtils.equals(callback_param, Constant.SYNB_NULL)==false){
							mav.clear();
							returnAddress="redirect:"+ callback_url+"?"+callback_param;
						}
					}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} else {
			// 아이디 불일치
			mav.addObject(Constant.ALERT_MSG, "로그인 정보가 정확하지 않습니다.");
			mav.addObject(Constant.CALLBACK_URL, callback_url);
			mav.addObject(Constant.CALLBACK_PARAM, callback_param);
			callback_url="/user/main/main.do";
			returnAddress="forward:"+ callback_url;
		}
		mav.setViewName(returnAddress);
	}
	
	
	
}
