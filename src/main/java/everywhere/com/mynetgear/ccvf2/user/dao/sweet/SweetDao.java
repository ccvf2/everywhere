package everywhere.com.mynetgear.ccvf2.user.dao.sweet;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.user.dto.sweet.SweetDto;

public interface SweetDao {
	public int insertSweet(SweetDto sweetDto);
	public List<SweetDto> getListSweet(int mem_no);
	public int isSweet(SweetDto sweetDto);
	public int getTotalSweet(int planner_no);
}
