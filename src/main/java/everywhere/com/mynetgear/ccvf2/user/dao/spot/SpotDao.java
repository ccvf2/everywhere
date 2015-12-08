package everywhere.com.mynetgear.ccvf2.user.dao.spot;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

public interface SpotDao {

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 7.
	 * @described 국가코드 목록 가져오기
	 * @return
	 */
	public List<CommonCodeDto> getCountryList();
	public List<CommonCodeDto> getSpotTypeList();
	public List<CommonCodeDto> getCityList(String country_code);
	public int insertSpot(SpotDto spotDto);
}
