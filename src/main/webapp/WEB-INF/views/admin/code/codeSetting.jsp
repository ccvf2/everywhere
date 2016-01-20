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
				<!-- 코드작성 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-green">
							<div class="panel-heading">
								<h3 class="panel-title"><i class="fa fa-long-arrow-right"></i> 코드조작</h3>
							</div>
							<div class="panel-body">
							<div class="text-right">
								<input type="hidden" name="code_CRUD" id="code_CRUD" value="">
								<input type="hidden" name="code_no" id="code_no" value="0">
								<!-- 페이징처리 정보 -->
								<input type="hidden" name="totalCount" id="totalCount" value="${searchCondition.totalCount}">
								<input type="hidden" name="startRow" id="startRow" value="${searchCondition.startRow}">
								<input type="hidden" name="endRow" id="endRow" value="${searchCondition.endRow}">
								<input type="hidden" name="currentPage" id="currentPage" value="${searchCondition.currentPage}">
								<input type="hidden" name="pageBlock" id="pageBlock" value="${searchCondition.pageBlock}">
								<input type="hidden" name="pageCount" id="pageCount" value="${searchCondition.pageCount}">
								<input type="hidden" name="startPage" id="startPage" value="${searchCondition.startPage}">
								<input type="hidden" name="endPage" id="endPage" value="${searchCondition.endPage}">
								<input type="hidden" name="pageBlockGroupCount" id="pageBlockGroupCount" value="${searchCondition.startRow}">
								<input type="hidden" name="search_code_group" id="search_code_group" value="${searchCondition.search_code_group}">
									<table>
										<tr>
											<th>고유코드</th>
											<td>
												<input type="text" name="code" maxlength="5" id="code" class="form-control"/>
											</td>
											<th>코드명</th>
											<td>
												<input type="text" name="code_name" maxlength="30" id="code_name" class="form-control"/>
											</td>
											<th>코드그룹</th>
											<td>
												<input type="text" name="code_group" maxlength="10" id="code_group" class="form-control"/>
											</td>
											<th>코드그룹명</th>
											<td>
												<input type="text" name="code_group_name" maxlength="30" id="code_group_name" class="form-control"/>
											</td>
											<th>코드밸류</th>
											<td>
												<input type="text" name="code_value" maxlength="30" id="code_value" class="form-control"/>
											</td>
										</tr>
									</table>
									<input type="button"  class="btn btn-primary" value="수정" onclick="updateCcodeFormSubmin()">
									<input type="button"  class="btn btn-primary" value="삭제" onclick="deleteCodeFormSubmin()">
									<input type="button"  class="btn btn-primary" value="등록" onclick="insertCcodeFormSubmin()">
							</div>
							</div>
						</div>
					</div>
				</div>

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
									<label>코드그룹 : </label>
									<select class="form-control" onchange="selectCode(this.value)" style="display: inline; width: 80%;">
										<option value="">전체</option>
										<c:forEach items="${searchConditionList}" var="codeGroupList">
										 	<c:choose>
										 		<c:when test="${searchCondition.search_code_group==codeGroupList.code_group}">
													<option value="${codeGroupList.code_group}" selected="selected">${codeGroupList.code_group_name}(${codeGroupList.code_group})</option>
										 		</c:when>
										 		<c:otherwise>
													<option value="${codeGroupList.code_group}">${codeGroupList.code_group_name}(${codeGroupList.code_group})</option>
										 		</c:otherwise>
										 	</c:choose>
										</c:forEach>
									</select>
									<br />
									<br />
								</div>
								<div class="form-group">
									<label>검색조건 : 
									<select class="form-control" style="display: inline; width: 70%;" name="searchCondition1">
										<option value="">전체</option>
										<option value="code" <c:if test="${searchCondition.searchCondition1=='code'}">selected="selected"</c:if>>고유코드(code)</option>
										<option value="code_name" <c:if test="${searchCondition.searchCondition1=='code_name'}">selected="selected"</c:if>>코드명(code_name)</option>
										<option value="code_value" <c:if test="${searchCondition.searchCondition1=='code_value'}">selected="selected"</c:if>>코드밸류(code_value)</option>
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
								<c:choose>
									<c:when test="${searchCondition.totalCount==0}">
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
													<th>코드<br/>(code_no)</th>
													<th>고유코드<br/>(code)</th>
													<th>코드명<br/>(code_name)</th>
													<th>코드그룹<br/>(code_group)</th>
													<th>코드그룹명<br/>(code_group_name)</th>
													<th>코드밸류<br/>(code_value)</th>
													<th>코드등록일<br/>(code_regdate)</th>
													<th>코드정렬값<br/>(code_sort)</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="8"><div class="text-center">결과가 없습니다.</div></td>
												</tr>
											</tbody>
										</table>
									</c:when>
									<c:otherwise>
										<c:set value="<span style='color: red; background-color: yellow;'>${searchCondition.searchWord1}</span>" var="replaceWord" />
										<span style="float: left;">총 페이지 : ${searchCondition.pageCount} / 현제페이지 : ${searchCondition.currentPage}</span>
										<span style="float: right;">총 : ${searchCondition.totalCount} 개</span>
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
														<th>코드(code_no)</th>
														<th>고유코드(code)</th>
														<th>코드명(code_name)</th>
														<th>코드그룹(code_group)</th>
														<th>코드그룹명(code_group_name)</th>
														<th>코드밸류(code_value)</th>
														<th>코드등록일(code_regdate)</th>
														<th>코드정렬값(code_sort)</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="list" items="${codeList}">
													<tr>
																<td>
																	<a href="javascript:codeSelect('${list.code_no}','${list.code}','${list.code_name}','${list.code_group}','${list.code_group_name}','${list.code_value}')">
																		<c:out value="${list.code_no}"/>
																	</a>
																</td>

														<!-- 검색어 하이라이트 처리 -->
														<c:choose>
															<c:when test="${searchCondition.searchWord1!='' && (searchCondition.searchCondition1=='code'||searchCondition.searchCondition1=='')}">
																<td><c:out value="${fn:replace(list.code, searchCondition.searchWord1, replaceWord)}" escapeXml="false"/></td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${list.code}"/></td>
															</c:otherwise>
														</c:choose>

														<!-- 검색어 하이라이트 처리 -->
														<c:choose>
															<c:when test="${searchCondition.searchWord1!='' && (searchCondition.searchCondition1=='code_name'||searchCondition.searchCondition1=='')}">
																<td><c:out value="${fn:replace(list.code_name, searchCondition.searchWord1, replaceWord)}" escapeXml="false"/></td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${list.code_name}"/></td>
															</c:otherwise>
														</c:choose>

														<!-- 코드그룹선택시 붉게 표시 -->
														<c:choose>
															<c:when test="${searchCondition.search_code_group!=''}">
																<td style="color: red;"><c:out value="${list.code_group}"/></td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${list.code_group}"/></td>
															</c:otherwise>
														</c:choose>

														<!-- 코드그룹선택시 붉게 표시 -->
														<c:choose>
															<c:when test="${searchCondition.search_code_group!=''}">
																<td style="color: red;"><c:out value="${list.code_group_name}"/></td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${list.code_group_name}"/></td>
															</c:otherwise>
														</c:choose>

														<!-- 검색어 하이라이트 처리 -->
														<c:choose>
															<c:when test="${searchCondition.searchWord1!='' && (searchCondition.searchCondition1=='code_value'||searchCondition.searchCondition1=='')}">
																<td><c:out value="${fn:replace(list.code_value, searchCondition.searchWord1, replaceWord)}" escapeXml="false"/></td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${list.code_value}"/></td>
															</c:otherwise>
														</c:choose>

																<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${list.code_regdate}"/></td>

																<td><c:out value="${list.code_sort}"/></td>
													</tr>
												</c:forEach>
												</tbody>
											</table>

										<!-- 페이징처리 부분 Start -->
										<div class="text-center">
												<nav>
													<ul class="pagination">
													<c:if test="${searchCondition.startPage > searchCondition.pageBlock}">
														<li>
															<a href="javascript:movePage('1')" aria-label="Previous">
																<span aria-hidden="true">&laquo;&laquo;</span>
															</a>
														</li>
														<li>
															<a href="javascript:movePage(${searchCondition.currentPage-1})" aria-label="Previous">
																<span aria-hidden="true">&laquo;</span>
															</a>
														</li>
													</c:if>

													<c:forEach var="pageNum" begin="${searchCondition.startPage}" end="${searchCondition.endPage}">
													<c:choose>
														<c:when test="${searchCondition.currentPage==pageNum}">
														<li class="active"><a href="javascript:movePage('${pageNum}')">${pageNum}</a></li>
														</c:when>
														<c:otherwise>
														<li><a href="javascript:movePage('${pageNum}')">${pageNum}</a></li>
														</c:otherwise>
													</c:choose>
													</c:forEach>

													<c:if test="${searchCondition.endPage < searchCondition.pageCount}">
														<li>
															<a href="javascript:movePage(${searchCondition.currentPage+1})" aria-label="Next">
																<span aria-hidden="true">&raquo;</span>
															</a>
															</li>
														<li>
															<a href="javascript:movePage(${searchCondition.pageCount})" aria-label="Next">
																<span aria-hidden="true">&raquo;&raquo;</span>
															</a>
														</li>
													</c:if>
													</ul>
												</nav>
										</div>
										<!-- 페이징처리 부분 End -->
									</c:otherwise>
								</c:choose>
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