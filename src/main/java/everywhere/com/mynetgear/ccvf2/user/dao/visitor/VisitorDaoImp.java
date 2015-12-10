package everywhere.com.mynetgear.ccvf2.user.dao.visitor;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author 김준호
 * @createDate 2015. 12. 10.
 * @described 방명록Dao 구현부
 * @reference class
 */
@Component
public class VisitorDaoImp implements VisitorDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;

}
