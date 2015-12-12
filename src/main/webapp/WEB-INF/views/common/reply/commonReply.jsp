<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 공통댓글관련 함수  -->
<script type="text/javascript" src="/script/common/commonReply.js"></script>
<!-- 제이쿼리 라이브러리.(필수) : commonReplyInit() 함수호출 전 선언  -->
<script src="/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
//페이지가 로드될 때 실행.
$(document).ready(function() {
	
//type_code:댓글이 있는 게시판고유코드,
//mem_no: 회원고유번호
//index:화면뷰를 삭제할 ID,
//item_no:댓글이 있는 게시판 글번호
//defaultPhotoPath:기본으로 뿌릴 이미지 선택,
/* 	commonReplyInit(type_code,mem_no,item_no,defaultPhotoPath); */
	commonReplyInit('A00001',64,282,"");
})
</script>
</head>
<body>

		<div class="wrapper">
		    <!--=== Header ===-->
		    <!-- Header가 꼭 imprt 되어 있어야 한다.(안그러면화면이깨짐) -->
		    <div class="header">
				<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		    </div>
		    <!--=== End Header ===-->
	
		<!-- 댓글을 뿌릴 영역 START-->
		<div id="replyArea" class="container">
			<div id="replywrap">
				<div id="replyListArea">
				</div>
				<div id="replyWriteArea">
				</div>
			</div>
		</div>
		<!-- 댓글을 뿌릴 영역 END-->




		
	</div>
</body>
</html>