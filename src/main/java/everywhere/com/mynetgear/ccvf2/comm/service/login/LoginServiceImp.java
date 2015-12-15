package everywhere.com.mynetgear.ccvf2.comm.service.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
	public void HandleMemberLogin(ModelAndView mav) {/*
		String errMsg = "";
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		MemberDto dto = (MemberDto)map.get("memberDto");
		// XSS 처리fhrm
		String mem_email = dto.getMem_email();
		mem_email = StringUtils.trim(mem_email);
		mem_email = StringUtil.removeXSS(mem_email, false);
		dto.setMem_email(mem_email);
		
		String mem_pwd = dto.getMem_pwd();
		mem_pwd = StringUtils.trim(mem_pwd);
		mem_pwd = StringUtil.removeXSS(mem_pwd, false);
		dto.setMem_pwd(mem_pwd);

		// 아이디 존재 여부 확인
		if (memberDao.getAdminIdcheck(request, dto) > 0) {
			try {
				// 암호화 알고리즘을 통한 암호 복원
				String password256 = SecurityUtil.Sha256Encrypt(vo.getAdminId(), vo.getAdminPassword());
				vo.setAdminPassword(password256);
				AdminVO member = adminDao.getLoginInfo(vo);
				if (null == member || StringUtils.equals(vo.getAdminPassword(), member.getAdminPassword())) {
					mav = new ModelAndView("/login/login");
					mav.addObject(Constants.ALERT_MSG, "로그인 정보가 정확하지 않습니다.");
				} else {

					// 로그인시간처리
					adminDao.updateLoginConnectDate(member);

					// 세션처리
					HttpSession session = request.getSession();
					session.setAttribute("SESSION_USER", member);
					session.setAttribute("sid", member.getAdminId());
					session.setAttribute("sidname", member.getAdminName()); // 이름
					session.setAttribute("sidseq", member.getAdminSeq()); // adminSeq
					session.setAttribute("sidemail", member.getAdminEmail()); // 이메일
					// 로그인 시간 처리
					session.setAttribute("time", StringUtil.getTodayEx5());
					// 이전 접속 시간
					session.setAttribute("conn", member.getAdminConnectDate());


					// 불필요한 파라미터 제거
					String url = "/main/main.do";
					RedirectView redirectView = new RedirectView(url);
					redirectView.setExposeModelAttributes(false);
					mav = new ModelAndView(redirectView);

				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} else {
			// 아이디 불일치
			mav = new ModelAndView("/");
			mav.addObject(Constant.ALERT_MSG, "로그인 정보가 정확하지 않습니다.");
		}
		
	*/}
	
	
	
}
