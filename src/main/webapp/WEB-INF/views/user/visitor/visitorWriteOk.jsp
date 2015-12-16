<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록작성</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("방명록이 등록 되었습니다.");
			location.href="/user/visitor/visitorWrite.do?mem_no=10";
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("방명록이 등록되지 않았습니다. 다시 시도해주세요.");
			location.href="/user/visitor/visitorWrite.do?mem_no=10";
		</script>
	</c:if>
</body>
</html>