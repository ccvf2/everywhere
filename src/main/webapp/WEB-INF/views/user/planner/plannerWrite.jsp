<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
	<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
  	<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${plannerDto.end_date}"/>
	
	<form action="/user/planner/updatePlanner.do" name="plannerForm"  method="post">
		<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
		여행제목 : <input type="text" name="title" value="${plannerDto.title }"> <br/>	
		여행시작날짜 : <input type="date" class="form-control" name="start_date" value="${start_date}"> 
		여행끝 : <input type="date" class="form-control" name="end_date" value="${end_date }">				
		여행 설명 : <textarea rows="4" cols="50" name="memo">${plannerDto.memo}</textarea>
		<input type="radio" name="use_yn" value="Y">공개
		<input type="radio" name="use_yn" value="N">비공개
		<script type="text/javascript">
			for(var i=0;i<plannerForm.use_yn.length;i++){
				if(plannerForm.use_yn[i].value =="${plannerDto.use_yn}"){
					plannerForm.use_yn[i].checked=true;
				}
			}
		</script>
		
		<br/>
		<input type="submit" value="저장">
		<input type="button" value="취소">
	</form>
</body>
</html>