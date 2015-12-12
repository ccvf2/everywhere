package everywhere.com.mynetgear.ccvf2.user.dao.visitor;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dto.visitor.VisitorDto;

/**
 * @author 김준호
 * @createDate 2015. 12. 10.
 * @described 방명록Dao 구현부
 * @reference class
 */
@Component
public class VisitorDaoImp implements VisitorDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;

	@Override
	public int getVisitorCount() {
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.visitor.visitorCount");
	}

	@Override
	public List<VisitorDto> getVisitorList(int startRow, int endRow) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("visitor_status_code", Constant.SYNB_YN_Y);
		
		return sqlTemplate.selectList("everywhere.com.mynetgear.ccvf2.user.mapper.visitor.visitorList", hMap);
	}

	@Override
	public int visitorInsert(VisitorDto visitorDto) {
		return sqlTemplate.insert("everywhere.com.mynetgear.ccvf2.user.mapper.visitor.visitorInsert", visitorDto);
	}

	@Override
	public VisitorDto visitorSelect(int visitor_no) {
		return sqlTemplate.selectOne("everywhere.com.mynetgear.ccvf2.user.mapper.visitor.visitorSelect", visitor_no);
	}

	@Override
	public int visitorUpdate(VisitorDto visitorDto) {
		return sqlTemplate.update("everywhere.com.mynetgear.ccvf2.user.mapper.visitor.visitorUpdate", visitorDto);
	}

	@Override
	public int visitorDelete(VisitorDto visitorDto) {
		return sqlTemplate.update("everywhere.com.mynetgear.ccvf2.user.mapper.visitor.visitorDelete", visitorDto);
	}

}
