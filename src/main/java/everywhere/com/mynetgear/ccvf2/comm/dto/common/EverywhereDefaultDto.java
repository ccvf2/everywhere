package everywhere.com.mynetgear.ccvf2.comm.dto.common;

import java.util.List;

/**
 * @author 배성욱
 * @createDate 2015. 12. 9.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class EverywhereDefaultDto extends CommonFileIODto {
	/** 글 전체 갯수 */
	private int totalCount=0;
	/** 시작글번호 */
	private int startRow;
	/** 끝글번호 */
	private int endRow;
	/** 현재 선택된 페이지  */
	private int currentPage=1;
	/** 화면에 뿌릴 페이징 갯수 */
	private int pageBlock=5;
	/** 총 페이징 수(페이징블록단위) */
	private int pageCount;
	/** 화면에 뿌릴 시작 페이징 번호 */
	private int startPage;
	/** 화면에 뿌릴 끝 페이징 번호 */
	private int endPage;
	
	/** 화면에 뿌릴 페이징 갯수 */
	private int pageBlockGroupCount;
	
	private String searchCondition1=""; 
	private String searchCondition2=""; 
	private String searchCondition3=""; 
	private String searchCondition4="";
	
	private String searchWord1="";
	private String searchWord2="";
	
	private List<?> conditionList1;
	private List<?> conditionList2;
	private List<?> conditionList3;
	private List<?> conditionList4;
	
	private int mem_no;
	private String mem_name;
	private String mem_level_code;
	private String mem_email;
	private String mem_profile_photo;
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageBlockGroupCount() {
		return pageBlockGroupCount;
	}
	public void setPageBlockGroupCount(int pageBlockGroupCount) {
		this.pageBlockGroupCount = pageBlockGroupCount;
	}
	public String getSearchCondition1() {
		return searchCondition1;
	}
	public void setSearchCondition1(String searchCondition1) {
		this.searchCondition1 = searchCondition1;
	}
	public String getSearchCondition2() {
		return searchCondition2;
	}
	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}
	public String getSearchCondition3() {
		return searchCondition3;
	}
	public void setSearchCondition3(String searchCondition3) {
		this.searchCondition3 = searchCondition3;
	}
	public String getSearchCondition4() {
		return searchCondition4;
	}
	public void setSearchCondition4(String searchCondition4) {
		this.searchCondition4 = searchCondition4;
	}
	public String getSearchWord1() {
		return searchWord1;
	}
	public void setSearchWord1(String searchWord1) {
		this.searchWord1 = searchWord1;
	}
	public String getSearchWord2() {
		return searchWord2;
	}
	public void setSearchWord2(String searchWord2) {
		this.searchWord2 = searchWord2;
	}
	public List<?> getConditionList1() {
		return conditionList1;
	}
	public void setConditionList1(List<?> conditionList1) {
		this.conditionList1 = conditionList1;
	}
	public List<?> getConditionList2() {
		return conditionList2;
	}
	public void setConditionList2(List<?> conditionList2) {
		this.conditionList2 = conditionList2;
	}
	public List<?> getConditionList3() {
		return conditionList3;
	}
	public void setConditionList3(List<?> conditionList3) {
		this.conditionList3 = conditionList3;
	}
	public List<?> getConditionList4() {
		return conditionList4;
	}
	public void setConditionList4(List<?> conditionList4) {
		this.conditionList4 = conditionList4;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_level_code() {
		return mem_level_code;
	}
	public void setMem_level_code(String mem_level_code) {
		this.mem_level_code = mem_level_code;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_profile_photo() {
		return mem_profile_photo;
	}
	public void setMem_profile_photo(String mem_profile_photo) {
		this.mem_profile_photo = mem_profile_photo;
	}



	// 페이징 정보 구하는 매소드(가져올글갯수)
	public void pageingCalculation(int getRow) {
		int startRow=(currentPage-1)*getRow+1;
		this.startRow=startRow;
		
		int endRow=currentPage*getRow;
		this.endRow=endRow;
		
		int pageCount=this.totalCount/getRow+(totalCount%getRow==0?0:1);
		this.pageCount=pageCount;
		
		int startPage=((this.currentPage-1)/this.pageBlock)*this.pageBlock+1;
		this.startPage=startPage;
		
		int endPage=this.startPage+this.pageBlock-1;
		this.endPage=endPage;
		if(this.endPage>this.pageCount){
			this.endPage=this.pageCount;
		}
		
		//this.currentPage=currentPage;
	}
}
