package everywhere.com.mynetgear.ccvf2.cron;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author 김성광
 * @createDate 2015. 12. 14.
 * @described Scheduler
 * @reference class
 */
@Component
public class Scheduler {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	int cnt=0;
	static int checkTodayCount=0;
	
	/**
	 * 1. 7초마다 호출이 되는 스케쥴러 
	 */
	//@Scheduled(cron = "0/7 * * * * ?")
	public void cronTest1(){
		if(checkTodayCount==0){
			 checkTodayCount=sqlSessionTemplate.selectOne("dao.chartMapper.selectTodayCount");
			 if(checkTodayCount==0){
		         sqlSessionTemplate.insert("dao.chartMapper.totalSetCount");
		     }
		}
		
		if(SessionListener.todayCount==0){
			int selectTodayCount=sqlSessionTemplate.selectOne("dao.chartMapper.selectTodayCount");
			SessionListener.todayCount+=selectTodayCount;
		}
		
		
		if(SessionListener.todayCount!=cnt){	// 감지 획득
			cnt=SessionListener.todayCount;
			if(SessionListener.todayCount==cnt)
				sqlSessionTemplate.update("dao.chartMapper.todayCountUpdate", cnt);
		}else{
			//System.out.println("DB - Detect every 7 seconds");
		}
	}
	
	/**
	 * 2. 매일 정시(00:00) 마다 Today total, login user count=0 set
	 */
	
	//@Scheduled(cron = "0 0 0 * * ?")
	public void cronTest2(){
		int todayCnt=sqlSessionTemplate.selectOne("dao.chartMapper.todaySelectCnt");
		if(todayCnt==0){
			SessionListener.todayCount=0;
			sqlSessionTemplate.insert("dao.chartMapper.totalSetCount");
			sqlSessionTemplate.insert("dao.chartMapper.loginUSetCount");
		}
	}
	
	
}
