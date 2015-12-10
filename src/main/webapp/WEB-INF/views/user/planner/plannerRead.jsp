<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>

제목 : ${planner.title } <br/>
여행시작 날짜 : ${planner.start_date} <br/>
여행 끝 날짜 : ${planner.end_date } <br/>

여행 간단 설명 : ${planner.memo} <br/>
<input type="button" value="modify">
</body>
</html>