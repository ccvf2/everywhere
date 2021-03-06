package everywhere.com.mynetgear.ccvf2.user.dto.planner;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

public class ItemDto extends ItemDtoExt{
	private int item_no;
	private int planner_no;
	private int mem_no;
	private int spot_no;
	private int item_order;
	private String note;
	private String attach_photoes;
	private double item_star_score;
	private String item_time;
	
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	
	public int getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(int planner_no) {
		this.planner_no = planner_no;
	}
	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	
	public int getSpot_no() {
		return spot_no;
	}
	public void setSpot_no(int spot_no) {
		this.spot_no = spot_no;
	}
	
	public int getItem_order() {
		return item_order;
	}
	public void setItem_order(int item_order) {
		this.item_order = item_order;
	}
	
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	public String getAttach_photoes() {
		return attach_photoes;
	}
	public void setAttach_photoes(String attach_photoes) {
		this.attach_photoes = attach_photoes;
	}
	
	public double getItem_star_score() {
		return item_star_score;
	}
	public void setItem_star_score(double item_star_score) {
		this.item_star_score = item_star_score;
	}
	
	public String getItem_time() {
		return item_time;
	}
	public void setItem_time(String item_time) {
		this.item_time = item_time;
	}
	
	@Override
	public String toString() {
		return "ItemDto [item_no=" + item_no + ", planner_no=" + planner_no + ", mem_no=" + mem_no + ", spot_no="
				+ spot_no + ", item_order=" + item_order + ", note=" + note + ", attach_photoes=" + attach_photoes
				+ ", item_star_score=" + item_star_score + ", item_time=" + item_time + "]";
	}
}
