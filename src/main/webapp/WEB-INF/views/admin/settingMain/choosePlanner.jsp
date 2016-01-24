 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<script type="text/javascript">
	//코드 수정하기.
	function codeSelect(code_no,code,code_name,code_group,code_group_name,code_value){
		$(function() {
			$("#code_no").val(code_no);
			$("#code").val(code);
			$("#code_name").val(code_name);
			$("#code_group").val(code_group);
			$("#code_group_name").val(code_group_name);
			$("#code_value").val(code_value);
		})
	}

	//화면에서 등록 버튼을 눌럿을 때
	function insertCcodeFormSubmin(){
		var form = document.getElementById("codeForm");
		$("#code_CRUD").val("C");
		form.action="/admin/commoncode/codeModify.do"; 
		form.submit(); 
	}

	//화면에서 수정 버튼을 눌럿을 때
	function updateCcodeFormSubmin(){
		var form = document.getElementById("codeForm");
		$("#code_CRUD").val("U"); 
		form.action="/admin/commoncode/codeModify.do"; 
		form.submit(); 
	}

	//화면에서 삭제 버튼을 눌럿을 때
	function deleteCodeFormSubmin(){
		var form = document.getElementById("codeForm");
		$("#code_CRUD").val("D"); 
		form.action="/admin/commoncode/codeModify.do"; 
		form.submit(); 
	}

	// 코드셀렉터(코드그룹 조건을 선택했을 때.)
	function selectCode(search){
		var form = document.getElementById("codeForm");
		form.currentPage.value=1;
		$("#search_code_group").val(search);
		$("#code_CRUD").val("R"); 
		$("#codeForm").submit(); 
	}

	//코드 검색 버튼을 눌렀을 때.
	function searchWordCode(){
		var form = document.getElementById("codeForm");
		if(form.searchWord1.value==''){
			alert("검색어를 입력하세요");
			form.searchWord1.focus();
		}else{
		form.currentPage.value=1;
		form.action="/admin/commoncode/code.do";
		form.submit(); 
		}
	}

	//페이징버튼을 눌렀을때.
	function movePage(pageNum){
		var form = document.getElementById("codeForm");
		form.currentPage.value=pageNum;
		form.action="/admin/commoncode/code.do";
		form.submit(); 
	}
</script>
</head>
<body>
<div id="wrapper">
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- 최상단 한줄메뉴 -->
		<c:import url="/WEB-INF/views/admin/menu/topMenu.jsp"/>
		<!-- sideMeny -->
		<c:import url="/WEB-INF/views/admin/menu/leftMenu.jsp"/>
	</nav>

	<div id="page-wrapper">
		<div class="container-fluid">
			<form method="post" id="codeForm">
				<!-- 코드목록 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-green">
							<div class="panel-heading">
								<h3 class="panel-title"><i class="fa fa-long-arrow-right"></i> 조건선택</h3>
							</div>
							<div class="panel-body">
							<div class="text-left">
								<div class="form-group">
									<label>게시여부 : </label>
									<select class="form-control" onchange="selectCode(this.value)" style="display: inline; width: 80%;">
										<option value="">전체</option>
										<option value="1">개시</option>
										<option value="2" >미개시</option>
									</select>
									<br />
									<br />
								</div>
								<div class="form-group">
									<label>글종류 : </label>
									<select class="form-control" onchange="selectCode(this.value)" style="display: inline; width: 80%;">
										<option value="">전체</option>
										<option value="1">스케줄</option>
										<option value="2" >일정</option>
									</select>
									<br />
									<br />
								</div>
								<div class="form-group">
									<label>검색조건 : 
									<select class="form-control" style="display: inline; width: 70%;" name="searchCondition1">
										<option value="">전체</option>
										<option value="code" >고유코드(code)</option>
									</select>
									</label>
									<div class="form-group" style="display: inline;">
										<label>&nbsp;&nbsp;&nbsp;&nbsp;검색어 : 
										<input class="form-control" placeholder="검색어를 입력하세요." style="display: inline; width: 70%;" name="searchWord1" value="${searchCondition.searchWord1}">&nbsp;&nbsp;
										</label>
										<input type="button"  class="btn btn-primary" value="검색" onclick="searchWordCode()">
									</div>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>

					<div class="row">
						<div class="col-lg-12">
							<div class="table-responsive">
										<table class="table table-bordered table-hover table-striped">
											<colgroup>
												<col width="5%"/>
												<col width="10%"/>
												<col width="15%"/>
												<col width="10%"/>
												<col width="20%"/>
												<col width="20%"/>
												<col width="15%"/>
												<col width="5%"/>
											</colgroup>
											<thead>
												<tr>
													<th>번호</th>
													<th>전글/후글</th>
													<th>제목</th>
													<th>사용여부(삭제여부)</th>
													<th>게시상태</th>
													<th>게시순서</th>
													<th>게시일</th>
													<th>이전게시여부</th>
												</tr>
											</thead>
											<tbody>
											<c:choose>
												<c:when test="${plannerList!=null}">
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="8"><div class="text-center">결과가 없습니다.</div></td>
													</tr>
												</c:otherwise>
											</c:choose>
											</tbody>
										</table>
								
							</div>
						</div>
					</div>

			</form>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
</div>
	<!-- /#wrapper -->
</body>
</html>