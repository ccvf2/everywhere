package everywhere.com.mynetgear.ccvf2.user.service.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;

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

	@Override
	public void emailCheck(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		
		String email=request.getParameter("email");
		// EverywhereAspect.logger.info(EverywhereAspect.logger+","+email);
		
		String mem_email=memberDao.emailCheck(email);
		System.out.println("emailCheck mem_email:"+mem_email);
		// EverywhereAspect.logger.info(EverywhereAspect.logger+","+mem_email);
		
		int check=0;
		if(mem_email.equals(email)&& mem_email!=null) {
			check=1;
		}else{
			check=0;
		}
		System.out.println("emailCheck check:"+check);
		
		try {
			response.setContentType("application/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
