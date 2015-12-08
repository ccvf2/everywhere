<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="">
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(function() {	
		$("#email").keyup(function(){
			var email=$("#email").val();
			if(email.length>=13) {
				$.ajax({
					url:"emailCheck.ajax?email="+email,
					type:"get",
					dataType:"text",
					success:function(data){
						//alert(data);
						if(data==0) {
							$("#emailCheck").text("사용가능한 이메일입니다.");
						} else {
							$("#emailCheck").text("이미 사용중인 이메일입니다.");
						}
					},
					error:function(xhr, status, errorMsg){
						alert(xhr+","+status+","+errorMsg);
					}
				});
			}
		});
	});
</script>
<script type="text/javascript">
	var checked=false;
	function registerForm(form) {
		
		 //alert("ok1");
		
		var check=false;
		var str="";
		for(var i=0; i<form.interestValue.length;i++) {
			if(form.interestValue[i].checked==true) {
				str += form.interestValue[i].value + ",";
				check=true;
			}
			
		}
		
		 //alert(str);
		if(check==false) {
			alert("하나라도 체크하세요");
			form.interestValue[0].focus();
			return false;
		}
		
		form.mem_interest.value=str;
		
		//return false;
	}
</script>
</head>
<body>
	<div align="center">
		<font size="2"><b>회원가입</b></font>
	</div>

	<div align="center">
		<form class="form_style" name="memberForm" action="/user/member/register.do" 
			method="post" onsubmit="return registerForm(this)">
			<div class="line">
				<label class="title">이메일</label>
				<span class="content">
					<input type="text" name="mem_email" id="email"/>
				</span>
				<div id="emailCheck"></div>
			</div>
			
			<div class="line">
				<label  class="title">비밀번호</label>
				<span class="content">
					<input type="password" name="mem_pwd" />
				</span>
			</div>
	
			<div class="line">
				<label class="title">이름</label>
				<span class="content">
					<input type="text" name="mem_name"/>
				</span>
			</div>
		
			<div class="line">
				<label class="title">핸드폰번호</label>
				<span class="content">
					<select>
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>
					<input type="text" name="mem_phone" size="10" />
					<input type="button" value="번호인증하기" onclick="">
				</span>
			</div>
	
			<div class="line">
				<label class="title">관심분야</label>
				<span class="content">
					<input type="checkbox" name="interestValue" value="혼자여행"/> 혼자여행 &nbsp;
					<input type="checkbox" name="interestValue" value="단체여행"/> 단체여행 &nbsp;
					<input type="checkbox" name="interestValue" value="국내여행"/> 국내여행 &nbsp;
					<input type="checkbox" name="interestValue" value="해외여행"/> 해외여행 &nbsp;
					<input type="hidden" name="mem_interest"/>
				</span>
			</div>
			
			<div class="line" style="width:498px; border-width:2px; text-align:center;">
				<input type="submit" value="가입" />
				<input type="reset" value="취소" />
			</div>
		</form>
	</div>
</body>
</html>