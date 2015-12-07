package everywhere.com.mynetgear.ccvf2.user.dao.spot;

import java.util.List;

public interface SpotDao {

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 7.
	 * @described 국가코드 목록 가져오기
	 * @return
	 */
	public List<String> getCountryList();
}
