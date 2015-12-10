/**
 * 
 */
var values = [];

//명소 쓰기 페이지에서 나라 선택할때 해당 도시 가져오기
function readCityList(){
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

function selectSpotList(){
	var countrycode = document.getElementById("selectCountry").value;
	var citycode = document.getElementById("selectCity").value;
	var typecode = document.getElementById("selectType").value;
	var params = "country_code=" + countrycode + "&city_code=" + citycode + "&spot_type_code="+typecode;
	var url = "/user/spot/selectSpotList.ajax?" + params;
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:spotListDisp,
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	})
}

function spotListDisp(data){
	var str="";
	if(data != ""){
		var obj = JSON.parse(data);
		for(i = 0; i < obj.spot.length; i++){
			str+="<li><div><a href='/user/spot/spotReadPage.do?spot_no="+obj.spot[i].spot_no+"'> "+obj.spot[i].spot_name+"</a>"+obj.spot[i].spot_note+"</div></li>";	
		}
	}
	$("#spotList").empty(); 
	$("#spotList").prepend(str);
}

//명소 업데이트 자바스크립트
function updateSpot(spot_no){
	var urlName="/user/spot/updateSpot.do?spot_no="+spot_no;
	location.href=urlName;
}

//명소 삭제 자바스크립트
function deleteSpot(spot_no){
	var urlName="/user/spot/delete.do?spot_no="+spot_no;
	var check = confirm("삭제하시겠습니까?");
	if (check == true) {
		location.href=urlName;
	} else {
	   	alert("취소하셨습니다");
	}
}