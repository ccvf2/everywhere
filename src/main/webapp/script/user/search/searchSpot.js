/**
 * 
 */


//검색을 하였을때 실행되는 코드
function searchSpotList(page){
	var searchPlace = document.getElementById("searchPlace").value;
	var searchSpot = document.getElementById("searchSpot").value;
	//체크 박스에서 선택된 값 가져와야 함
	var spot_type_code="";
	$('input:checkbox[name=spot_type_code]').each(function() {    
	    if($(this).is(':checked')) {
	    	spot_type_code+=$(this).val() + ",";
	    }
	});
	alert(spot_type_code);
	var params = "searchPlace=" + searchPlace + "&searchSpot=" + searchSpot + "&spotPage=" + page + "&spot_type_code=" + spot_type_code;
	location.href="/user/search/searchSpot.do?" + params;
}
