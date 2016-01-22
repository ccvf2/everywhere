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
	private String city_name;
	
	/** 명소검색 : 계산된별점 점수*/
	private float star_score=0;

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public float getStar_score() {
		return star_score;
	}

	public void setStar_score(float star_score) {
		this.star_score = star_score;
	}

}
