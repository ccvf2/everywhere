package everywhere.com.mynetgear.ccvf2.user.service.spot;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dao.spot.SpotDao;

@Component
public class SpotServiceImp implements SpotService{
	@Autowired
	private SpotDao spotDao;

	@Override
	public void addSpotPage(ModelAndView mav) {
		List<String> countryList = spotDao.getCountryList();
		System.out.println("ListCount : " + countryList.size());
		mav.addObject("countryList", countryList);
		mav.setViewName("/user/spot/addSpotPage");
	}

	@Override
	public void readCityList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String country_code = request.getParameter("country_code");
		System.out.println(country_code);
		int value = 1;
		if(value > 0){
			String cityList = "#F0001:서울|#F0001:수원|#F0001:부산|#F0001:전주";
			
			try {
				response.setContentType("application/html;charset=utf8");
				PrintWriter out = response.getWriter();
				out.print(cityList);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
