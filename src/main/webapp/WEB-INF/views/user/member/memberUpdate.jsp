<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<c:import url="/WEB-INF/views/common/jquery.jsp" />
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
<script type="text/javascript">
	var mem_p_status_code="";
	function pStatusChange() {
		var value=confirm("인증하시겠습니까?");
		if(value==true) {
			document.getElementById("sky-form4").mem_p_status_code.value="M2001";
			alert("인증되었습니다.");
		} else {
			alert("인증 되지 않았습니다.");
		}
	}
</script>
<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
</head>
<body>
	<button class="btn-u" data-toggle="modal" data-target="#myModal">회원정보수정</button>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form name="regForm" id="sky-form4" class="sky-form" action="/user/member/memberUpdate.do" method="post" onsubmit="return registerForm(this)">
					<input type="hidden" name="mem_no" value="${memberDto.mem_no}" />
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title" id="myModalLabel4">회원정보수정</h3>
					</div>
					
					<div class="modal-body">
						<div class="row">
							<div class="col-md-12">
								<fieldset>
									<section>
										<label class="input">
		                                	<i class="icon-append fa fa-envelope"></i>
		                                	<input type="email" name="mem_email" id="email" value="${memberDto.mem_email}" disabled="disabled">
		                                	<b class="tooltip tooltip-top-right"></b>
		                            	</label>
	                                </section>
	                                
	                                <section>
		                            	<label class="input">
		                                	<i class="icon-append fa fa-lock"></i>
		                                   	<input type="password" name="mem_pwd" placeholder="Password" value="${memberDto.mem_pwd}">
		                                   	<b class="tooltip tooltip-top-right">사용하실 비밀번호를 입력해주세요.</b>
		                                </label>
		                            </section>
		                            
		                            <section>
		                            	<label class="input">
		                                	<i class="icon-append fa fa-user"></i>
		                                    <input type="text" name="mem_name" value="${memberDto.mem_name}" disabled="disabled">
		                                    <b class="tooltip tooltip-top-right"></b>
		                                </label>
		                            </section>
		                            
		                            <section>
		                            	<label class="input">
		                                	<i class="icon-append fa fa-phone"></i>
		                                    <input type="text" name="mem_phone" placeholder="Phonenumber" value="${memberDto.mem_phone}">
		                                    <b class="tooltip tooltip-top-right">회원님의 전화번호를 입력해주세요.</b>
		                                    <c:if test="${form.mem_phone.value()!=memberDto.mem_p_status_code}">
			                                    <a class="btn-u" href="javascript:pStatusChange()">번호인증</a>
											</c:if>
												<input type="hidden" name="mem_p_status_code" value="${mem_p_status_code}">
		                                </label>
		                            </section>
		
									<section>
										<label><font size="5">관심분야</font></label><br/>
										<span>
											<c:forEach var="codelist" items="${interestList}">
												<label style="float:left; margin-right:30px;"><input type="checkbox" name="interestValue" value="${codelist.code}"><font size="3">&nbsp;${codelist.code_name}</font></label>
											</c:forEach>
											<input type="hidden" name="mem_interest" value="${memberDto.mem_interest}"/>
											<c:forTokens var="mem_interest" items="${memberDto.mem_interest}" delims=",">
												<script type="text/javascript">
													for(var i=0;i<regForm.interestValue.length;i++) {
														if(regForm.interestValue[i].value=="${mem_interest}") {
															regForm.interestValue[i].checked=true;
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
							<a class="btn-u" href="/user/member/memberDelete.do?mem_no=${mem_no}">회원탈퇴</a> 
							<button type="submit" class="btn-u">수정완료</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>