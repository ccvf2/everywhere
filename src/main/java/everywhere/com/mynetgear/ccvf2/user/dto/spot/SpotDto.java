package everywhere.com.mynetgear.ccvf2.user.dto.spot;

import java.io.File;
import java.util.List;

public class SpotDto {
	private int spot_no;
	private int mem_no;
	private String country_code;
	private String city_code;
	private String spot_name;
	private String spot_type_code;
	private String mem_level_code;
	private String spot_note;
	private String spot_addr;
	private double spot_lat;
	private double spot_long;
	private double total_star_score;
	private int count_star_score;
	
	private List<File> spot_photoes;

	public int getSpot_no() {
		return spot_no;
	}

	public void setSpot_no(int spot_no) {
		this.spot_no = spot_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getCountry_code() {
		return country_code;
	}

	public void setCountry_code(String country_code) {
		this.country_code = country_code;
	}

	public String getCity_code() {
		return city_code;
	}

	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}

	public String getSpot_name() {
		return spot_name;
	}

	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
	}

	public String getSpot_type_code() {
		return spot_type_code;
	}

	public void setSpot_type_code(String spot_type_code) {
		this.spot_type_code = spot_type_code;
	}

	public String getMem_level_code() {
		return mem_level_code;
	}

	public void setMem_level_code(String mem_level_code) {
		this.mem_level_code = mem_level_code;
	}

	public String getSpot_note() {
		return spot_note;
	}

	public void setSpot_note(String spot_note) {
		this.spot_note = spot_note;
	}

	public String getSpot_addr() {
		return spot_addr;
	}

	public void setSpot_addr(String spot_addr) {
		this.spot_addr = spot_addr;
	}

	public double getSpot_lat() {
		return spot_lat;
	}

	public void setSpot_lat(double spot_lat) {
		this.spot_lat = spot_lat;
	}

	public double getSpot_long() {
		return spot_long;
	}

	public void setSpot_long(double spot_long) {
		this.spot_long = spot_long;
	}

	public double getTotal_star_score() {
		return total_star_score;
	}

	public void setTotal_star_score(double total_star_score) {
		this.total_star_score = total_star_score;
	}

	public int getCount_star_score() {
		return count_star_score;
	}

	public void setCount_star_score(int count_star_score) {
		this.count_star_score = count_star_score;
	}

	public List<File> getSpot_photoes() {
		return spot_photoes;
	}

	public void setSpot_photoes(List<File> spot_photoes) {
		this.spot_photoes = spot_photoes;
	}

	@Override
	public String toString() {
		return "SpotDto [spot_no=" + spot_no + ", mem_no=" + mem_no + ", country_code=" + country_code + ", city_code="
				+ city_code + ", spot_name=" + spot_name + ", spot_type_code=" + spot_type_code + ", mem_level_code="
				+ mem_level_code + ", spot_note=" + spot_note + ", spot_addr=" + spot_addr + ", spot_lat=" + spot_lat
				+ ", spot_long=" + spot_long + ", total_star_score=" + total_star_score + ", count_star_score="
				+ count_star_score + ", spot_photoes=" + spot_photoes + "]";
	}
}