<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
<c:if test="${alert_msg!=null}">
<script type="text/javascript">
alert('${alert_msg}');
location.href='${return_url}';
</script>
</c:if>
</body>
</html>