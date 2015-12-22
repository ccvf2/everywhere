package everywhere.com.mynetgear.ccvf2.user.service.sweet;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dto.sweet.SweetDto;

public interface SweetService {
	public void insertSweet(ModelAndView mav);
	public List<SweetDto> getListSweet(int mem_no);
	public int isSweet(SweetDto sweetDto);
	public int getTotalSweet(int planner_no);
}
