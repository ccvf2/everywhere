<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript">
	//코드 수정하기.
	function codeSelect(code_no,code,code_name,code_group,code_group_name,code_value){
		$(function() {
		 	$("#code_no").val(code_no);
		 	$("#code").val(code);
		 	$("#code_name").val(code_name);
		 	$("#code_group").val(code_group);
		 	$("#code_group_name").val(code_group_name);
		 	$("#code_value").val(code_value);
		})
	}
	
	
	//화면에서 폼전송 버튼을 눌럿을 때
	function insertCcodeFormSubmin(){
		$("#code_CRUD").val("C"); 
		$("#codeForm").submit(); 
	}
	
	//화면에서 폼전송 버튼을 눌럿을 때
	function updateCcodeFormSubmin(){
		$("#code_CRUD").val("U"); 
		$("#codeForm").submit(); 
	}
	function deleteCodeFormSubmin(){
		$("#code_CRUD").val("d"); 
		$("#codeForm").submit(); 
	}
	
	
	
	//코드셀렉터
	function selectCode(searchConditionList){
		
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

size:${searchConditionList.size()}
<%-- root:${root} --%>
	<form action="/admin/commoncode/code.do" method="post" id="codeForm">
	<input type="hidden" name="code_CRUD" id="code_CRUD" value="C">
	<input type="hidden" name="code_no" id="code_no" value="0">
		<table border="1">
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
					<input type="text" name="code_group" maxlength="10" id="code_group" />
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
		<input type="button" value="수정" onclick="updateCcodeFormSubmin()">
		<input type="button" value="삭제" onclick="deleteCodeFormSubmin()">
		<input type="button" value="등록" onclick="insertCcodeFormSubmin()">
	</form>
	
	<!-- 코드 셀렉터 -->
	<select>
		<c:forEach items="${searchConditionList}" var="codeGroupList">
			<option value="${codeGroupList.code_group}" onchange="selectCode('${codeGroupList.code_group}')">${codeGroupList.code_group_name}(${codeGroupList.code_group})</option>
		</c:forEach>
	</select>
	
	
	<!-- 코드목록 -->
	<table border="1">
		<tr>
			<th>코드(code_no)</th>
			<th>고유코드(code)</th>
			<th>코드명(code_name)</th>
			<th>코드그룹(code_group)</th>
			<th>코드그룹명(code_group_name)</th>
			<th>코드밸류(code_value)</th>
			<th>코드등록일(code_regdate)</th>
			<th>코드정렬값(code_sort)</th>
		</tr>
		<c:forEach var="list" items="${codeList}">
		<tr>
			<td>
				<a href="javascript:codeSelect('${list.code_no}','${list.code}','${list.code_name}','${list.code_group}','${list.code_group_name}','${list.code_value}')">
					<c:out value="${list.code_no}"/>
				</a>
			</td>
			<td><c:out value="${list.code}"/></td>
			<td><c:out value="${list.code_name}"/></td>
			<td><c:out value="${list.code_group}"/></td>
			<td><c:out value="${list.code_group_name}"/></td>
			<td><c:out value="${list.code_value}"/></td>
			<td><c:out value="${list.code_regdate}"/></td>
			<td><c:out value="${list.code_sort}"/></td>
		</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html>