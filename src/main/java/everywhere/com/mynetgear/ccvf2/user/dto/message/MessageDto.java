package everywhere.com.mynetgear.ccvf2.user.dto.message;

import java.sql.Timestamp;

/**
 * @author 배성욱
 * @createDate 2015. 12. 13.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class MessageDto extends MessageDtoExt{
	private int msg_no;
	private int send_mem_no;
	private int msg_group_no;
	private int recv_mem_no;
	private String message;
	private Timestamp send_time;
	private Timestamp recv_time;
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public int getSend_mem_no() {
		return send_mem_no;
	}
	public void setSend_mem_no(int send_mem_no) {
		this.send_mem_no = send_mem_no;
	}
	public int getMsg_group_no() {
		return msg_group_no;
	}
	public void setMsg_group_no(int msg_group_no) {
		this.msg_group_no = msg_group_no;
	}
	public int getRecv_mem_no() {
		return recv_mem_no;
	}
	public void setRecv_mem_no(int recv_mem_no) {
		this.recv_mem_no = recv_mem_no;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getSend_time() {
		return send_time;
	}
	public void setSend_time(Timestamp send_time) {
		this.send_time = send_time;
	}
	public Timestamp getRecv_time() {
		return recv_time;
	}
	public void setRecv_time(Timestamp recv_time) {
		this.recv_time = recv_time;
	}
	
	
}
