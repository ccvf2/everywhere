package everywhere.com.mynetgear.ccvf2.admin.dao.chart;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * @author 김성광
 * @createDate 2015. 12. 14.
 * @described ChartDaoImpl
 * @reference class
 */
@Component
public class ChartDaoImpl implements ChartDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List<Integer> getChartMonthList(String start, String end, String year) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		map.put("year", year);
		List<Integer> list =sessionTemplate.selectList("dao.chartMapper.getChartMonthList", map);
		System.out.println("start : " + start + ", end : " + end);
		for(int i=0; i<list.size(); i++){
			System.out.println("i : " + i + ", list.value : " + list.get(i));
		}
		
		return sessionTemplate.selectList("dao.chartMapper.getChartMonthList", map);
	}

	@Override
	public List<Integer> getChartDayList(String year, String month, String dayS, String dayE) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("year", year);
		map.put("month", month);
		map.put("dayS", dayS);
		map.put("dayE", dayE);
		
		
		
		return sessionTemplate.selectList("dao.chartMapper.getChartDayList", map);
	}

	@Override
	public List<Integer> getCharYearList(String year) {
		return sessionTemplate.selectList("dao.chartMapper.getCharYearOne", year);
	}

	@Override
	public List<Integer> getCharYearList(String yearS, String yearE) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("yearS", yearS);
		map.put("yearE", yearE);
		
		return sessionTemplate.selectList("dao.chartMapper.getCharYearList", map);
	}

}
