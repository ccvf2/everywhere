<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<script type="text/javascript">
	function replyUpdate(){
		alert("a");	
	}
	
	function replyDelete(){
		alert("b");	
	}
</script>
</head>
<body>
	<div id="replyArea">
		<div id="replyWriteArea">
			<input type="text" name="reply_list" maxlength="1000"/>
		</div>
		<div id="replyListArea">
			<table id="replyListTable">
				<colgroup>
					<col></col>
					<col></col>
					<col></col>
					<col></col>
				</colgroup>
				<tr>
					<th>이름</th>
					<th>내용</th>
					<th>날짜</th>
					<th>수정삭제</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<input type="button" value="수정" onclick="replyUpdate()"/>
						<input type="button" value="삭제" onclick="replyDelete()"/>
					</td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>