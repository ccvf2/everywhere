<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("회원정보가 수정 되었습니다.");
			location.href="/user/member/memberRead.do?mem_no=64";
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("회원정보가 수정되지 않았습니다.");
			location.href="/user/member/memberUpdate.do";
		</script>
	</c:if>
</body>
</html>