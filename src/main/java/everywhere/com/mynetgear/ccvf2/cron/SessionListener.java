package everywhere.com.mynetgear.ccvf2.cron;


import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


public class SessionListener implements HttpSessionListener {
	 
	public static int todayCount=0;
	HttpSession session;
	
    @Override
    public void sessionCreated(HttpSessionEvent e) {
 
    	session=e.getSession();
    	todayCount++;
    	
        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
         
    }
    
    @Override
    public void sessionDestroyed(HttpSessionEvent arg0) {
    	
    }
 
}
