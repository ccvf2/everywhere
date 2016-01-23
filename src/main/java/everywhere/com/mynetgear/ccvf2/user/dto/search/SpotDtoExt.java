package everywhere.com.mynetgear.ccvf2.user.dto.search;

import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

/**
 * @author 곽성국
 * @createDate 2015. 12. 22.
 * @changeDate 2016. 1. 23.
 * @changeAuthor 배성욱
 * @described 명소 검색을 위해 도시명을 추가한 DTO
 * @reference class
 */
public class SpotDtoExt extends SpotDto {
	/** 명소검색 : 국가명*/
	private String country_name;
	/** 명소검색 : 도시명*/
	private String city_name;
	/** 명소검색 : 명소종류명*/
	private String spot_type_name;
	
	/** 명소검색 : 계산된 별점*/
	private float star_score;

	public String getCountry_name() {
		return country_name;
	}

	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public String getSpot_type_name() {
		return spot_type_name;
	}

	public void setSpot_type_name(String spot_type_name) {
		this.spot_type_name = spot_type_name;
	}

	public float getStar_score() {
		return star_score;
	}

	public void setStar_score(float star_score) {
		this.star_score = star_score;
	}
	


}
