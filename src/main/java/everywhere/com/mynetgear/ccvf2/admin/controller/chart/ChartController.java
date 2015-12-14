package everywhere.com.mynetgear.ccvf2.admin.controller.chart;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.admin.service.chart.ChartService;


/**
 * @author 김성광
 * @createDate 2015. 12. 12.
 * @described 통계 컨트롤러
 * @reference class
 */
@Controller
public class ChartController {
	
	@Autowired
	private ChartService service;
	
	@RequestMapping(value="/admin/chart/chartView.do", method=RequestMethod.GET)
	public ModelAndView chartView(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("/admin/chart/chartView");
	}
	
	@RequestMapping(value="/admin/chart/chartList.do", method=RequestMethod.GET)
	public void chartList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String start=request.getParameter("date1");
		String end=request.getParameter("date2");
		String selectOption=request.getParameter("selectOption");
		
		System.out.println("start : " + start + ", end="+end + ",  selectOption : " +selectOption);
		
		List<Integer> chartList=service.getChartList(start, end, selectOption);
		
		System.out.println("controller chartList : " + chartList.size());
		
		
		JSONArray jarray=new JSONArray();
		
		if(selectOption.equals("Year")){
			for (int i = 0; i < chartList.size(); i++) {
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("stats_year", Integer.parseInt(start.substring(0, 4))+i);
				map.put("stats_count", chartList.get(i));
				
				jarray.add(map);
			}
		}else if(selectOption.equals("Month")){
			for (int i = 0; i < chartList.size(); i++) {
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("stats_month", (Integer.parseInt(start.substring(5, 7))+i));
				map.put("stats_count", chartList.get(i));
				
				jarray.add(map);
			}
		}else{
			for (int i = 0; i < chartList.size(); i++) {
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("stats_day", (Integer.parseInt(start.substring(8,10))+i));
				map.put("stats_count", chartList.get(i));
				
				jarray.add(map);
			}
		}
		
	
		String jsonData = jarray.toJSONString();
		//System.out.println(jsonData);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonData);
	}
}
