package everywhere.com.mynetgear.ccvf2.comm.dto.common;

import java.io.Serializable;

/**
 * @author 배성욱
 * @createDate 2015. 12. 9.
 * @described 메일전송DTO
 * @reference class
 */
public class MailVO implements Serializable {
	private static final long serialVersionUID = 8652408111609587520L;

	/** 메일 보내는 사람 이름(발신자) */
	private String mail_sender_name = "";
	/** 메일 보내는 사람 메일주소(발신자) */
	private String mail_sender_email = "admin@ccvf2.mynetgear.com";
	/** 메일 받는 사람 이름(수신자) */
	private String mail_receiver_name = "";
	/** 메일 받는 사람 메일주소(수신자) */
	private String mail_receiver_email = "ccvf2@naver.com, bau21231@gmai.com";
	/** 메일 제목 */
	private String mail_title = "타이틀1";
	/** 메일내용 */
	private String mail_content = "내용내용1";
	/** 메일내용 타입(text or HTML) */
	private String mail_content_type = "text";
	/** 첨부파일명 */
	private String mail_attach_name = "";
	/** 첨부위치 */
	private String mail_attach_path = "";
	/* 숨은참조 */
	private String mail_bcc = "";
	/* 참조 */
	private String mail_cc = "";
	public String getMail_sender_name() {
		return mail_sender_name;
	}
	public void setMail_sender_name(String mail_sender_name) {
		this.mail_sender_name = mail_sender_name;
	}
	public String getMail_sender_email() {
		return mail_sender_email;
	}
	public void setMail_sender_email(String mail_sender_email) {
		this.mail_sender_email = mail_sender_email;
	}
	public String getMail_receiver_name() {
		return mail_receiver_name;
	}
	public void setMail_receiver_name(String mail_receiver_name) {
		this.mail_receiver_name = mail_receiver_name;
	}
	public String getMail_receiver_email() {
		return mail_receiver_email;
	}
	public void setMail_receiver_email(String mail_receiver_email) {
		this.mail_receiver_email = mail_receiver_email;
	}
	public String getMail_title() {
		return mail_title;
	}
	public void setMail_title(String mail_title) {
		this.mail_title = mail_title;
	}
	public String getMail_content() {
		return mail_content;
	}
	public void setMail_content(String mail_content) {
		this.mail_content = mail_content;
	}
	public String getMail_content_type() {
		return mail_content_type;
	}
	public void setMail_content_type(String mail_content_type) {
		this.mail_content_type = mail_content_type;
	}
	public String getMail_attach_name() {
		return mail_attach_name;
	}
	public void setMail_attach_name(String mail_attach_name) {
		this.mail_attach_name = mail_attach_name;
	}
	public String getMail_attach_path() {
		return mail_attach_path;
	}
	public void setMail_attach_path(String mail_attach_path) {
		this.mail_attach_path = mail_attach_path;
	}
	public String getMail_bcc() {
		return mail_bcc;
	}
	public void setMail_bcc(String mail_bcc) {
		this.mail_bcc = mail_bcc;
	}
	public String getMail_cc() {
		return mail_cc;
	}
	public void setMail_cc(String mail_cc) {
		this.mail_cc = mail_cc;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
