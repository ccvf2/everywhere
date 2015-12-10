<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록작성</title>
</head>
<body>
	<div align="center">
		<c:if test="${count==0||currentPage==1}">
			<form action="/user/visitor/visitorWrite.do" method="post" onsubmit="">
				<input type="hidden" name="mem_email" value="${memberDto.mem_email}"/>
				<div>
					<a href="#">아이디:${memberDto.mem_email}</a>
				</div>
				<div>
					<textarea rows="5" cols="65" name="visitor_content"></textarea>
				</div>
				<div>
					<input type="submit" value="확인"/>
					<input type="reset" value="취소"/>
				</div>
			</form>
		</c:if>
		<c:if test="${count>0}">
			<c:forEach var="visitor" items="${visitorList}">
				<div class="" style="border-width:1px; border-bottom:0px;">
					${visitor.mem_no}
					<fmt:formatDate value="${visitor.visotor_write_date}" type="both"/>
					<span style="margin-left: 180px;"> 
						<a href="/user/visitor/visitorUpdate.do?num=${visitor.visitor_no}&pageNumber=${currentPage}">수정</a> 
						<a href="javascript:deleteCheck('${visitor.visitor_no}','${currentPage}')">삭제</a>
					</span>
				</div>
				
				<div class="" style="border-width:1px; text-align:left;">
					${visitor.visitor_content}
				</div>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>