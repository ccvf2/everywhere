package everywhere.com.mynetgear.ccvf2.comm.util.common;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.lang.StringUtils;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.MailVO;

/**
 * @author 배성욱
 * @createDate 2015. 12. 10.
 * @described 메일전송을 위한 유틸입니다.mailSender() 함수를 호출하세요.
 * @reference class
 */
public class MailSend {
	private static Message message = null;
	private static int totalSender=0;
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 10.
	 * @described 메일 전송을 위한 메소드 입니다.
	 *  반환 값이 -2 이면 메일서버 접속에러 입니다.
	 *  반환 값이 -1 이면 mailVo의 값이 잘못 설정된 것입니다.
	 *  반환 값이 1 이상이면 메일 전송건수 입니다.
	 * @param mailVo
	 * @return int
	 */
	public int mailSender(MailVO mailVo) {
		int result = -2;
		boolean connection = connectSMTP();
		//서버연결이 잘되면 실행되면 메일을 작성함
		if(connection){
			boolean mailCreate = createMail(mailVo);
			if(mailCreate){
				//메일을 전송함.
				sendMail();
				result=totalSender;
			}else{
				result=-1;
			}
		}
		return result;
	}
	
	
	
	private boolean connectSMTP(){
		boolean connectionResult=false;
		Properties prop = new Properties();
		//사내 메일 망일 경우 smtp host 만 설정해도 됨 (특정 포트가 아닐경우)
		prop.put("mail.smtp.host", "ccvf2.mynetgear.com");
		prop.put("mail.smtp.starttls.enable","false");
		prop.put("mail.transport.protocol", "smtp");
		//prop.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.port", "25");
		prop.put("mail.smtp.auth", "true");
		
		//SMTP 서버 계정 인증정보
		MyAuthenticator authenticator = new MyAuthenticator("admin", "66107e7");
		Session session = Session.getDefaultInstance(prop, authenticator);
		try{
			message = new MimeMessage(session);
			connectionResult=true;
		} catch (Exception e) {
			System.out.println("Mail Server Connection Failed");
			e.printStackTrace();
		}
		return connectionResult;
	}
	
	private static boolean createMail(MailVO mailVo){
		MimeBodyPart mbp = new MimeBodyPart();
		boolean createResult=false;
		try{
			//메일 제목 넣기
			message.setSubject(mailVo.getMail_title());
			
			//메일 본문 작성
			//message 객체에 본문을 넣기 위하여 Multipart 객체 생성
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mbp);
				
				if(StringUtils.equals(mailVo.getMail_content_type(), Constant.MAIL_CONTENT_TYPE_TEXT)){
					//일반텍스트
					mbp.setText(mailVo.getMail_content());
				}else if(StringUtils.equals(mailVo.getMail_content_type(), Constant.MAIL_CONTENT_TYPE_HTML)){
					//html일 경우
					//MimeBodyPart mbp_html = new MimeBodyPart();
					//mbp_html.setDataHandler(new DataHandler(new ByteArrayDataSource(new FileInputStream(new File("[보낼 HTML 경로]")), "text/html")));
					//mp.addBodyPart(mbp_html);
				}else{
					//에러처리
				}
				
				
			//메일 본문을 넣기
			message.setContent(mp);
			
			
			if(StringUtils.equals(mailVo.getMail_attach_name(), Constant.SYNB_NULL)==false &&
					StringUtils.equals(mailVo.getMail_attach_path(), Constant.SYNB_NULL)==false){
				//파일 첨부일 경우
				MimeBodyPart mbp_file = new MimeBodyPart();
				mbp_file.setDataHandler(new DataHandler(new FileDataSource(
						mailVo.getMail_attach_path()+mailVo.getMail_attach_name())
						));
				mbp_file.setFileName(mailVo.getMail_attach_name());
				mp.addBodyPart(mbp_file);
			}
			

			//보내는 날짜
			message.setSentDate(new Date());
			//보내는 메일 주소
			message.setFrom(new InternetAddress(mailVo.getMail_sender_email()));
			
			
				//다중건 인지 단일건 인지 확인.
				
				//","포함여부확인.
				int count=StringUtils.countMatches(mailVo.getMail_receiver_email(), Constant.SYNB_COMMA);
				//메일주소가 완전히 공란인지 확인.
				boolean emptyEmailAddress=StringUtils.equals(mailVo.getMail_receiver_email(), Constant.SYNB_NULL);
				
				//다중건 일경우.
				if(count>0 && emptyEmailAddress==false){
					//복수 건 전송일 때는 사용 start 
					InternetAddress[] receive_address = {new InternetAddress(mailVo.getMail_receiver_email())};
					message.setRecipients(RecipientType.TO, receive_address);
					totalSender=count+1;
					//복수 건 전송일 때는 사용 end
				}else if(count==0&&emptyEmailAddress==false){
					//단건 전송일 때는 사용 start
					message.setRecipient(RecipientType.TO, new InternetAddress(mailVo.getMail_receiver_email()));
					totalSender=1;
					//단건 전송일 때는 사용 end
				}else{
					Exception excpt=new Exception("메일주소가 비어 있습니다.");
					throw excpt;
				}
			createResult=true;
		} catch (Exception e){
			e.printStackTrace();
		}
		return createResult;
	}
	
	
	private static boolean sendMail(){
		boolean success=false;
		try {
			Transport.send(message);
			success=true;
		} catch (MessagingException e) {
			success=false;
			e.printStackTrace();
		}
		return success;
	}


}

class MyAuthenticator extends Authenticator {
    private String id;
    private String pw;
    public MyAuthenticator(String id, String pw) {
        this.id = id;
        this.pw = pw;
    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(id, pw);
	}
}