package everywhere.com.mynetgear.ccvf2.admin.dao.chart;

import java.util.List;

/**
 * @author 김성광
 * @createDate 2015. 12. 14.
 * @described ChartDao
 * @reference interface
 */
public interface ChartDao {
	public List<Integer> getChartMonthList(String start, String end, String year);

	public List<Integer> getChartDayList(String year, String month, String dayS, String dayE);

	public List<Integer> getCharYearList(String year);

	public List<Integer> getCharYearList(String yearS, String yearE);
}
