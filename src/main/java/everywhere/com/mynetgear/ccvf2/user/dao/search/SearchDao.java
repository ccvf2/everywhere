package everywhere.com.mynetgear.ccvf2.user.dao.search;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dto.search.SpotDtoExt;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 19.
 * @described 검색 관련 Dao
 * @reference class
 */
public interface SearchDao {

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 19.
	 * @described 명소 검색 결과 개수
	 * @param spotDto
	 * @return
	 */
	int getSpotCount(SpotDtoExt spotDto);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 19.
	 * @described 스케줄 검색 결과 개수
	 * @param searchValue
	 * @return
	 */
	int getPlannerCount(String searchValue);

	
	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 19.
	 * @described 명소의 검색결과 리스트를 가져온다.
	 * @param startRow
	 * @param endRow
	 * @param searchValue
	 * @return
	 */
	List<PlannerDao> getPlannerList(int startRow, int endRow, String searchValue);

	/**
	 * @author 곽성국	
	 * @createDate 2015. 12. 21.
	 * @described 명소의 리스트를 가져온다.
	 * @param spotDto
	 * @param currentPage
	 * @return
	 */
	List<SpotDto> getSpotList(SpotDtoExt spotDto);

}
