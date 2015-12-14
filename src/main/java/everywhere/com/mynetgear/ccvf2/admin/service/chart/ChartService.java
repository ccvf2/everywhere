package everywhere.com.mynetgear.ccvf2.admin.service.chart;

import java.util.List;

/**
 * @author 김성광
 * @createDate 2015. 12. 14.
 * @described ChartService
 * @reference interface
 */
public interface ChartService {
	public List<Integer> getChartList(String start, String end, String selectOption);
}
