package everywhere.com.mynetgear.ccvf2.user.service.bookmark;

import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dto.bookmark.BookMarkDto;

public interface BookMarkService {
	void insertBookMark(ModelAndView mav);
	void deleteBookMark(ModelAndView mav);
	public BookMarkDto setBookMarkDto(ModelAndView mav);
}
