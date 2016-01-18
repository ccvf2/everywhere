<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
		alert("스케쥴이 수정되었습니다.");
		location.href="/user/planner/readPlanner.do?planner_no=${planner_no}";
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("글 수정을 실패하였습니다.");
			location.href="/user/planner/updatePlanner.do?planner_no=${planner_no}";
		</script>
	</c:if>
</body>
</html>