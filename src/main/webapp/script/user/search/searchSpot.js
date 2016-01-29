/**
 * 
 */


//검색을 하였을때 실행되는 코드
function searchSpotList(page){
	var params = "";
	//지역 검색 값 (나라, 도시)
	//셀렉트 박스에서 나라 및 도시의 값을 가져옴
	var selectCountry = document.getElementById("selectCountry").value;
	//셀렉트 박스에서 도시의 값을 가져옴
	var selectCity = document.getElementById("selectCity").value;
	//명소 명 검색 값
	var searchSpot = document.getElementById("searchSpot").value;
	//체크 박스에서 선택된 값 가져와야 함
	var spot_type_code="";
	$('input:checkbox[name=spot_type_code]').each(function() {    
	    if($(this).is(':checked')) {
	    	spot_type_code = spot_type_code +"&spot_type_code=" + $(this).val() + ",";
	    }
	});

	//alert(spot_type_code);
	if(selectCountry!=null) {
		params += "selectCountry=" + selectCountry;
		if(selectCity!=null) {
			params += "&selectCity=" + selectCity;
		}
	}
	
	var params = params+ "&searchSpot=" + searchSpot + "&spotPage=" + page + spot_type_code;
	location.href="/user/search/searchSpot.do?" + params;
}

function readCityList(check){
	var countrycode = document.getElementById("selectCountry").value;
	var params = "country_code=" + countrycode;
	var url = "/user/spot/selectCountry.ajax?" + params;
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			var result = data.split("|");
			var str = "";
			if(check==true) {
				str+="<option value='' selected> 도시 </option>";
			}else{
				str+="<option value='' selected disabled> 도시 </option>";
			}
			for(i = 0; i < result.length-1; i++){
				var code = result[i].split(",");
				str+="<option value='"+code[0]+"'>" + code[1] + "</option>";
			}
			$("#selectCity").empty(); 
			$("#selectCity").prepend(str);
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	})
}
