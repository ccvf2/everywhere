package everywhere.com.mynetgear.ccvf2.user.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.user.dao.mypage.MyPageDao;

@Component
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDao myPageDao;
}
