package everywhere.com.mynetgear.ccvf2.user.dao.sweet;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.user.dto.sweet.SweetDto;

@Component
public class SweetDaoImp implements SweetDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;

	@Override
	public int insertSweet(SweetDto sweetDto) {		
		return sqlTemplate.insert("insert_sweet", sweetDto);
	}

	@Override
	public List<SweetDto> getListSweet(int mem_no) {
		return sqlTemplate.selectList("get_list_sweet", mem_no);
	}

	@Override
	public int isSweet(SweetDto sweetDto) {
		return sqlTemplate.selectOne("check_sweet", sweetDto);
	}

	@Override
	public int getTotalSweet(int planner_no) {
		return sqlTemplate.selectOne("get_total_sweet", planner_no);
	}
}
