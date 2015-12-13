<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<script src="/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">

	 function formSubmit(form) {
		 console.log(form);
		var send_mem_no=form.send_mem_no.value;
		var msg_group_no=form.msg_group_no.value;
		var recv_mem_no=form.recv_mem_no.value;
		var message=form.message.value;
			$.ajax({
				url:"/user/message/messageSend.ajax",
				type:"POST",
				data:{"send_mem_no":send_mem_no
					,"msg_group_no":msg_group_no
					,"recv_mem_no":recv_mem_no
					,"message":message
					},
				success:function(){alert("성공")},
				error:function(){alert("요청실패")}
			})

	}
</script>
</head>
<body>
	<table border="1">
	<c:forEach var="list" items="${parsonTalkList}">
		<tr>
			<td><c:out value="${list.msg_no}" /></td>
			<td><c:out value="${list.send_mem_no }" /></td>
			<td><c:out value="${list.msg_group_no}" /></td>
			<td><c:out value="${list.recv_mem_no}" /></td>
			<td><c:out value="${list.message}" /></td>
			<td><c:out value="${list.send_time}" /></td>
			<td>
			<c:choose>
				<c:when test="${list.recv_time == null}">
				읽지않음
				</c:when>
				<c:otherwise>
					<c:out value="${list.recv_time}" />
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
	</c:forEach>
	</table>
	
	
	
	<!-- 메세지 작성부분 -->
	<form name="sendMessage" id="sendMessage">
	+++++++++++++++++++++++++++++++++++++++<br/>
		보내는사람:<input type="text" name="send_mem_no" value="${param.recv_mem_no}"><br/>
		메세지함 그룹:<input type="text" name="msg_group_no" value="${param.msg_group_no}"><br/>
		받는사람:<input type="text" name="recv_mem_no" value="73"><br/>
		내용:<input type="text" name="message">
		<!-- <button name="" id="formSubmit" type="button" onclick="formSubmit('sendMessage')">전송</button> -->
		<a href="javascript:formSubmit(sendMessage)">전송</a>
	</form>
	
</body>
</html>