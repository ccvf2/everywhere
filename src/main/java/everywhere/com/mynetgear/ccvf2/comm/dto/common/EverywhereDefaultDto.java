package everywhere.com.mynetgear.ccvf2.comm.dto.common;

import java.util.List;

/**
 * @author 배성욱
 * @createDate 2015. 12. 9.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class EverywhereDefaultDto extends CommonFileIODto {
	private int totalCount=0;
	private int startRow;
	private int startEnd;
	
	private int currentPage=1;
	private int pageBlock=10;
	private int startPage;
	private int endPage;
	
	private String searchCondition1=""; 
	private String searchCondition2=""; 
	private String searchCondition3=""; 
	private String searchCondition4="";
	
	private String searchWord="";
	
	private List<?> conditionList1;
	private List<?> conditionList2;
	private List<?> conditionList3;
	private List<?> conditionList4;
}
