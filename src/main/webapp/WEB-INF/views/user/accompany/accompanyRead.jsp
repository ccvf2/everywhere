<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Bootstrap -->
    <link href="/script/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<script type="text/javascript" src="/script/common/commonReply.js"></script>
	<!-- 제이쿼리 라이브러리.(필수) : commonReplyInit() 함수호출 전 선언  -->
	<script src="/assets/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript">
		function deleteFunc(accompany_no){
			var deleteyn=confirm("정말로 삭제하시겠습니까?");
			if(deleteyn==true){
				location.href="/user/accompany/accompanyDelete.do?accompany_no="+accompany_no;
			}
		}
		$(document).ready(function() {
			
		//type_code:댓글이 있는 게시판고유코드,
		//mem_no: 회원고유번호
		//index:화면뷰를 삭제할 ID,
		//item_no:댓글이 있는 게시판 글번호
		//defaultPhotoPath:기본으로 뿌릴 이미지 선택,
		/* 	commonReplyInit(type_code,mem_no,item_no,defaultPhotoPath); */
			var accompany_no=${accompanyDto.accompany_no};
			commonReplyInit('S0010',64,accompany_no,"");
		});
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
	   
	   
	   <div class="breadcrumbs-v1">
        <div class="container">
            <span>사람들과 함께 더 재미있는 여행을 즐기세요</span>
            <h1>동행구하기 게시판</h1>
	        </div>
	    </div>
	   
	   
	   
	   
	   
	  	<label>조회수</label>
	  	${accompanyDto.hits}<br/><br/>
	  	<label>제목</label>
	  	${accompanyDto.title}
	  	<br/>
	  	<label>기간</label>
	  	<fmt:formatDate pattern="MM-dd" value="${accompanyDto.start_date}"/>에서
	  	<fmt:formatDate pattern="MM-dd" value="${accompanyDto.end_date}"/>까지
	  	<br/>
	  	
	  	<label>종류</label>
		<c:forEach var="postType" items="${postTypeList}">
			<c:if test="${accompanyDto.accompany_status_code==postType.code}">
				${postType.code_name}
			</c:if>
		</c:forEach>
		<br/>
	  		
	  	<label>구하는 성별</label>
	  	<c:forEach var="gender_code" items="${genderList}">
			<c:if test="${accompanyDto.gender_code==gender_code.code}">
	  			${gender_code.code_name}
	  		</c:if>
		</c:forEach>
	  	<br/>
	  	
	  	<label>글쓴이</label>
	  	${accompanyDto.mem_name}<br/>
	  	<br/>
	  	
	  	<label>내용</label>
	  	${accompanyDto.content}<br/><br/>
	  	<button type="button" class="btn btn-default" onclick="location.href='/user/accompany/accompanyList.do?pageNumber=${currentPage}'">글목록</button>
	  	<!-- 글쓴이만 삭제 및 수정이 보이도록 -->
	  	<c:if test="${ownerCheck>0}">
	  		<button type="button" class="btn btn-warning" onclick="location.href='/user/accompany/accompanyUpdate.do?accompany_no=${accompanyDto.accompany_no}&pageNumber=${currentPage}'">수정</button>
			<button type="button" class="btn btn-danger" onclick="deleteFunc('${accompanyDto.accompany_no}')">글삭제</button>
	  	</c:if>
	  	
	  	
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