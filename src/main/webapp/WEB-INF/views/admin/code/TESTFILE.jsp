<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
<form action="/test/test.do" method="post" enctype="multipart/form-data">
	<input name="file" type="file" >
	crud:<input name="crud" type="text" >
	savePath:<input name="savePath" type="text" >
	fileName:<input name="fileName" type="text" >
	<input type="submit" value="전송"> 
</form>
</body>
</html>