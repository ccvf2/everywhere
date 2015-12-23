package everywhere.com.mynetgear.ccvf2.user.dto.bookmark;

public class BookMarkDto {
	private int bookmark_no;
	private int mem_no;
	private String bookmark_type_code;
	private int item_no;
	
	public int getBookmark_no() {
		return bookmark_no;
	}
	public void setBookmark_no(int bookmark_no) {
		this.bookmark_no = bookmark_no;
	}
	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	
	public String getBookmark_type_code() {
		return bookmark_type_code;
	}
	public void setBookmark_type_code(String bookmark_type_code) {
		this.bookmark_type_code = bookmark_type_code;
	}
	
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
}
