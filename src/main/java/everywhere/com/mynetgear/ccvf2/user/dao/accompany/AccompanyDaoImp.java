package everywhere.com.mynetgear.ccvf2.user.dao.accompany;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.user.dto.accompany.AccompanyDto;



/**
 * @author 곽성국
 * @createDate 2015. 12. 7.
 * @described 동행구하기 DAO 구현부
 * @reference class
 */
@Component
public class AccompanyDaoImp implements AccompanyDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;

	@Override
	public int insertAccompany(AccompanyDto accompanyDto) {
		EverywhereAspect.logger.info(EverywhereAspect.logMsg +accompanyDto.getEnd_date());
		 
		return sqlTemplate.insert("everywhere.com.mynetgear.ccvf2.user.mapper.accompany.insertAccompany", accompanyDto);
	}
	
}
