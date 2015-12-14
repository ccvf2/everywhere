<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" type="text/css" href="">
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript">
	var checked = false;
	function registerForm(form) {

		//alert("ok1");

		var check = false;
		var str = "";
		for (var i = 0; i < form.interestValue.length; i++) {
			if (form.interestValue[i].checked == true) {
				str += form.interestValue[i].value + ",";
				check = true;
			}

		}

		//alert(str);
		if (check == false) {
			alert("하나라도 체크하세요");
			form.interestValue[0].focus();
			return false;
		}

		form.mem_interest.value = str;
	}
</script>
</head>
<body>

	<div align="center" style="width: 498px;">
		<div align="left">
			<h4>회원정보수정</h4>
		</div>
		<form name="memberForm" action="/user/member/memberUpdate.do" method="post" onsubmit="return registerForm(this)">
			<input type="hidden" name="mem_no" value="${memberDto.mem_no}" />
			<div align="left">
				<label style="margin-right: 32px;">이메일</label> 
				<span> 
					<input type="text" value="${memberDto.mem_email}" disabled="disabled" /> 
					<input type="hidden" name="mem_email" size="20" value="${memberDto.mem_email}" />
				</span>
			</div>

			<div align="left">
				<label style="margin-right: 16px;">비밀번호</label> 
				<span> 
					<input type="password" name="mem_pwd" size="20" value="${memberDto.mem_pwd}" />
				</span>
			</div>

			<div align="left">
				<label style="margin-right: 48px;">이름</label> 
				<span> 
				<input type="text" value="${memberDto.mem_name}" size="20" disabled="disabled" /> 
				<input type="hidden" name="mem_name" value="${memberDto.mem_name}" />
				</span>
			</div>

			<div align="left">
				<label>핸드폰번호</label> 
				<span> 
					<input type="text" name="mem_phone" size="20" value="${memberDto.mem_phone}" /> 
					<input type="button" value="번호인증" onclick="">
				</span>
			</div>

			<div align="left">
				<label>관심분야</label> 
				<span> 
					<input type="checkbox" name="interestValue" value="혼자여행" /><font size="1">혼자여행 &nbsp;</font> 
					<input type="checkbox" name="interestValue" value="단체여행" /><font size="1">단체여행&nbsp;</font> 
					<input type="checkbox" name="interestValue" value="국내여행" /><font size="1">국내여행 &nbsp;</font> 
					<input type="checkbox" name="interestValue" value="해외여행" /><font size="1">해외여행 &nbsp;</font> 
					<input type="hidden" name="mem_interest" /> 
					<c:forTokens var="mem_interest" items="${memberDto.mem_interest}" delims=",">
						<script type="text/javascript">
							for (var i = 0; i < memberForm.interestValue.length; i++) {
								if (memberForm.interestValue[i].value == "${mem_interest}") {
									memberForm.interestValue[i].checked = true;
								}
							}
						</script>
					</c:forTokens>
				</span>
			</div>

			<div align="left">
				<a href="/user/member/memberDelete.do?mem_no=${mem_no}" style="margin-right:172px;">회원탈퇴</a> 
				<input type="submit" value="수정" /> 
				<input type="reset" value="취소" />
			</div>
		</form>
	</div>
</body>
</html>