package everywhere.com.mynetgear.ccvf2.user.dto.message;

/**
 * @author 배성욱
 * @createDate 2015. 12. 13.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class MessageDtoExt {
	private String send_mem_name;
	private String send_mem_email;
	private String recv_mem_name;
	private String recv_mem_email;
	private int unreadCount;
	public String getSend_mem_name() {
		return send_mem_name;
	}
	public void setSend_mem_name(String send_mem_name) {
		this.send_mem_name = send_mem_name;
	}
	public String getSend_mem_email() {
		return send_mem_email;
	}
	public void setSend_mem_email(String send_mem_email) {
		this.send_mem_email = send_mem_email;
	}
	public String getRecv_mem_name() {
		return recv_mem_name;
	}
	public void setRecv_mem_name(String recv_mem_name) {
		this.recv_mem_name = recv_mem_name;
	}
	public String getRecv_mem_email() {
		return recv_mem_email;
	}
	public void setRecv_mem_email(String recv_mem_email) {
		this.recv_mem_email = recv_mem_email;
	}
	public int getUnreadCount() {
		return unreadCount;
	}
	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}
	
	
	
}
