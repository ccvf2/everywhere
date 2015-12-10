package everywhere.com.mynetgear.ccvf2.user.service.visitor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.user.dao.visitor.VisitorDao;

/**
 * @author 김준호
 * @createDate 2015. 12. 10.
 * @described 방명록서비스 구현부
 * @reference class
 */
@Component
public class VisitorServiceImp implements VisitorService {
	@Autowired
	private VisitorDao visitorDao;

}
