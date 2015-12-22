package everywhere.com.mynetgear.ccvf2.user.service.sweet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dao.sweet.SweetDao;
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
		
		String mem_no = request.getParameter("mem_no");
		String planner_no = request.getParameter("planner_no");
		
		SweetDto sweetDto = new SweetDto();
		sweetDto.setMem_no(Integer.parseInt(mem_no));
		sweetDto.setPlanner_no(Integer.parseInt(planner_no));
		
		int result = sweetDao.insertSweet(sweetDto);
		try {
			response.setContentType("application/html;charset=utf8");
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<SweetDto> getListSweet(int mem_no) {
		return sweetDao.getListSweet(mem_no);
	}

	@Override
	public int isSweet(SweetDto sweetDto) {
		return sweetDao.isSweet(sweetDto);
	}

	@Override
	public int getTotalSweet(int planner_no) {
		return sweetDao.getTotalSweet(planner_no);
	}
	
	

}
