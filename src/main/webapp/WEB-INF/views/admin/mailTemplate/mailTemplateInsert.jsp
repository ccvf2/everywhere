<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자-메일템플릿-등록</title>
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
<script type="text/javascript">
	//폼 전송 매소드
	function doTemplateFormSubmit(){
		//벨리데이션 체크
		var templateForm= document.getElementById("mailTemplateForm");
		var valideCheck=false;
		
		if(templateForm.mtemp_group_code.value==''){
			alert("메일템플릿종류를 선택해주세요.");
			templateForm.mtemp_group_code.focus();
			return false;
		}
		if(templateForm.mtemp_name.value==''){
			alert("메일템플릿제목을 작성 해주세요.");
			templateForm.mtemp_name.focus();
			return false;
		}
		if(templateForm.mtemp_title.value==''){
			alert("메일제목을 작성 해주세요.");
			templateForm.mtemp_title.focus();
			return false;
		}
		if(templateForm.mtemp_content.value==''){
			alert("메일내용을 작성 해주세요.");
			templateForm.mtemp_content.focus();
			return false;
		}
		alert(tinyMCE.get("mtemp_content").getContent());
		valideCheck=true;
		
		if(valideCheck==true){
			templateForm.action="/admin/mailtemplate/mailTemplateInsert.do";
			templateForm.submit();
			}
		}
		
	//활성화 여부 확인 보내기전 벨리데이션
	function checkActiveTemplate(){
		var templateForm= document.getElementById("mailTemplateForm");
		var checkActive=templateForm.mtemp_active.value;
		var selectGroup=templateForm.mtemp_group_code.value;
			if(checkActive!='M1202'&&selectGroup!=''){
				checkActiveTemplateAJAX(selectGroup,checkActive)	
			}
	}
	
	//활성화 여부 확인 AJAX요청
	function checkActiveTemplateAJAX(selectGroup,checkActive){
		$(function() {
			$.ajax({
				  url : "/admin/mailtemplate/mailTemplateActiveCheck.ajax?activeCode="+checkActive+"&groupCode="+selectGroup
				, type : "GET"
				, dataType:"text"
				, success:function(result){checkConfirm(result);}
			})
		})
	}
	
	//AJAX후 결과 확인 창
	function checkConfirm(result){
		if(result==1){
			var str="선택된 메일 템플릿종류에 활성화된 템플릿이 존재합니다. 무시하고 이 템플릿을 사용하시겠습니까?";
			if(confirm(str)){
			}else{
				var templateForm= document.getElementById("mailTemplateForm");
				var checkActive=templateForm.mtemp_active.length;
				for (var ik = 0; ik < templateForm.mtemp_active.length; ik++) {
					if(templateForm.mtemp_active[ik].value=="M1202"){
						templateForm.mtemp_active[ik].checked=true;
					}
				}
			}
		}
	}
	
</script>
<!-- 텍스트 에디터 관련 import -->
<script type="text/javascript" src="/script/tinymce/tinymce.min.js"></script>
<script type="text/javascript">tinymce.init({
	selector:'textarea' 
	,language: 'ko'
	,plugins: [
					"advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
					"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
					"table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
			],

	toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
	toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | insertdatetime preview | forecolor backcolor",
	toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",

	menubar: false,
	toolbar_items_size: 'small',

	style_formats: [
		{title: 'Bold text', inline: 'b'},
		{title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
		{title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
		{title: 'Example 1', inline: 'span', classes: 'example1'},
		{title: 'Example 2', inline: 'span', classes: 'example2'},
		{title: 'Table styles'},
		{title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
	],

	templates: [
		{title: 'Test template 1', content: 'Test 1'},
		{title: 'Test template 2', content: 'Test 2'}
	]
	});</script>

		<div id="page-wrapper">
			<div class="container-fluid">
			<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							EVERYWHERE <small>관리자 모드</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active">
								<i class="fa fa-dashboard"></i> 메일템플릿 등록
							</li>
						</ol>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> 메일양식 등록</h3>
							</div>
							<div class="panel-body">
						<div class="table-responsive">
						 <form role="form" name="mailTemplateForm" id="mailTemplateForm" method="post">
							<table class="table table-bordered table-hover">
								<colgroup>
									<col width="15%"/>
									<col width="85%"/>
								</colgroup>
									<tr>
										<th><label for="codeList1">메일템플릿 종류:</label></th>
										<td>
											<div class="form-group">
												<select class="form-control" name="mtemp_group_code" id="codeList1" onchange="checkActiveTemplate()">
													<option value="">종류를 선택하세요</option>
													<c:forEach var="codeList1" items="${templateGroupCodeList}">
													<option value="${codeList1.code}">${codeList1.code_name}</option>
													</c:forEach>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th>메일템플릿 사용여부:</th>
										<td>
											<div class="form-group">
												<c:set value="M1202" var="defaultVal" />
												<c:forEach var="codeList0" items="${templateActive}">
												<label class="radio-inline">
													<input type="radio" name="mtemp_active" id="optionsRadiosInline1" 
													value="${codeList0.code}" onchange="checkActiveTemplate()" 
													<c:if test="${codeList0.code==defaultVal}">checked="checked"</c:if>>
														${codeList0.code_name}
												</label>
												</c:forEach>
											</div>
										
										</td>
									</tr>
									<tr>
										<th>메일템플릿 제목:</th>
										<td>
											<div class="form-group">
												<input class="form-control" placeholder="Enter text" name="mtemp_name">
											</div>
										</td>
									</tr>
									<tr>
										<th>메일 제목:</th>
										<td>
											<div class="form-group">
												<input class="form-control" placeholder="Enter text" name="mtemp_title">
											</div>
										</td>
									</tr>
									<tr>
										<th colspan="2">메일 내용:</th>
									</tr>
									<tr>
										<th colspan="2">
											<div class="form-group">
												<label>Text area</label>
												<textarea name="mtemp_content"></textarea>
											</div>
										</th>
									</tr>
									<tr>
										<th colspan="2">
											<a href="javascript:doTemplateFormSubmit()">전송</a>
										</th>
									</tr>
							</table>
							</form>
						</div>
							
							
							
							</div>
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