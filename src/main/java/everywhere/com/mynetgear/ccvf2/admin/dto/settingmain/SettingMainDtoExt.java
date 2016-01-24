package everywhere.com.mynetgear.ccvf2.admin.dto.settingmain;

import java.util.Date;
import java.util.Map;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.EverywhereDefaultDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

/**
 * @author 배성욱
 * @createDate 2016. 1. 23.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class SettingMainDtoExt extends EverywhereDefaultDto{
	private String settingCRUD="";
	private PlannerDto plannerDto = new PlannerDto(); 
	
	public String getSettingCRUD() {
		return settingCRUD;
	}
	public void setSettingCRUD(String settingCRUD) {
		this.settingCRUD = settingCRUD;
	}

	
	//플래너 객체의 setter,getter
	public int getPlanner_no() {
		return plannerDto.getPlanner_no();
	}
	public void setPlanner_no(int planner_no) {
		this.plannerDto.setPlanner_no(planner_no);
	}
	public int getMem_no() {
		return plannerDto.getMem_no();
	}
	public void setMem_no(int mem_no) {
		this.plannerDto.setMem_no(mem_no);
	}
	public String getPlanner_ba_code() {
		return plannerDto.getPlanner_ba_code();
	}
	public void setPlanner_ba_code(String planner_ba_code) {
		this.plannerDto.setPlanner_ba_code(planner_ba_code);
	}
	public String getTitle() {
		return plannerDto.getTitle();
	}
	public void setTitle(String title) {
		this.plannerDto.setTitle(title);
	}
	public String getAttach_file() {
		return plannerDto.getAttach_file();
	}
	public void setAttach_file(String attach_file) {
		this.plannerDto.setAttach_file(attach_file);
	}
	public String getMemo() {
		return plannerDto.getMemo();
	}
	public void setMemo(String memo) {
		this.plannerDto.setMemo(memo);
	}
	public Date getStart_date() {
		return plannerDto.getStart_date();
	}
	public void setStart_date(Date start_date) {
		this.plannerDto.setStart_date(start_date);
	}
	public Date getEnd_date() {
		return plannerDto.getEnd_date();
	}
	public void setEnd_date(Date end_date) {
		this.plannerDto.setEnd_date(end_date);
	}
	public Date getReg_date() {
		return plannerDto.getReg_date();
	}
	public void setReg_date(Date reg_date) {
		this.plannerDto.setReg_date(reg_date);
	}
	public String getUse_yn() {
		return plannerDto.getUse_yn();
	}
	public void setUse_yn(String use_yn) {
		this.plannerDto.setUse_yn(use_yn);
	}
	//플래너Ext 객체의 setter,getter
	public int getReply_Count() {
		return plannerDto.getReply_Count();
	}
	public void setReply_Count(int reply_Count) {
		this.plannerDto.setReply_Count(reply_Count);
	}
	public String getMem_name() {
		return plannerDto.getMem_name();
	}
	public void setMem_name(String mem_name) {
		this.plannerDto.setMem_name(mem_name);
	}
	public int getSweet_count() {
		return plannerDto.getSweet_count();
	}
	public void setSweet_count(int sweet_count) {
		this.plannerDto.setSweet_count(sweet_count);
	}
	public int getBookmark_Count() {
		return plannerDto.getBookmark_Count();
	}
	public void setBookmark_Count(int bookmark_Count) {
		this.plannerDto.setBookmark_Count(bookmark_Count);
	}

}
