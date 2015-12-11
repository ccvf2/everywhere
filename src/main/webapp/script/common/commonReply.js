/**
 * 
 */
var viewIndex;
//사용될 게시판 고유 코드
var type_code;
var mem_no;
var defaultPhoto;
var item_no;

function commonReplyInit(type_code,mem_no,item_no,defaultPhotoPath){
	this.type_code=type_code;
	this.mem_no=mem_no;
	this.item_no=item_no;
	defaultPhotoPath=defaultPhotoPath.trim();
	this.defaultPhoto=defaultPhotoPath;
	if(this.defaultPhoto=="" || this.defaultPhoto==null || this.defaultPhoto==undefined){
		this.defaultPhoto="/assets/img/testimonials/user.jpg";
	}else{
		this.defaultPhoto=defaultPhotoPath;
	}

	//목록불러오기 함수요청
	requestList();
	//사용자작성화면요청
	showViewWrite()
}


//목록 불러오기 요청
function requestList() {
	var requestURL="/common/reply/replylist.ajax?type_code="+this.type_code+"&item_no="+this.item_no+"&mem_no="+this.mem_no;
	alert(requestURL);
	$(function() {
		$.ajax({
					url : requestURL,
					type : "GET",
					dataType : "text",
					success : getListSuccess,
					error : function() {
						alert("목록 가져오기 실패");
					}
				})
	})
}

//목록불러오기 성공시
function getListSuccess(jsonData, status, xhr) {
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
	this.viewIndex=index;
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
	$("#"+this.viewIndex).remove();
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
	$("#replyWriteForm").append("<label>Message</label>");
	$("#replyWriteForm").append("<div class='row margin-bottom-20' id='formWrap'></div>");
	$("#formWrap").append("<div class='col-md-11 col-md-offset-0' id='formWrapInner'></div>");
	$("#formWrapInner").append("<textarea class='form-control' rows='8'></textarea>");
	$("#replyWriteForm").append("<p><button class='btn-u' type='submit'>Send Message</button></p>");
}









