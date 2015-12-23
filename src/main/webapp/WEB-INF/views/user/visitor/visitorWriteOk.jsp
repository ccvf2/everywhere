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
			location.href="/user/visitor/visitorWrite.do?uandMe=S0002&mem_no="+${memberDto.mem_no};
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			location.href="/user/visitor/visitorWrite.do?uandMe=S0002&mem_no="+${memberDto.mem_no};
		</script>
	</c:if>
</body>
</html>