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
	alert(url);
		$.ajax({
			url : url,
			type : "GET",
			dataType : "text",
			success : function(data) {
				if(data != '0' && data != ''){
					alert("추천되었습니다.")
					$(".fa-heart-o").hide();
					$(".fa-heart").show();
					$("#likeBtn").removeAttr("href");
					$(".plan-detail-view-bookmark-count").Text(data);
				}
			},
			error : function() {
				alert("추천되지 않았습니다.")
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

	if(checkBookMark == '0'){
		$("#bookmarkBtn").attr("href", "javascript:insertSweet('${mem_object.mem_no}', '${plannerDto.planner_no}')");
		$(".fa-bookmark").hide();
	}
	else{
		$(".fa-bookmark-o").hide();
	}
}