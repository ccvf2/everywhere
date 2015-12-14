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
    <title>동행구하기 게시판</title>

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
   
	<!-- 게시글이 없을 경우 -->
	<c:if test="${count == 0}">
		<h2>게시판에 저장된 글이 없습니다.</h2>
	</c:if>
	<!-- 게시글이 있을 경우 -->
	<c:if test="${count > 0 }">
		<table class="table">
			<tr>
				<td width="50">번호</td>
				<td width="80">종류</td>
				<td width="300">제목</td>
				<td width="120">글쓴이</td>
				<td width="100">날짜</td>
				<td width="60">조회</td>			
			</tr>
			<c:forEach var="accompanyDto" items="${accompanyList}">
				<tr>
					<td>${accompanyDto.accompany_no}</td>
					<!-- 게시글 종류  -->
					<td>
						<c:forEach var="postType" items="${postTypeList}">
							<c:if test="${accompanyDto.accompany_status_code==postType.code}">
								<a href="#">${postType.code_name}</a>
							</c:if>
						</c:forEach>
					</td>
					<td><a href ="/user/accompany/accompanyRead.do?accompany_no=${accompanyDto.accompany_no}&currentPage=${currentPage}">${accompanyDto.title} ${accompanyDto.reply_count}</a></td>
					<td>${accompanyDto.mem_name}</td>
					<td><fmt:formatDate pattern="MM-dd" value="${accompanyDto.write_date}"/></td>
					<td>${accompanyDto.hits}</td>
				</tr>
		   </c:forEach>
		</table>
	</c:if>
	
	<c:if test="${count>0 }">
		<div class="btn-group" role="group" aria-label="First group">
			<c:set var="pageBlock" value="${5}" />
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1)}"/>
				
			<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
			
			<c:set var="startPage" value="${result*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<!-- 마지막 페이지가 페이지 수보다 작으면 -->
			<c:if test="${endPage > pageCount }">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>
			
			<!-- 페이징 -->
			<nav>
			  <ul class="pagination">
			  	<c:if test="${startPage > pageBlock}">
				  	<a href="/user/accompany/accompanyList.do?pageNumber=${currentPage-pageBlock}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
			     	</a>
				</c:if>
			    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					 <c:if test="${i!=currentPage}">
					 	<li><a href="/user/accompany/accompanyList.do?pageNumber=${i}" role="button" class="btn btn-default">${i}</a></li>
					 </c:if>
					 <c:if test="${i==currentPage}">
					 	<li class="active"><a href="/user/accompany/accompanyList.do?pageNumber=${i}" role="button" class="btn btn-default">${i}</a></li>
					 </c:if>
				</c:forEach>
				
		  		<c:if test="${endPage < pageCount }">
		  			<li>
				      <a href="/user/accompany/accompanyList.do?pageNumber=${currentPage+pageBlock}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				</c:if>
			  </ul>
			</nav>
		</div>
	</c:if>
	
	<button type="button" class="btn btn-primary" onclick="location.href='/user/accompany/accompanyWrite.do'">글쓰기</button>
	
	<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/script/common/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>