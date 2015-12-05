package everywhere.com.mynetgear.ccvf2.comm.aop;

import java.util.logging.Logger;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;

/**
 * @author 배성욱
 * @createDate 2015. 12. 5.
 * @described 공통처리를 위한AOP 설정
 * @reference EverywhereAspect-Aspect
 */
@Component
@Aspect
public class EverywhereAspect {
	/** Logger : 로거함수 */
	public static Logger logger=Logger.getLogger(EverywhereAspect.class.getName());
	/** logMsg : 로거변수 */
	public static final String logMsg="LogMsg-------------";
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 6.
	 * @described AOP 함수
	 * @param joinPoint
	 * @return
	 */
	@Around("within(everywhere.com.mynetgear.ccvf2..*)")
	public Object advice(ProceedingJoinPoint joinPoint){
		Object obj=null;
		try {
			logger.info(Constant.LOG_ID2+"ASPECT 요청클래스명:---  "+joinPoint.getTarget().getClass().getName());
			logger.info(Constant.LOG_ID2+"ASPECT 요청함수명:---  "+joinPoint.getSignature().getName());
			obj=joinPoint.proceed();
		} catch (Throwable e) {
			logger.info(Constant.LOG_ID3+"Advice Throwable Message");
			e.printStackTrace();
		}
		return obj;
	}
}
