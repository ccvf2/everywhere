package everywhere.com.mynetgear.ccvf2.user.controller.visitor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import everywhere.com.mynetgear.ccvf2.user.service.visitor.VisitorService;

/**
 * @author 김준호
 * @createDate 2015. 12. 10.
 * @described 방명록 컨트롤러
 * @reference class
 */
@Controller
public class VisitorController {
	@Autowired
	private VisitorService visitorService;

}
