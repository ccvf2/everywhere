package everywhere.com.mynetgear.ccvf2.user.dao.bookmark;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.user.dto.bookmark.BookMarkDto;

@Component
public class BookMarkDaoImp implements BookMarkDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	
	@Override
	public int insertBookMark(BookMarkDto bookMark) {
		return sqlTemplate.insert("insert_bookmark", bookMark);
	}

	@Override
	public int isBookMarked(BookMarkDto bookMark) {
		return sqlTemplate.selectOne("check_bookmark", bookMark);
	}

	@Override
	public int getTotalBookMark(BookMarkDto bookMark) {
		return sqlTemplate.selectOne("get_total_bookMark", bookMark);
	}

	@Override
	public List<BookMarkDto> getListBookMark(BookMarkDto bookMark) {
		return sqlTemplate.selectList("get_list_bookmark", bookMark);
	}

	@Override
	public int deleteBookMark(BookMarkDto bookMark) {
		return sqlTemplate.delete("delete_bookmark", bookMark);
	}
	
}
