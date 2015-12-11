<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록수정</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("방명록이 수정 되었습니다.");
			location.href="/user/visitor/visitorWrite.do?mem_no=64";
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("방명록이 수정되지 않았습니다. 다시 시도해주세요.");
			location.href="/user/visitor/visitorWrite.do?mem_no=64";
		</script>
	</c:if>
</body>
</html>