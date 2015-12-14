<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보보기</title>
</head>
<body>
	<div align="center">
		<font size="2"><b>회원정보보기</b></font>
	</div>

	<div align="center">
		<form class="form_style" name="memberForm" action="/user/member/memberUpdate.do?mem_no=${mem_no}" method="post" onsubmit="return registerForm(this)">
		
			<div class="line">
				<label class="title">이메일</label>
				<span class="content">
					<input type="text" name="mem_email" id="email" value="${memberDto.mem_email}" disabled="disabled"/>
				</span>
			</div>
			
			<div class="line">
				<label  class="title">비밀번호</label>
				<span class="content">
					<input type="password" name="mem_pwd" value="${memberDto.mem_pwd}" disabled="disabled"/>
				</span>
			</div>
	
			<div class="line">
				<label class="title">이름</label>
				<span class="content">
					<input type="text" name="mem_name" value="${memberDto.mem_name}" disabled="disabled"/>
				</span>
			</div>
		
			<div class="line">
				<label class="title">핸드폰번호</label>
				<span class="content">
					<input type="text" name="mem_phone" size="11" value="${memberDto.mem_phone}" disabled="disabled"/>
				</span>
			</div>
	
			<div class="line">
				<label class="title">관심분야</label>
				<span class="content">
					<input type="checkbox" name="interestValue" value="혼자여행"/> 혼자여행 &nbsp;
					<input type="checkbox" name="interestValue" value="단체여행"/> 단체여행 &nbsp;
					<input type="checkbox" name="interestValue" value="국내여행"/> 국내여행 &nbsp;
					<input type="checkbox" name="interestValue" value="해외여행"/> 해외여행 &nbsp;
					<input type="hidden" name="mem_interest" value="${memberDto.mem_interest}"/>
					
					<c:forTokens var="mem_interest" items="${memberDto.mem_interest}" delims=",">
						<script type="text/javascript">
							for(var i=0;i<memberForm.interestValue.length;i++) {
								if(memberForm.interestValue[i].value=="${mem_interest}") {
									memberForm.interestValue[i].checked=true;
								}
							}
						</script>
					</c:forTokens>
				</span>
			</div>
			
			<div class="line" style="width:498px; border-width:2px; text-align:center;">
				<input type="submit" value="수정" />
			</div>
		</form>
	</div>
</body>
</html>