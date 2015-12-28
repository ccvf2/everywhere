package everywhere.com.mynetgear.ccvf2.user.dao.planner;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import everywhere.com.mynetgear.ccvf2.user.dto.planner.ItemDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.MoneyDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;

@Component
public class PlannerDaoImp implements PlannerDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Override
	public int getPlannerNextSeq() {
		return sqlTemplate.selectOne("get_planner_seq_no");
	}
	
	@Override
	public int getItemNextSeq() {
		return sqlTemplate.selectOne("get_item_seq_no");
	}
	
	@Override
	public int insertPlanner(PlannerDto planner) {
		return sqlTemplate.insert("insert_planner", planner);
	}
	
	@Override
	public int insertPlanner(PlannerDto planner, List<ItemDto> itemList, List<MoneyDto> moneyList) {
		int check = 0;
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		try{
			check = sqlTemplate.update("update_planner", planner);
			for(int i = 0; i < itemList.size(); i++){
				check = sqlTemplate.insert("insert_item", itemList.get(i));
			}
			
			for(int i = 0; i < moneyList.size(); i++){
				check = sqlTemplate.insert("insert_money", moneyList.get(i));
			}			
			
			transactionManager.commit(status);
		}catch(Exception e){
			transactionManager.rollback(status);
			e.printStackTrace();
		}
		
		return check;
	}

	@Override
	public List<PlannerDto> getPlannerListByMember(PlannerDto plannerDto) {
		return sqlTemplate.selectList("get_planner_list_by_mem_no", plannerDto);
	}
	
	@Override
	public List<ItemDto> getItemList(int planner_no) {	
		return sqlTemplate.selectList("get_item_list", planner_no);
	}

	@Override
	public List<MoneyDto> getMoneyList(int item_no) {
		return sqlTemplate.selectList("get_money_list", item_no);
	}
	
	@Override
	public int getPlannerListForAllCount(PlannerDto plannerDto) {
		return sqlTemplate.selectOne("get_planner_list_for_all_Count", plannerDto);
	}
	@Override
	public List<PlannerDto> getPlannerListForAll(PlannerDto plannerDto) {
		return sqlTemplate.selectList("get_planner_list_for_all", plannerDto);
	}

	@Override
	public PlannerDto getOnePlanner(int planner_no) {
		return sqlTemplate.selectOne("get_planner_item", planner_no);
	}

	@Override
	public int updatePlanner(PlannerDto plannerDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePlanner(int planner_no) {
		int check = 0;
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		try{
			check = sqlTemplate.delete("delete_planner", planner_no);
			check = sqlTemplate.delete("delete_item", planner_no);
			check = sqlTemplate.delete("delete_money", planner_no);			
			transactionManager.commit(status);
		}catch(Exception e){
			transactionManager.rollback(status);
			e.printStackTrace();
		}
		
		return check;
	}
	
	public int updatePlannerStatus(PlannerDto plannerDto) {
		return sqlTemplate.update("update_planner_status", plannerDto);
	}


	/** 가장최근에 등록된 플레너 */
	@Override
	public List<PlannerDto> getListPlanner_main() {
		List<PlannerDto> list=null;
		list=sqlTemplate.selectList("new_planner");
		return list;
	}	
}
