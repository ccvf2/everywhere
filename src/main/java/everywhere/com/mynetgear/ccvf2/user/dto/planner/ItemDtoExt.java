package everywhere.com.mynetgear.ccvf2.user.dto.planner;

import java.util.List;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;

public class ItemDtoExt {
	private SpotDto spot;
	private List<CommonFileIODto> item_photoes;
	private List<MoneyDto> moneyList;
	
	public List<CommonFileIODto> getItem_photoes() {
		return item_photoes;
	}
	public void setItem_photoes(List<CommonFileIODto> item_photoes) {
		this.item_photoes = item_photoes;
	}
	
	public List<MoneyDto> getMoneyList() {
		return moneyList;
	}
	public void setMoneyList(List<MoneyDto> moneyList) {
		this.moneyList = moneyList;
	}
	
	public SpotDto getSpot() {
		return spot;
	}
	public void setSpot(SpotDto spot) {
		this.spot = spot;
	}
}
