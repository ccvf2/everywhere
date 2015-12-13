<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
${param.mem_no}<br>
메시지박스<br/>
<table border="1">
	<tr>
		<th>메세지고유번호</th>
		<th>보낸사람고유번호</th>
		<th>보낸사람이름</th>
		<th>받사람고유번호</th>
		<th>받은사람이름</th>
		<th>메세지그룹번호</th>
		<th>메세지내용</th>
		<th>보낸시간</th>
		<th>받은시간</th>
		<th>안읽은메세지</th>
		<!-- <th>보낸사람 삭제여부</th>
		<th>받은사람 삭제여부</th> -->
	</tr>
<c:forEach var="list" items="${messageBoxList}">
	<tr>
		<td>
			<a href="/user/message/messageTalkList.do?recv_mem_no=${param.mem_no}&msg_group_no=${list.msg_group_no}">
			${list.msg_no}
			</a>
		</td>
		<td>${list.send_mem_no}</td>
		<td>${list.send_mem_name}</td>
		<td>${list.recv_mem_no}</td>
		<td>${list.recv_mem_name}</td>
		<td>${list.msg_group_no}</td>
		<td>${list.message}</td>
		<td>${list.send_time}</td>
		<td>${list.recv_time}</td>
		<td>${list.unreadCount}</td>
		<%-- <td>${list.send_remove_time}</td>
		<td>${list.recv_remove_time}</td> --%>
	</tr>
</c:forEach>
</table>
</body>
</html>