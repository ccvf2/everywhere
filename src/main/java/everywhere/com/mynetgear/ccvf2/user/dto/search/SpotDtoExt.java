package everywhere.com.mynetgear.ccvf2.user.dto.search;

import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 22.
 * @described 명소 검색을 위해 도시명을 추가한 DTO
 * @reference class
 */
public class SpotDtoExt extends SpotDto {
	private String city_name;

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
}
