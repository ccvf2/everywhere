<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제</title>
</head>
<body>
	<form action="/user/member/memberDelete.do" method="post">
		<input type="hidden" name="mem_no" value="${memberDto.mem_no}"/>
		<input type="hidden" name="mem_email" value="${memberDto.mem_email}"/>
		<div align="center">
			<table>
				<tr>
					<td>회원ID</td>
					<td><input type="text" value="${memberDto.mem_email}" disabled="disabled"/></td>
				</tr>
				
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="mem_pwd"/></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원탈퇴"/>
						<input type="reset" value="취소"/>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>