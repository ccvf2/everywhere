<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
	여행제목 : ${plannerDto.title }
<form action="/user/planner/updatePlannerOk.do" method="post">
	<input type="submit" value="저장">
	<input type="button" value="취소">
	
	<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
	<textarea rows="4" cols="50"></textarea>
</form>
</body>
</html>