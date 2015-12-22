package everywhere.com.mynetgear.ccvf2.user.controller.sweet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.service.sweet.SweetService;

@Controller
public class SweetController {
	@Autowired
	private SweetService sweetService;
	
	@RequestMapping(value="/user/sweet/insertSweet.ajax", method=RequestMethod.GET)
	public ModelAndView insertSweet(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		sweetService.insertSweet(mav);
		return null;
	}
}
