<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<%-- <c:set var="root" value="http://${pageContext.request.serverName}:${pageContext.request.localPort}"/>
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script> --%>
<script type="text/javascript">
	function codeSelect(code_no,code_name,code_group,code_group_name,code_value){
		/* $("#code").val(code_no); */
	}
</script>
</head>
<body>
<c:if test="${errorMsg != null}">
	<script type="text/javascript">
		var str='${errorMsg}';
		alert(str);
	</script>
</c:if>


<%-- root:${root} --%>
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
				<th>코드밸류</th>
				<td>
					<input type="text" name="code_value" maxlength="30" id="code_value" />
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
			<th>코드밸류</th>
			<th>코드등록일</th>
		</tr>
		<c:forEach var="list" items="${codeList}">
		<tr>
			<td>
				<a href="javascript:codeSelect('${list.code_no}','${list.code_name}','${list.code_group}','${list.code_group_name}','${list.code_value}')">
					<c:out value="${list.code_no}"/>
				</a>
			</td>
			<td><c:out value="${list.code}"/></td>
			<td><c:out value="${list.code_name}"/></td>
			<td><c:out value="${list.code_group}"/></td>
			<td><c:out value="${list.code_group_name}"/></td>
			<td><c:out value="${list.code_value}"/></td>
			<td><c:out value="${list.code_regdate}"/></td>
		</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html>