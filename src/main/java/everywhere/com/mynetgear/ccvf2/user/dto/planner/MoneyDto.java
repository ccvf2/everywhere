package everywhere.com.mynetgear.ccvf2.user.dto.planner;

public class MoneyDto {
	private int moeny_no;
	private int planner_no;
	private int item_no;
	private int mem_no;
	private int spot_no;
	private String money_type_code;
	private String money_currency_code;
	private Double amount;
	
	public int getMoeny_no() {
		return moeny_no;
	}
	public void setMoeny_no(int moeny_no) {
		this.moeny_no = moeny_no;
	}
	
	public int getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(int planner_no) {
		this.planner_no = planner_no;
	}
	
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	
	public int getSpot_no() {
		return spot_no;
	}
	public void setSpot_no(int spot_no) {
		this.spot_no = spot_no;
	}
	
	public String getMoney_type_code() {
		return money_type_code;
	}
	public void setMoney_type_code(String money_type_code) {
		this.money_type_code = money_type_code;
	}
	
	public String getMoney_currency_code() {
		return money_currency_code;
	}
	public void setMoney_currency_code(String money_currency_code) {
		this.money_currency_code = money_currency_code;
	}
	
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "MoneyDto [moeny_no=" + moeny_no + ", planner_no=" + planner_no + ", item_no=" + item_no + ", mem_no="
				+ mem_no + ", spot_no=" + spot_no + ", money_type_code=" + money_type_code + ", money_currency_code="
				+ money_currency_code + ", amount=" + amount + "]";
	}
	
	
}