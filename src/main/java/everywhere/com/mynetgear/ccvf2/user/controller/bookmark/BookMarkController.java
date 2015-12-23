package everywhere.com.mynetgear.ccvf2.user.controller.bookmark;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.service.bookmark.BookMarkService;

@Controller
public class BookMarkController {
	@Autowired
	private BookMarkService bookMarkService;
	
	@RequestMapping(value="/user/bookMark/insertBookMark.ajax" ,method=RequestMethod.GET)
	public ModelAndView insertBookMark(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		bookMarkService.insertBookMark(mav);
		return null;
	}
	
	@RequestMapping(value="/user/bookMark/deleteBookMark.ajax" ,method=RequestMethod.GET)
	public ModelAndView deleteBookMark(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		bookMarkService.deleteBookMark(mav);
		return null;
	}
}
