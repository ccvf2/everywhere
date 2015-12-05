/**
 * @author 배성욱
 * @createDate 2015. 12. 5.
 * @described 공통처리를 위한AOP 설정
 * @reference EverywhereAspect-Aspect
 */
package everywhere.com.mynetgear.ccvf2.comm.aop;

import java.util.logging.Logger;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;

@Component
@Aspect
public class EverywhereAspect {
	public static Logger logger=Logger.getLogger(EverywhereAspect.class.getName());
	public static final String logMsg="LogMsg-------------";
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
