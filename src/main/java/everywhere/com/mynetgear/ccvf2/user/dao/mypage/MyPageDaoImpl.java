package everywhere.com.mynetgear.ccvf2.user.dao.mypage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyPageDaoImpl implements MyPageDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
}
