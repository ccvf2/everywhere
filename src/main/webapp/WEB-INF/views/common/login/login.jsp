<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<c:import url="/WEB-INF/views/common/jquery.jsp" />
<c:import url="/WEB-INF/views/user/common/utilImport.jsp" />
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp" />
		</div>

		<div class="container content" >
			<div class="row">
				<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
					<form class="reg-page" action="/user/login/login.do" name="memberLogin" method="post">
						<input type="hidden" name="callback_url" value='${callback_url}'>
						<input type="hidden" name="callback_param" value='${callback_param}'>

						<div class="reg-header">
							<h2>Login to your account</h2>
						</div>

						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
							<input type="text" name="mem_email" placeholder="Email address" class="form-control" value="admin@everywhere.com">
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

		<div class="footer-v1">
			<c:import url="/WEB-INF/views/user/common/footer.jsp" />
		</div>
	</div>
</body>
</html>