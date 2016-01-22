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
	public int insertPlanner(PlannerDto planner) {
		return sqlTemplate.insert("insert_planner", planner);
	}
	
	@Override
	public int insertPlanner(PlannerDto planner, List<ItemDto> itemList) {
		int check = 0;
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		try{
			check = sqlTemplate.update("update_planner", planner);
			for(int i = 0; i < itemList.size(); i++){
				check = insertItem(itemList.get(i));
			}
			
			transactionManager.commit(status);
		}catch(Exception e){
			transactionManager.rollback(status);
			e.printStackTrace();
			check = 0;
		}
		
		return check;
	}

	public int insertItem(ItemDto itemDto){
		int check = sqlTemplate.insert("insert_item", itemDto);
		List<MoneyDto> moneyList = itemDto.getMoneyList();
		
		for(int i = 0; i < moneyList.size(); i++){
			moneyList.get(i).setItem_no(itemDto.getItem_no());
			check = sqlTemplate.insert("insert_money", moneyList.get(i));
		}
		return check;
	}

	@Override
	public PlannerDto getOnePlanner(int planner_no) {
		return sqlTemplate.selectOne("get_planner_item", planner_no);
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
	public List<PlannerDto> getPlannerListByMember(PlannerDto plannerDto) {
		return sqlTemplate.selectList("get_planner_list_by_mem_no", plannerDto);
	}

	public int updatePlannerStatus(PlannerDto plannerDto) {
		return sqlTemplate.update("update_planner_status", plannerDto);
	}
	
	public int updatePlannerTitle(PlannerDto plannerDto) {
		return sqlTemplate.update("update_planner_title", plannerDto);
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

	@Override
	public int updatePlanner(PlannerDto planner, List<ItemDto> itemList) {
		int check = 0;
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		try{
			check = sqlTemplate.update("update_planner", planner);
			List<ItemDto> oldItemList = sqlTemplate.selectList("get_item_list", planner.getPlanner_no());
			for(int i = 0; i < itemList.size(); i++){
				if(itemList.get(i).getItem_no() == 0)
					check = insertItem(itemList.get(i));
				else{
					check = updateItem(itemList.get(i));
					if(oldItemList.size() > 0){
						for (ItemDto itemDto : oldItemList) {
							if(itemDto.getItem_no() == itemList.get(i).getItem_no()){
								oldItemList.remove(itemDto);
								break;
							}
						}
					}
				}
			}
		
			for(int i = 0; i < oldItemList.size(); i++){
				List<MoneyDto> moneyList = oldItemList.get(i).getMoneyList();
				if(moneyList != null && moneyList.size() > 0){
					for (MoneyDto moneyDto : moneyList) {
						check = sqlTemplate.delete("delete_money_by_money_no", moneyDto.getMoney_no());
					}
				}
				check = sqlTemplate.delete("delete_item_by_item_no", oldItemList.get(i).getItem_no());
			}
			
			transactionManager.commit(status);
		}catch(Exception e){
			transactionManager.rollback(status);
			e.printStackTrace();
			check = 0;
		}
		
		return check;
	}

	public int updateItem(ItemDto itemDto){
		int check = sqlTemplate.update("update_item", itemDto);
		List<MoneyDto> moneyList = itemDto.getMoneyList();
		
		List<MoneyDto> oldMoneyList = sqlTemplate.selectList("get_money_list", itemDto.getItem_no());
		for(int i = 0; i < moneyList.size(); i++){
			moneyList.get(i).setItem_no(itemDto.getItem_no());
			if(moneyList.get(i).getMoney_no() == 0 )
				check = sqlTemplate.insert("insert_money", moneyList.get(i));
			else{
				check = sqlTemplate.update("update_money", moneyList.get(i));
				for (MoneyDto moneyDto : oldMoneyList) {
					if(moneyDto.getItem_no() == moneyList.get(i).getMoney_no()){
						oldMoneyList.remove(moneyDto);
						break;
					}
				}
			}
		}
		
		for(int i = 0; i < oldMoneyList.size(); i++){
			check = sqlTemplate.delete("delete_money_by_money_no", oldMoneyList.get(i).getMoney_no());
		}
		return check;
	}

	/** 가장최근에 등록된 플레너 */
	@Override
	public List<PlannerDto> getListPlanner_main() {
		List<PlannerDto> list=null;
		list=sqlTemplate.selectList("new_planner");
		return list;
	}	
}
