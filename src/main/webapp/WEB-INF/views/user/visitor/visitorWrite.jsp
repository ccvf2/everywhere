<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록작성</title>
<c:import url="/WEB-INF/views/user/common/utilImport.jsp" />
</head>
<body>
	<div align="center">
		<c:if test="${count==0||currentPage==1}">
			<div class="panel panel-green margin-bottom-40" style="width:500px; height:250px;">
            	<div class="panel-heading" style="height:30px;" align="left">
                	<h3 class="panel-title">No.${visitorDto.visitor_no}</h3>
               	</div>
                <div class="panel-body">
                    <form class="margin-bottom-40" role="form" action="/user/visitor/visitorWrite.do" method="post" onsubmit="return visitorForm(this)">
						<div class="form-group" align="left">
							<a href="#">아이디:${mem_no}</a>
						</div>
						<div class="form-group">
							<textarea class="form-control" rows="5" cols="65" name="visitor_content" style="resize:none;"></textarea>
						</div>
						<div class="form-group" align="right">
							<input type="submit" class="btn-u btn-u-green" value="확인"/>
							<input type="reset"  class="btn-u btn-u-green" value="취소"/>
						</div>
					</form>
				</div>
        	</div>
		</c:if>
		<c:if test="${count>0}">
			<div class="panel panel-green margin-bottom-40" style="width:500px; height:250px;">
            	<div class="panel-heading" style="height:30px;" align="left">
                	<h3 class="panel-title">No.${visitorDto.visitor_no}</h3>
               	</div>
                <div class="panel-body">
                    <form class="margin-bottom-40" role="form" action="/user/visitor/visitorWrite.do" method="post" onsubmit="return visitorForm(this)">
						<div class="form-group" align="left">
							<a href="#">아이디:${mem_no}</a>
						</div>
						<div class="form-group">
							<textarea class="form-control" rows="5" cols="65" name="visitor_content" style="resize:none;"></textarea>
						</div>
						<div class="form-group" align="right">
							<input type="submit" class="btn-u btn-u-green" value="확인"/>
							<input type="reset"  class="btn-u btn-u-green" value="취소"/>
						</div>
					</form>
				</div>
        	</div>
			<c:forEach var="visitor" items="${visitorList}">
				<div class="panel panel-green margin-bottom-40" style="width:500px; height:250px;">
            		<div class="panel-heading" style="height:30px;" align="left">
                		<h3 class="panel-title">No.${visitorDto.visitor_no}</h3>
						<fmt:formatDate value="${visitor.visitor_write_date}" type="both"/>
						<span style="margin-left: 180px;"> 
							<a href="/user/visitor/visitorUpdate.do?visitor_no=${visitor.visitor_no}&pageNumber=${currentPage}">수정</a> 
							<a href="/user/visitor/visitorDelete.do?visitor_no=${visitor.visitor_no}&pageNumber=${currentPage}">삭제</a>
						</span>
                	</div>
				</div>
				
				<div class="form-group">
					${visitor.visitor_content}
				</div>
			</c:forEach>
		</c:if>
	</div>
	
	<div align="center">
		<c:if test="${count>0}">
			<c:set var="pageBlock" value="${3}"/>
       	</c:if>
       	<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
		<c:set var="startPage" value="${rs*pageBlock+1}"/>
		<c:set var="endPage" value="${startPage+pageBlock-1}"/>
		
		<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
		
		<c:if test="${endPage>pageCount}">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
		
		<c:if test="${startPage>pageBlock}">
			<a href="/user/visitor/visitorWrite.do?pageNumber=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="/user/visitor/visitorWrite.do?pageNumber=${i}">[${i}]</a>
		</c:forEach>
		
		<c:if test="${endPage<pageCount}">
			<a href="/user/visitor/visitorWrite.do?pageNumber=${startPage+pageBlock}">[다음]</a>
		</c:if>
	</div>
</body>
</html>