<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
	<c:if test="${result>0}">
		<script type="text/javascript">
		alert("명소가 수정 되었습니다.");
		location.href="";
		</script>
	</c:if>
	<c:if test="${result==0}">
		<script type="text/javascript">
			alert("명소 수정이 실패하였습니다.");
			location.href="/user/spot/spotUpdate.do?spot_no=${spot_no}";
		</script>
	</c:if>
</body>
</html>