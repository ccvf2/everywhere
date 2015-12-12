package everywhere.com.mynetgear.ccvf2.user.dto.planner;

import java.sql.Timestamp;
import java.util.List;

public class ItemDto {
	private int item_no;
	private int planner_no;
	private int mem_no;
	private int spot_no;
	private int item_order;
	private String note;
	private String attach_photoes;
	private double item_star_score;
	private Timestamp start_time;
	private Timestamp end_time;
	private List<MoneyDto> money;
}
