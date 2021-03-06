package everywhere.com.mynetgear.ccvf2.user.dao.spot;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.user.dto.search.SpotDtoExt;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

public interface SpotDao {

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 7.
	 * @described 국가코드 목록 가져오기
	 * @return
	 */
	public int insertSpot(SpotDto spotDto);
	public List<SpotDto> getSpotAllList();
	public List<SpotDto> getSpotAllListForPlanner();
	public List<SpotDto> getSpotList(SpotDto spotDto, int currNum, int spotSize);
	public int getTotalSpotSize(SpotDto spotDto);
	public SpotDto getOneSpot(int spot_no);
	public int updateSpot(SpotDto spotDto);
	public int deleteSpot(int spot_no);
	public int ratingSpot(SpotDto spotDto);
	
	public List<SpotDtoExt> getMySpotList(int mem_no, String search, int currNum, int spotSize);
	public int getTotalMySpotSize(int mem_no, String search);
	
	//메인에 뿌려질 명소목록(6개)
	public List<SpotDtoExt> getListSpotUserMain();
}
