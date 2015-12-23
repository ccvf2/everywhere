/**
 * 
 */

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

function setBackground(image, planner_no, checkSweet, checkBookMark){
	if(image != null){
		$('.breadcrumbs-v1').css('background-image', 'url(/attatchFile/planner/'+image+')');
	}
	
	if(checkSweet <= '0'){
		$("#likeBtn").attr("href", "javascript:insertSweet('"+planner_no+"', '"+checkSweet+"')");
		$(".fa-heart").hide();
	}
	else{
		$(".fa-heart-o").hide();
	}

	if(checkBookMark <= '0'){
		$("#bookmarkBtn").attr("href", "javascript:insertBookMark('"+planner_no+"', '"+checkBookMark+"')");
		$(".fa-bookmark").hide();
	}
	else{
		$("#bookmarkBtn").attr("href", "javascript:deleteBookMark('"+planner_no+"', '"+checkBookMark+"')");
		$(".fa-bookmark-o").hide();
	}
}

function deletePlanner(planner_no){
	var url = "/user/planner/deletePlanner.do?planner_no="+planner_no;
}