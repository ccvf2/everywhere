/**
 * 
 */
var values = [];

//일정 쓰기 페이지에서 나라 선택할때 해당 도시 가져오기
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

function selectSpotList(city){
	var search = document.getElementById("searchWord").value;
	var countrycode = document.getElementById("selectCountry").value;
	var citycode = document.getElementById("selectCity").value;
	var typecode = document.getElementById("selectType").value;

	if(city==true) {
		if(countrycode != '')
			readCityList(true);
		else{
			var str="<option value='' selected> 도시 </option>";
			$("#selectCity").empty(); 
			$("#selectCity").prepend(str);
		}
	}
	$.ajax({
		url : "/user/spot/getSpotList.ajax",
		type : "POST",
		data : {"country_code":countrycode, "city_code":citycode, "spot_type_code":typecode, "search":search},
		dataType : "text",
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
			var note=obj.spot[i].spot_note;
			note=note.replace("<H1 id='infoname'>","");
			note=note.replace("</H1>",":");
			note=note.replace("<div id='condentAll'>"," ");
			note=note.replace("</div>"," ");
			note=note.replace("<br/>"," ");
		
			str += "<li class='notification' style='margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;' id='spotItem'>"+
					"<div id='"+obj.spot[i].spot_no+"_item' class='rounded'>"+
					"<i style='margin:0;'><img alt='' src='/attatchFile/spot/"+obj.spot[i].spot_photo_save_name+"."+obj.spot[i].spot_photo_extension+"' style='width:35px;height:35px;margin-right:5px;'></i>"+
					"<div class='overflow-h'>"+
					"<span><strong><a href='javascript:spotReadPage("+obj.spot[i].spot_no+")'>"+obj.spot[i].spot_name+"</a></strong></span>"+
					"<small>"+note+"</small>"+
					"</div></div></li>";
		}
		$("#spotRead").text("Load More " + obj.spotPage);
	}
	$("#mCSB_1_container").empty(); 
	$("#mCSB_1_container").prepend(str);
	
	setDraggable();
}

function selectMoreSpotList(city){
	var spot_page = document.getElementById("spot_page");
	spot_page.value = Number(spot_page.value)+1;

	var search = document.getElementById("searchWord").value;
	var countrycode = document.getElementById("selectCountry").value;	
	var citycode = document.getElementById("selectCity").value;
	var typecode = document.getElementById("selectType").value;
	
	if(city==true) {
		readCityList(true);
	}
	$.ajax({
		url : "/user/spot/getSpotList.ajax",
		type : "POST",
		data : {"country_code":countrycode, "city_code":citycode, "spot_type_code":typecode, "spot_page":spot_page.value, "search":search},
		dataType : "text",
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
		$("#spotRead").text("Load More " + obj.spotPage);
	}
	$("#mCSB_1_container").append(str);
	
	setDraggable();
}

function enterSearch(e){
	if(e.keyCode == 13){
		searchSpot();
	}
}

function searchSpot(){
	var spot_page = document.getElementById("spot_page");
	spot_page.value = 1;
	document.getElementById("selectCountry").selectedIndex = 0;	
	document.getElementById("selectCity").selectedIndex = 0;
	document.getElementById("selectType").selectedIndex = 0;

	var search = document.getElementById("searchWord").value;
	$.ajax({
		url : "/user/spot/getSpotList.ajax",
		type : "POST",
		data : {"search":search},
		dataType : "text",
		success:spotListDisp,
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	})
}

function spotReadPage(no) {
	//alert(no);
	var makeDiv ="<div id='showModal"+no+"'></div>";
	var requestURL="/user/spot/spotRead.do?spot_no="+no;
	
	$.ajax({
		url : requestURL,
		type : "GET",
		dataType : "html",
		success : function(data) {
			$("body").append(makeDiv);
			$("#showModal"+no).append(data)
		},
		error : function() {
			alert("목록 가져오기 실패");
		}
	})
}