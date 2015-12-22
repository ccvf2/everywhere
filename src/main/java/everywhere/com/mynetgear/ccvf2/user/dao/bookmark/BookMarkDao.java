package everywhere.com.mynetgear.ccvf2.user.dao.bookmark;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.user.dto.bookmark.BookMarkDto;

public interface BookMarkDao {
	public int insertBookMark(BookMarkDto bookMark);
	public int isBookMarked(BookMarkDto bookMark);
	public int getTotalBookMark(BookMarkDto bookMark);
	public List<BookMarkDto> getListBookMark(BookMarkDto bookMark);
	public int deleteBookMark(BookMarkDto bookMark);
}
