package everywhere.com.mynetgear.ccvf2.admin.service.chart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.admin.dao.chart.ChartDao;


/**
 * @author 김성광
 * @createDate 2015. 12. 14.
 * @described ChartServiceImpl
 * @reference class
 */
@Component
public class ChartServiceImpl implements ChartService {
	@Autowired
	private ChartDao chartDao;


	@Override
	public List<Integer> getChartList(String start, String end, String selectOption) {
		if(selectOption.equals("Year")){
			if(start.substring(0, 4).equals(end.substring(0, 4)) ){
				String year=start.substring(0, 4);
				return chartDao.getCharYearList(year);
			}else{
				String yearS=start.substring(0, 4);
				String yearE=end.substring(0, 4);
				return chartDao.getCharYearList(yearS, yearE);
			}
		}else if(selectOption.equals("Month")){
			String monthS=start.substring(5, 7);
			String monthE=end.substring(5, 7);
			String year=start.substring(0, 4);
			
			
			return chartDao.getChartMonthList(monthS, monthE, year);
		}else{
			
			String year=start.substring(0, 4);
			String month=start.substring(5, 7);
			
			
			String dayS=start.substring(8, 10);
			String dayE=end.substring(8, 10);
			
			
			return chartDao.getChartDayList(year, month, dayS, dayE);
		}
	}
}
