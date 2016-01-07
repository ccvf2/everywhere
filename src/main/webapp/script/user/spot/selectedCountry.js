/**
 * 
 */
var values = [];

//명소 쓰기 페이지에서 나라 선택할때 해당 도시 가져오기
function spotReadCityList(check){
	var countrycode = document.getElementById("spotSelectCountry").value;
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
				str+="<option value='' selected> City </option>";
			}else{
				str+="<option value='' selected disabled>City</option>";
			}					
			for(i = 0; i < result.length-1; i++){
				var code = result[i].split(",");
				str+="<option value='"+code[0]+"'>" + code[1] + "</option>";		
			}
			$("#spotSelectCity").empty(); 
			$("#spotSelectCity").prepend(str);
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	})
}

//명소 평가 자바스크립트
function ratingSpot(spot_no){
	var score = $(':radio[name="stars-rating"]:checked').val();
	if(typeof score == "undefined" ){
		alert("별점을 선택하세요");
		return;
	}
	
	var params = "spot_no="+spot_no+"&score="+score;
	var url = "/user/spot/ratingSpot.ajax?" + params;
	alert(url);
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			var result = data.split(",");
			if(result[0] == '1'){
				alert(data);
				var str = '(' + result[1] + ' / ' + result[2] + ' 명이 평가하셨습니다.)';
				$("#spot-score").text(str);
			}
			else{
				alert("별점 평가가 실패하였습니다.");
			}
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	})
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