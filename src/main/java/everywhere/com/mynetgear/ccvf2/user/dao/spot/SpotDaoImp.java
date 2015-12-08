package everywhere.com.mynetgear.ccvf2.user.dao.spot;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

/**
 * @author 안희진
 * @createDate 2015. 12. 7.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Component
public class SpotDaoImp implements SpotDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	/* 트랜젝션 처리시 */
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Override
	public List<CommonCodeDto> getCountryList() {
		return sqlTemplate.selectList("selectList_country_code");
	}

	@Override
	public List<CommonCodeDto> getCityList(String country_code) {
		return sqlTemplate.selectList("selectList_city_code", country_code);
	}

	@Override
	public List<CommonCodeDto> getSpotTypeList() {
		return sqlTemplate.selectList("selectList_spot_code");
	}

	@Override
	public int insertSpot(SpotDto spotDto) {
		return sqlTemplate.insert("insert_spot", spotDto);
	}
	
}
