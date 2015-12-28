package everywhere.com.mynetgear.ccvf2.user.dto.planner;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.EverywhereDefaultDto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 21.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class PlannerDtoExt extends EverywhereDefaultDto {
	private int reply_Count;
	private String mem_name;
	private int sweet_count;
	private int bookmark_Count;
	public int getReply_Count() {
		return reply_Count;
	}
	public void setReply_Count(int reply_Count) {
		this.reply_Count = reply_Count;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getSweet_count() {
		return sweet_count;
	}
	public void setSweet_count(int sweet_count) {
		this.sweet_count = sweet_count;
	}
	public int getBookmark_Count() {
		return bookmark_Count;
	}
	public void setBookmark_Count(int bookmark_Count) {
		this.bookmark_Count = bookmark_Count;
	}

	
	
	
}
