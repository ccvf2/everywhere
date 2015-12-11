<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 확인</title>
</head>
<body>
<c:if test="${check>0}">
	<script type="text/javascript">
		location.href="/user/accompany/accompanyRead.do?currentPage="+${currentPage}+"&accompany_no="+${accompanyDto.accompany_no};
	</script>
</c:if>
<c:if test="${check==0}">
	<script type="text/javascript">
		alert("글을 수정하는 도중에 에러가 발생하였습니다.");
		location.href="/user/accompany/accompanyRead.do?currentPage="+${currentPage}+"&accompany_no="+${accompanyDto.accompany_no};
	</script>
</c:if>
</body>
</html>