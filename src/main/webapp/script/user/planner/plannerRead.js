/**
 *창! 
 */

function startup(use_yn, writer_no, mem_no){
	if(use_yn == 'Y0002' && writer_no != mem_no){
		alert("비공개 글입니다");
		window.history.back();
	}
	if(use_yn == 'Y0003'){
		alert("삭제된 글입니다.");
		window.history.back();
	}
}

function insertSweet(planner_no, checkSweet){
	if(checkSweet == '-1'){
		alert("로그인해주세요");
		return;
	}
	
	var params = "planner_no="+planner_no;
	var url = "/user/sweet/insertSweet.ajax?" + params;
		$.ajax({
			url : url,
			type : "GET",
			dataType : "text",
			success : function(data) {
				var result = data.split(",");
				if(result[0] != '0' && data != ''){
					alert("추천되었습니다.")
					$(".fa-heart-o").hide();
					$(".fa-heart").show();
					$("#likeBtn").removeAttr("href");
					$(".plan-detail-view-like-count").text(" " + result[1]);
				}
			},
			error : function() {
				alert("추천되지 않았습니다.")
			}
		})
}

function insertBookMark(planner_no, checkBookMark){
	if(checkBookMark == '-1'){
		alert("로그인해주세요");
		return;
	}
	
	var params = "planner_no="+planner_no;
	var url = "/user/bookMark/insertBookMark.ajax?" + params;
		$.ajax({
			url : url,
			type : "GET",
			dataType : "text",
			success : function(data) {
				var result = data.split(",");
				if(result[0] != '0' && data != ''){
					alert("즐겨찾기가 등록 되었습니다.")
					$(".fa-bookmark-o").hide();
					$(".fa-bookmark").show();
					//$("#bookmarkBtn").removeAttr("href");
					$("#bookmarkBtn").attr("href", "javascript:deleteBookMark('"+planner_no+"', '"+checkBookMark+"')");
					$(".plan-detail-view-bookmark-count").text(" " + result[1]);
				}
			},
			error : function() {
				alert("즐겨찾기가 등록되지 않았습니다.")
			}
		})
}

function deleteBookMark(planner_no, checkBookMark){
	if(checkBookMark == '-1'){
		alert("로그인해주세요");
		return;
	}
	
	var params = "planner_no="+planner_no;
	var url = "/user/bookMark/deleteBookMark.ajax?" + params;
		$.ajax({
			url : url,
			type : "GET",
			dataType : "text",
			success : function(data) {
				var result = data.split(",");
				if(result[0] != '0' && data != ''){
					alert("즐겨찾기가 삭제 되었습니다.")
					$(".fa-bookmark").hide();
					$(".fa-bookmark-o").show();
					$("#bookmarkBtn").attr("href", "javascript:insertBookMark('"+planner_no+"', '"+checkBookMark+"')");
					$(".plan-detail-view-bookmark-count").text(" " + result[1]);
				}
			},
			error : function() {
				alert("즐겨찾기가 삭제되지 않았습니다.")
			}
		})
}

function setPlanner(image, planner_no, checkSweet, checkBookMark, use_yn){
	if(image != null){
		$('.breadcrumbs-v1').css('background-image', 'url(/attatchFile/planner/'+image+')');
	}
	
	if(checkSweet < '1'){
		$("#likeBtn").attr("href", "javascript:insertSweet("+planner_no+", "+checkSweet+")");
		$(".fa-heart").hide();
	}
	else if(checkSweet == 2)
		$(".fa-heart").hide();
	else{
		$(".fa-heart-o").hide();
	}

	if(checkBookMark <= '0'){
		$("#bookmarkBtn").attr("href", "javascript:insertBookMark("+planner_no+", "+checkBookMark+")");
		$(".fa-bookmark").hide();
	}
	else if(checkBookMark == '2'){
		$(".fa-bookmark").hide();
	}
	else{
		$("#bookmarkBtn").attr("href", "javascript:deleteBookMark("+planner_no+", "+checkBookMark+")");
		$(".fa-bookmark-o").hide();
	}
	
	if(use_yn == 'Y0001')
		$('#planner_unlock').hide();
	else if(use_yn == 'Y0002')
		$('#planner_lock').hide();
}

function lockPlanner(planner_no, isLock){
	var params = "planner_no="+planner_no+"&isLock="+isLock;
	var url = "/user/planner/lockPlanner.ajax?" + params;
	alert(url);
	$.ajax({
		url : url,
		type : "GET",
		dataType : "text",
		success : function(data) {
			if(data != ''){
				var result = data.split(",");
				if(result[0] == '1' && result[1] == 'true'){
					$('#planner_unlock').show();
					$('#planner_lock').hide();
				}else if(result[0] == '1' && result[1] == 'false'){
					$('#planner_lock').show();
					$('#planner_unlock').hide();
				}else
					alert("글 상태 변경이 실패되었습니다.")
			}
		},
		error : function() {
			alert("글 상태 변경이 실패되었습니다.")
		}
	})
}

function deletePlanner(planner_no){
	var answer = confirm("정말로 삭제하시겠습니까?");
	if(answer == false)
		return;
	var url = "/user/planner/deletePlanner.do?planner_no="+planner_no;
	location.href = url;
}

function modifyPlanner(planner_no){
	var url = "/user/planner/updatePlanner.do?planner_no="+planner_no;
	location.href = url;
}

function spotReadPage(no) {
	var makeDiv ="<div id='showModal"+no+"'></div>";
	var requestURL="/user/spot/spotReadPage.do?spot_no="+no;
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