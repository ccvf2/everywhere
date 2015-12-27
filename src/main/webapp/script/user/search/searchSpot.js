/**
 * 
 */
var values = [];

function typeCheckbox() {
	
}

//검색을 하였을때 실행되는 코드
function searchSpotList(){
	var searchPlace = document.getElementById("searchPlace").value;
	var searchSpot = document.getElementById("searchSpot").value;
	//체크 박스에서 선택된 값 가져와야 함
	//var typecode = document.getElementById("selectType").value;

	var params = "searchPlace=" + searchPlace + "&searchSpot=" + searchSpot;
	var url = "/user/search/getSpotList.ajax?" + params;
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:searchListDisp,
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	})
}

function searchListDisp(data){
	var search_page = document.getElementById("search_page");
	//첫번째 검색이므로 페이지가 1페이지 이다.
	//search_page = 1;
	var str="";
	//검색결과가 널이 아닌 경우
	if(data != ""){
		var obj = JSON.parse(data);
		for(i = 0; i < obj.spot.length; i++){
			var note=obj.spot[i].spot_note;
			note=note.replace("<H1 id='infoname'>","");
			note=note.replace("</H1>",":");
			note=note.replace("<div id='condentAll'>"," ");
			note=note.replace("</div>"," ");
			note=note.replace("<br/>"," ");
		
			str += "<li class='notification' style='margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;' id='spotItem'>"+
					"<div id='"+obj.spot[i].spot_no+"_item' class='ui-widget-content' style='border:0px;'>"+
					"<i style='margin:0; float:left;'><img alt='' src='/attatchFile/spot/"+obj.spot[i].spot_photo_save_name+"."+obj.spot[i].spot_photo_extension+"' style='width:35px;height:35px;margin-right:5px;'></i>"+
					"<div class='overflow-h'>"+
					"<span><strong><a href='javascript:spotReadPage("+obj.spot[i].spot_no+")'>"+obj.spot[i].spot_name+"</a></strong></span>"+
					"<sm  all>"+note+"</small>"+
					"</div></div></li>";
		}
	}
	//하단에 붙어있던 검색 결과를 지운다.
	$("#mCSB_1_container").empty(); 
	$("#mCSB_1_container").prepend(str);
	
}

//스크롤이 제일  하단에 도달하였을때 실행되어야 할 코드
function searchMoreSpotList(){
	var search_page = document.getElementById("search_page");
	spot_page.value = Number(search_page.value)+1;

	var searchPlace = document.getElementById("searchPlace").value;
	var searchSpot = document.getElementById("searchSpot").value;
	
	var params = "searchPlace=" + searchPlace + "&searchSpot=" + searchSpot + "&search_page=" + seach_page.value;
	
	alert(params);
	var url = "/user/search/getMoreSpotList.ajax?" + params;
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

//데이터를 가져와서 하단에 붙이는 함수
function moreSpotListDisp(data){
	var str="";
	if(data != ""){
		var obj = JSON.parse(data);
		for(i = 0; i < obj.spot.length; i++){
			str += "<li class='notification' style='margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow=hidden' id='spotItem'>"+
					"<div id='"+obj.spot[i].spot_no+"_item' class='rounded'>"+
					"<i style='margin:0;float:left;'><img alt='' src='/attatchFile/spot/"+obj.spot[i].spot_photo_save_name+"."+obj.spot[i].spot_photo_extension+"' style='width:35px;height:35px;margin-right:5px;'></i>"+
					"<div class='overflow-h'>"+
					"<span><strong><a href='javascript:spotReadPage("+obj.spot[i].spot_no+")'>"+obj.spot[i].spot_name+"</a></strong></span>"+
					"<small>"+obj.spot[i].spot_note+"</small>"+
					"</div></div></li>";
		}
	}
	$("#mCSB_1_container").append(str);
	
}
