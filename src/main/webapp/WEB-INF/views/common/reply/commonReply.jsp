<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/script/common/commonReply.js"></script>
<script src="/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
/* 	commonReplyInit(type_code,mem_no,item_no,defaultPhotoPath); */
	commonReplyInit('A00001',64,282,"");
})
</script>
<script type="text/javascript">
/* var delStr=0;
//사용될 게시판 고유 코드
var type_code="A00001";
var mem_no=64;
var defaultPhoto="/assets/img/testimonials/user.jpg";
	function clickTo() {
		//글쓰기 화면 만들기
		showViewWrite()
		$(function() {
			$.ajax({
						url : "/common/reply/replylist.ajax?=&item_no=282&mem_no=63",
						type : "POST",
						data : {"type_code":type_code,"item_no":282,"mem_no":63},
						dataType : "text",
						success : replyList,
						error : function() {
							alert("목록 가져오기 실패");
						}
					})
		})
	}
	function replyList(jsonData, status, xhr) {
		var arr = new Array();
		arr = JSON.parse(jsonData);
		var arrSize=arr.length;
			$("#replyListArea").append("<h3 style='color:#72c02c'>Comments</h3>");
		for( var i=0 ;i<arrSize;i++ ){
			var item=arr[i];
			item.reply_no
			console.log(item);
			$("#replyListArea").append("<div class='media' id='"+i+"'></div>");
			
			var photoPath="";
			if(item.mem_profile_photo==""){
				photoPath=defaultPhoto;
			}else{
				photoPath=item.mem_profile_photo
			}
			
			$("#"+i).append("<a class='pull-left' href='#'><img class='media-object rounded-2x' src='"+photoPath+"' alt='' /></a>");
			$("#"+i).append("<div class='media-body' id='media-body"+i+"'></div>");
			$("#media-body"+i).append("<h4 class='media-heading' id='media-heading"+i+"'>"+item.reply_writer_name+"&nbsp;</h4>");
			$("#media-heading"+i).append("<span id='spanId"+i+"'>"+item.reply_write_date+" / </span>")
			var aTag="<a id='spId' href=\"javascript:replyDelete(\'"+ i +"\',\'"+item.reply_no+"\',\'"+item.item_no+"\',\'"+type_code+"\')\">삭제</a>";
			$("#spanId"+i).append(aTag);
			$("#"+i).append("<p id='replyContent'>"+item.reply_content+"</p><hr/>");
			
			$("#"+i).css("margin-top", "0px");
			//이미지싸이즈 조정
			$(".media-object").css("width", "54px");
			$(".media-object").css("height", "54px");
			
			
			$("#spanId"+i).css("float", "right");
			$("#spanId"+i).css("margin-right", "10px");
			
		}
	}
	
	
	//index:화면뷰를 삭제할 ID,
	//reply_no:댓글고유번호,
	//type_code:댓글이 있는 게시판고유코드,
	//item_no:댓글이 있는 게시판 글번호
	function replyDelete(index, reply_no, item_no, type_code) {
		delStr=index;
		$(function() {
			$.ajax({
						url : "/common/reply/replydelete.ajax",
						type : "POST",
						data : {"reply_no":reply_no,"item_no":item_no,"mem_no":mem_no,"type_code":type_code},
						dataType : "text",
						success : viewDelete,
						error : function() {
							alert("삭제 실패");
						}
					})
		})
	}
	
	function viewDelete(data) {
		if(data>0){
		alert("삭제 되었습니다.");
		$("#"+delStr).remove();
		}else{
			alert("자신의 글만 삭제 가능합니다.");
			return;
		}
	}
	
	
	
	
	
	//글쓰기 화면 구성
	function showViewWrite(){
		$("#replyWriteArea").addClass("post-comment");
		$("#replyWriteArea").append("<h3>Leave a Comment</h3>");
		$("#replyWriteArea").append("<form id='replyWriteForm' action=''></form>");
		
		$("#replyWriteForm").append("<label>Message</label>")
		$("#replyWriteForm").append("<div class='row margin-bottom-20' id='formWrap'></div>")
		$("#formWrap").append("<div class='col-md-11 col-md-offset-0' id='formWrapInner'></div>")
		$("#formWrapInner").append("<textarea class='form-control' rows='8'></textarea>")
		$("#replyWriteForm").append("<p><button class='btn-u' type='submit'>Send Message</button></p>")
	} */
</script>
</head>
<body>

<form action="">

</form>
		<div class="wrapper">
		    <!--=== Header ===-->
		    <div class="header">
				<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		    </div>
		    
		    <!--=== End Header ===-->
	
		<a href="javascript:clickTo()">눌러봐봐</a>
		<div id="replyArea" class="container">
			<div id="replywrap">
				<div id="replyListArea">
				
					<!-- <div class="media">
						<a class="pull-left" href="#"><img class="media-object" src="/assets/img/testimonials/img4.jpg" alt="" /></a>
						<div class="media-body">
							<h4 class="media-heading">
								게시 <span>July 5,2013 / <a href="#">삭제</a></span>
							</h4>
							<p id="replyContent"></p>
						</div>
					</div> -->
					<!--/media-->
					<!-- End Recent Comments -->
				</div>
				<div id="replyWriteArea">
				</div>
			</div>
		</div>
	</div>
</body>
</html>