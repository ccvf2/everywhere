<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("회원가입이 완료 되었습니다.");
			location.href="/user/main/main.do";
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("회원가입이 완료되지 않았습니다.");
			location.href="/user/member/register.do";
		</script>
	</c:if>
</body>
</html>