/**
 * 관리자 회원관리에서 회원을 검색하는 js
 */
// 검색 버튼이 눌렷을때 호출됨
function searchFun(pageNumber) {
	var search=document.getElementById("search").value;
	var memLevel=document.getElementById("memLevel").value;
	var memStatus=document.getElementById("memStatus").value;
	var phoneStatus=document.getElementById("phoneStatus").value;
	var start_date=document.getElementById("start_date").value;
	var end_date=document.getElementById("end_date").value;
	
	var searchOption=document.getElementById("searchOption");
    var selectedOption = searchOption.options[searchOption.selectedIndex].value
    /* 
	alert("memLevel:" + memLevel);
	alert("memStatus:" + memStatus);
	alert("phoneStatus:" + phoneStatus);
	alert("start_date:" + start_date);
	alert("end_date:" + end_date);
	alert("selectedOption: " + selectedOption); */
	var url = "/admin/member/adminMemberList.do?";
	
	if(searchOption!="") {
		if(selectedOption=="name") {
			url+="name="+search;
		} else if(selectedOption=="email") {
			url+="email="+search;
		} else if(selectedOption=="emailname"){
			url+="name="+search+"&email="+search;
		}
	}
	
	
	if(memLevel!="") {
		url+="&memLevel="+memLevel;
	}
	
	if(memStatus!=""){
		url+="&memStatus="+memStatus;
	}
	
	if(phoneStatus!=""){
		url+="&phoneStatus="+phoneStatus;
	}
	
	if(start_date!=""){
		url+="&start_date="+start_date;
	}
	
	if(end_date!=""){
		url+="&end_date="+end_date;
	}
	
	url+="&pageNumber="+pageNumber;
			
	location.href=url;
}