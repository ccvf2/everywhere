<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제</title>
<c:import url="/WEB-INF/views/common/jquery.jsp" />
<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
</head>
<body>
	<button class="btn-u" data-toggle="modal" data-target="#myModal">회원삭제</button>

	<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<form action="/user/member/memberDelete.do" method="post">
					<input type="hidden" name="mem_no" value="${memberDto.mem_no}"/>
					<input type="hidden" name="mem_email" value="${memberDto.mem_email}"/>
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title" id="myModalLabel4">회원정보삭제</h3>
					</div>
					
					<div class="modal-body">
						<div class="row">
							<div class="col-md-12">
								<fieldset>
									<section>
										<label class="input">
		                                	<i class="icon-append fa fa-envelope"></i>
		                                	<input type="email" name="mem_email" id="email" placeholder="Email address" value="${memberDto.mem_email}" disabled="disabled">
		                            	</label>
									</section>
									
									<section>
										<label class="input" style="margin-left:5px;">
		                                	<i class="icon-append fa fa-lock"></i>
		                                   	<input type="password" name="mem_pwd" placeholder="Password">
		                                </label>
									</section>
									
								</fieldset>
							</div>
						</div>
					</div>
					
					<div class="modal-footer">
						<div align="right">
							<button type="submit" class="btn-u">회원탈퇴</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>