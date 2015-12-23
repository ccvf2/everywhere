package everywhere.com.mynetgear.ccvf2.user.service.bookmark;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.bookmark.BookMarkDao;
import everywhere.com.mynetgear.ccvf2.user.dto.bookmark.BookMarkDto;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
@Component
public class BookMarkServiceImp implements BookMarkService {
	@Autowired
	private BookMarkDao bookMarkDao;
	@Override
	public void insertBookMark(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		BookMarkDto bookMark = setBookMarkDto(mav);

		int result = bookMarkDao.insertBookMark(bookMark);
		int bookMarkCount = bookMarkDao.getTotalBookMark(bookMark);
		try {
			response.setContentType("application/html;charset=utf8");
			PrintWriter out = response.getWriter();
			out.print(result+","+bookMarkCount);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteBookMark(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		BookMarkDto bookMark = setBookMarkDto(mav);
		
		int result = bookMarkDao.deleteBookMark(bookMark);
		int bookMarkCount = bookMarkDao.getTotalBookMark(bookMark);
		try {
			response.setContentType("application/html;charset=utf8");
			PrintWriter out = response.getWriter();
			out.print(result+","+bookMarkCount);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public BookMarkDto setBookMarkDto(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		MemberDto userInfo = (MemberDto)request.getSession().getAttribute(Constant.SYNN_LOGIN_OBJECT);

		String planner_no = request.getParameter("planner_no");
		String friend_no = request.getParameter("friend_no");

		BookMarkDto bookMark = new BookMarkDto();
		bookMark.setMem_no(userInfo.getMem_no());
		if(planner_no != null){
			bookMark.setBookmark_type_code(Constant.BOOKMARK_TYPE_PLANNER);
			bookMark.setItem_no(Integer.parseInt(planner_no));
		}
		if(friend_no != null){
			bookMark.setBookmark_type_code(Constant.BOOKMARK_TYPE_FRIEND);
			bookMark.setItem_no(Integer.parseInt(friend_no));
		}
		
		return bookMark;
	}
}
