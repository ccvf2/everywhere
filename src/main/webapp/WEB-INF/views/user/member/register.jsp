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
			if (email.length >= 9) {
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
			<form name="memberForm" id="sky-form4" class="sky-form" action="/user/member/register.do" method="post" onsubmit="return registerForm(this)">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel4">이메일 주소로 회원가입</h3>
				</div>
				
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-2">
							<fieldset>
								<section>
	                            	<label class="input">
	                                	<i class="icon-append fa fa-envelope"></i>
	                                	<input type="email" name="mem_email" id="email" placeholder="Email address">
	                                	<b class="tooltip tooltip-bottom-right">사용하실 이메일(계정)을 입력해주세요.</b>
	                            	</label>
	                               		<div id="emailCheck"></div>
                                </section>
	
								<div>
									<h6>*로그인은 E-mail 주소로 합니다.</h6>
								</div>
									
								<section>
	                            	<label class="input" style="margin-left:5px;">
	                                	<i class="icon-append fa fa-lock"></i>
	                                   	<input type="password" name="mem_pwd" placeholder="Password" id="password">
	                                    <b class="tooltip tooltip-bottom-right">사용하실 비밀번호를 입력해주세요.</b>
	                                </label>
	                            </section>
									
								<section>
	                            	<label class="input" style="margin-left:3px;">
	                                	<i class="icon-append fa fa-user"></i>
	                                    <input type="text" name="mem_name" placeholder="Username">
	                                    <b class="tooltip tooltip-bottom-right">회원님의 이름을 입력해주세요.</b>
	                                </label>
	                            </section>
									
								<section>
	                            	<label class="input" style="margin-left:3px;">
	                                	<i class="icon-append fa fa-phone"></i>
	                                    <input type="text" name="mem_phone" placeholder="Phonenumber">
	                                    <button type="button" class="btn-u">번호인증</button>
	                                    <b class="tooltip tooltip-bottom-right">회원님의 전화번호를 입력해주세요.</b>
	                                </label>
	                            </section>
	
								<section>
									<label>관심분야</label><br/>
									<span>
										<label style="float:left"><input type="checkbox" name="interestValue" value="혼자여행" />혼자여행</label>
										<label style="float:left"><input type="checkbox" name="interestValue" value="단체여행" />단체여행 </label>
										<label style="float:left"><input type="checkbox" name="interestValue" value="국내여행" />국내여행</label>
										<label><input type="checkbox" name="interestValue" value="해외여행" />해외여행 </label>
										<input type="hidden" name="mem_interest" />
									</span>
								</section>
								<br/><br/>
	
								<section>
									<label><input type="checkbox" name="subsciption" value="이용약관" />everywhere 이용 약관 동의 (필수)</label><br/>
									<label><input type="checkbox" name="terms" value="개인정보" />개인 정보 수집 및 이용 동의 (필수)</label>
								</section>
							</fieldset>
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<div align="left">
						<h3>이미 아이디가 있습니까?</h3>
					</div>
					
					<div align="right">
						<a href="" style="margin-left:150px;">로그인</a> 
						<button type="submit" class="btn-u">회원가입</button>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>