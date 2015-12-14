<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="">
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("#email").keyup(function() {
			var email = $("#email").val();
			if (email.length >= 13) {
				$.ajax({
					url : "emailCheck.ajax?email=" + email,
					type : "get",
					dataType : "text",
					success : function(data) {
						//alert(data);
						if (data == 0) {
							$("#emailCheck").text("사용가능한 이메일입니다.");
						} else {
							$("#emailCheck").text("이미 사용중인 이메일입니다.");
						}
					},
					error : function(xhr, status, errorMsg) {
						alert(xhr + "," + status + "," + errorMsg);
					}
				});
			}
		});
	});
</script>
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
<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
</head>
<body>
	<button class="btn-u" data-toggle="modal" data-target="#responsive">회원가입</button>
	<div class="modal fade" id="responsive" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel4">이메일 주소로 회원가입</h3>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
						
								<form name="memberForm" action="/user/member/register.do" method="post" onsubmit="return registerForm(this)">
									<div align="left">
										<label style="float: left; margin-right: 38px;">이메일</label> 
										<span>
											<input type="text" class="form-control" name="mem_email" id="email" size="20" />
										</span>
										<div id="emailCheck"></div>
									</div>

									<div align="left" style="margin-right: 80px;">
										<h6>*로그인은 E-mail 주소로 합니다.</h6>
									</div>

									<div align="left">
										<label style="margin-right: 16px;">비밀번호</label> 
										<span>
											<input type="password" class="form-control" name="mem_pwd" size="20" />
										</span>
									</div>

									<div align="left">
										<label style="margin-right: 48px;">이름</label> 
										<span> 
											<input type="text" class="form-control" name="mem_name" size="20" />
										</span>
									</div>

									<div align="left">
										<label>핸드폰번호</label> 
										<span> 
											<input type="text" name="mem_phone" class="form-control" size="20" /> 
											<input type="button" value="번호인증" class="btn-u btn-u-primary" onclick="">
										</span>
									</div>

									<div align="left">
										<label>관심분야</label><br/>
										<span>
											<label><input type="checkbox" name="interestValue" value="혼자여행" />혼자여행</label>
											<label><input type="checkbox" name="interestValue" value="단체여행" />단체여행 </label>
											<label><input type="checkbox" name="interestValue" value="국내여행" />국내여행</label>
											<label><input type="checkbox" name="interestValue" value="해외여행" />해외여행 </label>
											<input type="hidden" name="mem_interest" />
										</span>
									</div>
									<hr />

									<div align="left">
										<label><input type="checkbox" name="" value="이용약관" />everywhere 이용 약관 동의(필수)</label><a href="" style="margin-left: 74px;">전문보기</a><br/> 
										<label><input type="checkbox" name="" value="개인정보" />개인 정보 수집 및 이용 동의(필수)</label><a href="" style="margin-left: 70px;">전문보기</a>
									</div>
								</form>
							
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div align="left">
						<h3>이미 아이디가 있습니까?</h3>
					</div>
					
					<div align="left">
						<a href="">로그인</a> 
						<input type="submit" value="회원가입" style="margin: 0px 0px 0px 480px;" class="btn-u btn-u-primary" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>