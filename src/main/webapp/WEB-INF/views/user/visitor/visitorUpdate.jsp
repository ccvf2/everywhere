<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
	<div align="center">
		<form action="/user/visitor/visitorUpdate.do" method="post" onsubmit="return visitorForm(this)">
		<input type="hidden" name="visitor_no" value="${visitorDto.visitor_no}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			<div class="title">
				<label>이름</label> 
				<input type="text" value="${visitorDto.visitor_no}" disabled="disabled"/> 
			</div>
		
			<div class="content">
				<textArea rows="5" cols="65" name="visitor_content">${visitorDto.content}</textArea>
			</div>
				
			<div class="title" style="text-align:right;">
				<input type="submit" value=확인> 
				<input type="reset" value=취소>
			</div>
		</form>
	</div>
</body>
</html>