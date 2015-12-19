<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
</head>
	<!-- 로그인 페이지 모달 -->
	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<form class="reg-page" action="/user/login/login.do" name="memberLogin" method="post">
					<div class="reg-header">
						<h2>Login to your account</h2>
					</div>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
							<input type="text" name="mem_email" placeholder="Email address" class="form-control" value="admin@everwhere.com">
						</div>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" name="mem_pwd" placeholder="Password" class="form-control" value="1234567890">
						</div>
						<div class="row">
							<div class="col-md-6 checkbox">
								<label><input type="checkbox">로그인 상태 유지</label>
							</div>
							<div class="col-md-6">
								<button class="btn-u pull-right" type="submit">로그인</button>
							</div>
						</div>
					<hr>
						<h4>비밀번호를 잊어버리셨나요?</h4>
						<p>걱정하지 마세요, <a class="color-green" href="#">여기를 누르시면</a> 비밀번호를 변경할 수 있습니다.</p>
				</form>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	$(function() { 
		$('#loginModal').modal('show');
		$('#loginModal').on('hide.bs.modal', function() {
			$('#loginModal').remove();
		})
	});
</script> 
</html>