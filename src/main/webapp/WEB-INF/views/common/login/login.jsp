<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
<form action="/user/login/login.do" name="memberLogin" method="post">
<label>아이디<input type="text" name="mem_email" value="admin@everywhere.com"></label>
<label>비밀번호<input type="text" name="mem_pwd" value="1234"></label>
<input type="submit" value="로그인">
</form>
</body>
</html>