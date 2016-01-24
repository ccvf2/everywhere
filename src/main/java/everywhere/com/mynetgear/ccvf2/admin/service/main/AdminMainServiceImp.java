package everywhere.com.mynetgear.ccvf2.admin.service.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.dao.main.AdminMainDao;
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
		//int result =adminMainDao.test();
		//mav.addObject("result",result);
		mav.setViewName("/admin/main/adminMainPage");
	}


}
