<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	
	//화면에서 폼전송 버튼을 눌럿을 때
	function insertCcodeFormSubmin(){
		$("#code_CRUD").val("C"); 
		$("#codeForm").submit(); 
	}
	
	//화면에서 폼전송 버튼을 눌럿을 때
	function updateCcodeFormSubmin(){
		$("#code_CRUD").val("U"); 
		$("#codeForm").submit(); 
	}
	function deleteCodeFormSubmin(){
		$("#code_CRUD").val("d"); 
		$("#codeForm").submit(); 
	}
	
	
	
	//코드셀렉터
	function selectCode(search){
		alert(search);
	}
</script>
</head>
<body>
<c:if test="${errorMsg != null}">
	<script type="text/javascript">
		var str='${errorMsg}';
		alert(str);
	</script>
</c:if>
	
	
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
	<!-- 코드작성 -->
	         <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i> 코드조작</h3>
                            </div>
                            <div class="panel-body">
                            <div class="text-right">
								<form action="/admin/commoncode/code.do" method="post" id="codeForm">
								<input type="hidden" name="code_CRUD" id="code_CRUD" value="C">
								<input type="hidden" name="code_no" id="code_no" value="0">
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
								</form>
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
                            <div class="text-right">
									<select class="form-control" onchange="selectCode(this.value)">
										<c:forEach items="${searchConditionList}" var="codeGroupList">
											<option value="${codeGroupList.code_group}">${codeGroupList.code_group_name}(${codeGroupList.code_group})</option>
										</c:forEach>
									</select>
							</div>
                            </div>
                        </div>
                    </div>
                </div>
	
	

   
                <div class="row">
					<!-- 코드 셀렉터 -->
					
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                            	<colgroup>
                            		<col width="10%"/>
                            		<col width="10%"/>
                            		<col width="10%"/>
                            		<col width="10%"/>
                            		<col width="20%"/>
                            		<col width="10%"/>
                            		<col width="20%"/>
                            		<col width="10%"/>
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
										<td><c:out value="${list.code}"/></td>
										<td><c:out value="${list.code_name}"/></td>
										<td><c:out value="${list.code_group}"/></td>
										<td><c:out value="${list.code_group_name}"/></td>
										<td><c:out value="${list.code_value}"/></td>
										<td><c:out value="${list.code_regdate}"/></td>
										<td><c:out value="${list.code_sort}"/></td>
									</tr>
								</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
				</div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
</body>



</html>