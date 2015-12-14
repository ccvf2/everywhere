package everywhere.com.mynetgear.ccvf2.admin.dto.chart;

/**
 * @author 김성광
 * @createDate 2015. 12. 12.
 * @described 통계 데이터 DTO
 * @reference class
 */
public class ChartDto {
	private int stats_num;
	private int stats_year;
	private int stats_mon;
	private int stats_day;
	private String stats_weekday;
	private int stats_count;
	private String stats_status;
	
	public int getStats_num() {
		return stats_num;
	}
	public void setStats_num(int stats_num) {
		this.stats_num = stats_num;
	}
	public int getStats_year() {
		return stats_year;
	}
	public void setStats_year(int stats_year) {
		this.stats_year = stats_year;
	}
	public int getStats_mon() {
		return stats_mon;
	}
	public void setStats_mon(int stats_mon) {
		this.stats_mon = stats_mon;
	}
	public int getStats_day() {
		return stats_day;
	}
	public void setStats_day(int stats_day) {
		this.stats_day = stats_day;
	}
	public String getStats_weekday() {
		return stats_weekday;
	}
	public void setStats_weekday(String stats_weekday) {
		this.stats_weekday = stats_weekday;
	}
	public int getStats_count() {
		return stats_count;
	}
	public void setStats_count(int stats_count) {
		this.stats_count = stats_count;
	}
	public String getStats_status() {
		return stats_status;
	}
	public void setStats_status(String stats_status) {
		this.stats_status = stats_status;
	}
	@Override
	public String toString() {
		return "ChartDto [stats_num=" + stats_num + ", stats_year=" + stats_year + ", stats_mon=" + stats_mon
				+ ", stats_day=" + stats_day + ", stats_weekday=" + stats_weekday + ", stats_count=" + stats_count
				+ ", stats_status=" + stats_status + "]";
	}
}
