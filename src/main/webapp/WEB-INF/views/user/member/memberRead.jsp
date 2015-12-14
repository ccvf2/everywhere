<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보보기</title>
<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
</head>
<body>
	<button class="btn-u" data-toggle="modal" data-target="#myModal">회원정보보기</button>
	
	<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<form class="form_style" name="memberForm" action="/user/member/memberUpdate.do?mem_no=${mem_no}" method="get" onsubmit="return registerForm(this)">
					<input type="hidden" name="mem_no" value="${memberDto.mem_no}"/>
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title" id="myModalLabel4">회원정보보기</h3>
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
		                                   	<input type="password" name="mem_pwd" placeholder="Password" value="${memberDto.mem_pwd}" disabled="disabled">
		                                </label>
		                            </section>
			
									<section>
		                            	<label class="input" style="margin-left:3px; margin-top:2px;">
		                                	<i class="icon-append fa fa-user"></i>
		                                    <input type="text" name="mem_name" placeholder="Username" value="${memberDto.mem_name}" disabled="disabled">
		                                </label>
		                            </section>
		
									<section>
		                            	<label class="input" style="margin-left:3px;">
		                                	<i class="icon-append fa fa-phone"></i>
		                                    <input type="text" name="mem_phone" placeholder="Phonenumber" value="${memberDto.mem_phone}" disabled="disabled">
		                                </label>
		                            </section>
	
									<section>
										<label>관심분야</label><br/>
										<span>
											<c:forEach var="codelist" items="${interestList}">
												<label style="float:left"><input type="checkbox" name="interestValue" value="${codelist.code}" disabled="disabled">${codelist.code_name}</label>
											</c:forEach>
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
									</section>
								</fieldset>
							</div>
						</div>
					</div>
					
					<div class="modal-footer">
						<div align="right">
							<button type="submit" class="btn-u">회원정보수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>