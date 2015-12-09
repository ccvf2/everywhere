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
	<script type="text/javascript">
		function deleteFunc(accompany_no){
			var deleteyn=confirm("정말로 삭제하시겠습니까?");
			if(deleteyn==true){
				location.href="/user/accompany/accompanyDelete.do?accompany_no="+accompany_no;
			}
		}
	</script>
    <!-- Bootstrap -->
    <link href="/script/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<label>제목</label>
  	${accompanyDto.title}
  	<br/>
  	<label>기간</label>
  	<fmt:formatDate pattern="MM-dd" value="${accompanyDto.start_date}"/>에서
  	<fmt:formatDate pattern="MM-dd" value="${accompanyDto.end_date}"/>까지
  	<br/>
  	
  	<label>구하는 성별</label>
  	<c:if test="${accompanyDto.gender_code==1}">
  		남자
  	</c:if>
  	<c:if test="${accompanyDto.gender_code==2}">
  		여자
  	</c:if>
  	<c:if test="${accompanyDto.gender_code==3}">
  		무관
  	</c:if><br/>
  	
  	<label>글쓴이</label>
  	${accompanyDto.mem_name}<br/>
  	<br/>
  	
  	<label>내용</label>
  	${accompanyDto.content}<br/><br/>
  	<button type="button" class="btn btn-default" onclick="location.href='/user/accompany/accompanyList.do?pageNumber=${currentPage}'">글목록</button>
  	
  	<!-- 글쓴이만 삭제 및 수정이 보이도록 -->
  	<c:if test="${ownerCheck>0}">
  		<button type="button" class="btn btn-warning" onclick="location.href='/user/accompany/accompanyUpdate.do'">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteFunc('${accompanyDto.accompany_no}')">글삭제</button>
  	</c:if>
  	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/script/common/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>