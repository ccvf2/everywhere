package everywhere.com.mynetgear.ccvf2.admin.service.main;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dao.main.AdminMainDao;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
/**
 * @author 배성욱
 * @createDate 2015. 12. 5.
 * @described 관리자 메인페이지 서비스 구현부
 * @reference AdminMainService-Service
 */
@Component
public class AdminMainServiceImp implements AdminMainService {
	@Autowired
	private AdminMainDao adminMainDao;
	
	@Override
	public void mainPage(ModelAndView mav) {
		int result =adminMainDao.test();
		StringUtils.equals("", "");
		System.out.println(Constant.LOG_ID1);
		System.out.println(Constant.LOG_ID2);
		System.out.println(Constant.LOG_ID3);
		mav.addObject("result",result);
		mav.setViewName("/admin/main/adminMainPage");
	}


}
