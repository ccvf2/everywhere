<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
<c:if test="${errorMsg != null}">
	<script type="text/javascript">
		var str='${errorMsg}';
		alert(str);
	</script>
</c:if>


	<form action="/admin/commoncode/code.do" method="post">
	<input type="hidden" name="code_CRUD" value="C">
	<input type="hidden" name="code_no" value="0">
		<table>
			<tr>
				<th>고유코드</th>
				<td>
					<input type="text" name="code" maxlength="5" id="code" />
				</td>
				<th>코드명</th>
				<td>
					<input type="text" name="code_name" maxlength="30" id="code_name" />
				</td>
				<th>코드그룹</th>
				<td>
					<input type="text" name="code_group" maxlength="5" id="code_group" />
				</td>
				<th>코드그룹명</th>
				<td>
					<input type="text" name="code_group_name" maxlength="30" id="code_group_name" />
				</td>
			</tr>
		</table>
		<input type="submit" value="전송">
	</form>
	
	
	
	
	<!-- 코드목록 -->
	<table>
		<tr>
			<th>seq</th>
			<th>고유코드</th>
			<th>코드명</th>
			<th>코드그룹</th>
			<th>코드그룹명</th>
		</tr>
		<c:forEach var="list" items="${codeList}">
		<tr>
			<td><c:out value="${list.code_no}"/></td>
			<td><c:out value="${list.code}"/></td>
			<td><c:out value="${list.code_name}"/></td>
			<td><c:out value="${list.code_group}"/></td>
			<td><c:out value="${list.code_group_name}"/></td>
		</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html>