<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<!-- <script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script> -->
<%-- <jsp:include page="/common/commonImport.jsp"/> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> 
<script type="text/javascript">
function clickTo(){
$(function() {
	$.ajax({
		url:"/common/code/codelist.ajax?code_group=T0001",
		type:"get",
		dataType:"text",
		success:replyUpdate
	})
})
}



  	function replyUpdate(jsonData){
  		//var inr = JSON.parse(jsonData);
 		//var str=JSON.parse(jsonData);
		console.log(jsonData);	
	}



	
	function replyDelete(){
		alert("b");	
	}
</script>
</head>
<body>
	<div id="replyArea">
		<div id="replywrap">
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
	</div>
<a href="javascript:clickTo()">눌러봐봐</a>
</body>
</html>