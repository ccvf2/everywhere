/**
 * 
 */
var values = [];

//명소 쓰기 페이지에서 나라 선택할때 해당 도시 가져오기
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
				str+="<option value='' selected> City </option>";
			}else{
				str+="<option value='' selected disabled>City</option>";
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

function selectSpotList(city){
	var countrycode = document.getElementById("selectCountry").value;
	var citycode = document.getElementById("selectCity").value;
	var typecode = document.getElementById("selectType").value;

	if(city==true) {
		readCityList(true);
	}
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
	var spot_page = document.getElementById("spot_page");
	spot_page.value = 1;
	var str="";
	if(data != ""){
		var obj = JSON.parse(data);
		for(i = 0; i < obj.spot.length; i++){
			str += "<li class='notification' style='margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;' id='spotItem'>"+
					"<div id='"+obj.spot[i].spot_no+"_item' class='rounded'>"+
					"<i style='margin:0;'><img alt='' src='/attatchFile/spot/"+obj.spot[i].spot_photo_save_name+"."+obj.spot[i].spot_photo_extension+"' style='width:35px;height:35px;margin-right:5px;'></i>"+
					"<div class='overflow-h'>"+
					"<span><strong><a href='javascript:spotReadPage("+obj.spot[i].spot_no+")'>"+obj.spot[i].spot_name+"</a></strong></span>"+
					"<small>"+obj.spot[i].spot_note+"</small>"+
					"</div></div></li>";
		}
	}
	$("#mCSB_1_container").empty(); 
	$("#mCSB_1_container").prepend(str);
	
	$( "#spotItem > div" ).draggable({
		appendTo: "body",
		containment: "document",
		revert: "invalid",
		helper: "clone"
	});
}

//여기
function selectMoreSpotList(city){
	var spot_page = document.getElementById("spot_page");
	spot_page.value = Number(spot_page.value)+1;

	var countrycode = document.getElementById("selectCountry").value;	
	var citycode = document.getElementById("selectCity").value;
	var typecode = document.getElementById("selectType").value;
	
	if(city==true) {
		readCityList(true);
	}
	var params = "country_code=" + countrycode + "&city_code=" + citycode + "&spot_type_code="+typecode+"&spot_page="+spot_page.value;
	alert(params);
	var url = "/user/spot/selectSpotListForPlanner.ajax?" + params;
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:moreSpotListDisp,
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	})
}

function moreSpotListDisp(data){
	var str="";
	if(data != ""){
		var obj = JSON.parse(data);
		for(i = 0; i < obj.spot.length; i++){
			str += "<li class='notification' style='margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;' id='spotItem'>"+
					"<div id='"+obj.spot[i].spot_no+"_item' class='rounded'>"+
					"<i style='margin:0;'><img alt='' src='/attatchFile/spot/"+obj.spot[i].spot_photo_save_name+"."+obj.spot[i].spot_photo_extension+"' style='width:35px;height:35px;margin-right:5px;'></i>"+
					"<div class='overflow-h'>"+
					"<span><strong><a href='javascript:spotReadPage("+obj.spot[i].spot_no+")'>"+obj.spot[i].spot_name+"</a></strong></span>"+
					"<small>"+obj.spot[i].spot_note+"</small>"+
					"</div></div></li>";
		}
	}
	$("#mCSB_1_container").append(str);
	
	$( "#spotItem > div" ).draggable({
		appendTo: "body",
		containment: "document",
		revert: "invalid",
		helper: "clone"
	});
}
//여기 끝

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