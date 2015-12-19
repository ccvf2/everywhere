package everywhere.com.mynetgear.ccvf2.user.service.search;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dao.search.SearchDao;

/**
 * @author 곽성국
 * @createDate 2015. 12. 18.
 * @described 검색 서비스 구현
 * @reference class
 */
@Component
public class SearchServiceImp implements SearchService {

	@Override
	public void searchSpot(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
	}
}
