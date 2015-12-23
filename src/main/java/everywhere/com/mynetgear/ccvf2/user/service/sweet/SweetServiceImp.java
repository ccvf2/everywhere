package everywhere.com.mynetgear.ccvf2.user.service.sweet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.sweet.SweetDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.dto.sweet.SweetDto;

@Component
public class SweetServiceImp implements SweetService {
	@Autowired
	private SweetDao sweetDao;
	
	@Override
	public void insertSweet(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		String planner_no = request.getParameter("planner_no");
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		SweetDto sweetDto = new SweetDto();
		sweetDto.setMem_no(userInfo.getMem_no());
		sweetDto.setPlanner_no(Integer.parseInt(planner_no));
		
		int result = sweetDao.insertSweet(sweetDto);
		int sweetTotalCount = sweetDao.getTotalSweet(sweetDto.getPlanner_no());
		try {
			response.setContentType("application/html;charset=utf8");
			PrintWriter out = response.getWriter();
			out.print(result+","+sweetTotalCount);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
