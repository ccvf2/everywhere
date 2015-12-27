//viewIndex:화면뷰를 삭제할 ID,
var viewIndex;

//type_code:댓글이 있는 게시판고유코드,
var type_code;

//mem_no:회원고유번호,
var mem_no;

//defaultPhoto:화면에 뿌릴 기본 이미지 선택,
var defaultPhoto;

//item_no:댓글이 있는 게시판 글번호
var item_no;


// 댓글부분 초기화 매소드
function commonReplyInit(type_code,mem_no,item_no,defaultPhotoPath){
	this.type_code=type_code;
	this.mem_no=mem_no;
	this.item_no=item_no;
	defaultPhotoPath=defaultPhotoPath;
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


//목록 불러오기 AJAX요청
function requestList() {
	var requestURL="/common/reply/replylist.ajax?type_code="+this.type_code+"&item_no="+this.item_no+"&mem_no="+this.mem_no;
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
			photoPath="/attatchFile/member/"+item.mem_profile_photo
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
		
		/*
		$("#spanId"+i).css("float", "right");
		$("#spanId"+i).css("margin-right", "10px");*/
		
	}
}





/*댓글삭제 AJAX요청 */
//index:화면뷰를 삭제할 ID,
//reply_no:댓글고유번호,
//type_code:댓글이 있는 게시판고유코드,
//item_no:댓글이 있는 게시판 글번호
function replyDelete(index, reply_no, item_no, type_code) {
	this.viewIndex=index;
	if(confirm("정말로 삭제 하시겠습니까?")){
		$(function() {
			$.ajax({
				url : "/common/reply/replydelete.ajax",
				type : "POST",
				data : {"reply_no":reply_no,"item_no":item_no,"mem_no":mem_no,"type_code":type_code},
				dataType : "text",
				success : function(data){
					if(data>0){
						alert("삭제 되었습니다.");
						$("#"+index).remove();
					}else{
						alert("자신의 글만 삭제 가능합니다.");
						return;
					}
				},
				error : function() {
					alert("삭제 실패");
				}
			})
		})
	}
}



	


//글쓰기 화면 구성
function showViewWrite(){
	$("#replyWriteArea").addClass("post-comment");
	$("#replyWriteArea").append("<h3>Leave a Comment</h3>");
	$("#replyWriteArea").append("<form id='replyWriteForm'  method='post' name='replyWrite' onsubmit=\"return doReplyWrite(replyWrite)\"></form>");
	$("#replyWriteForm").append("<input type='hidden' name='mem_no' value='"+this.mem_no+"'/>");
	$("#replyWriteForm").append("<input type='hidden' name='type_code' value='"+this.type_code+"'/>");
	$("#replyWriteForm").append("<input type='hidden' name='item_no' value='"+this.item_no+"'/>");
	$("#replyWriteForm").append("<input type='hidden' name='use_yn' value='Y'/>");
	$("#replyWriteForm").append("<label>Message</label>");
	$("#replyWriteForm").append("<div class='row margin-bottom-20' id='formWrap'></div>");
	$("#formWrap").append("<div class='col-md-11 col-md-offset-0' id='formWrapInner'></div>");
	$("#formWrapInner").append("<textarea class='form-control' rows='8' name='reply_content' style='margin:0 auto'></textarea>");
	$("#replyWriteForm").append("<p><button class='btn-u'>Send Message</button></p>");
}






function doReplyWrite(form){
	$(".btn-u").css("display", "none");
	var type_code=form.type_code.value;
	var mem_no=form.mem_no.value;
	var item_no=form.item_no.value;
	var use_yn="Y";
	var reply_content=form.reply_content.value;
	this.type_code=type_code;
	this.mem_no=mem_no;
	this.item_no=item_no;
	/*alert("typeCOde:"+type_code+"mem_no:"+mem_no+"user_yn:"+use_yn+"reply_content:"+reply_content);*/
		$(function() {
			$.ajax({
					url : "/common/reply/replyWrite.ajax",
					type : "POST",
					data : {"item_no":item_no, "mem_no":mem_no, "type_code":type_code, "reply_content":reply_content},
					dataType : "text",
					success : function(){
						$("#replyListArea").remove();
						$("#replyWriteArea").remove();
						$("#replywrap").append("<div id='replyListArea'></div>");
						$("#replywrap").append("<div id='replyWriteArea'></div>");
						commonReplyInit(type_code,mem_no,item_no,"");
					},
					error : function() {
						alert("등록 실패");
					}
				})
		})
	return false;
}
