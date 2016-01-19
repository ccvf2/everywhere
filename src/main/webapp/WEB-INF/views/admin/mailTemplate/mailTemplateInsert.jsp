<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자-메일템플릿-등록</title>
</head>
<script type="text/javascript">
//폼 전송 매소드
	function doSubmitForm(){
		var form=document.getElamentByName("mailTemplateForm");
			form.action="/admin/mailtemplate/mailTemplateInsert.do";
			form.submit();
		}
</script>
<!-- <script type="text/javascript" src="//cdn.tinymce.com/4/tinymce.min.js"></script> -->
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- 최상단 한줄메뉴 -->
			<c:import url="/WEB-INF/views/admin/menu/topMenu.jsp"/>
			<!-- sideMeny -->
			<c:import url="/WEB-INF/views/admin/menu/leftMenu.jsp"/>
		</nav>
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
						 <form role="form" name="mailTemplateForm" method="post">
							<table class="table table-bordered table-hover">
								<colgroup>
									<col width="15%"/>
									<col width="85%"/>
								</colgroup>
									<tr>
										<th>메일템플릿 사용여부:</th>
										<td>
											<div class="form-group">
												<label class="radio-inline">
													<input type="radio" name="mtemp_use_yn" id="optionsRadiosInline1" value="Y">선택
												</label>
												<label class="radio-inline">
													<input type="radio" name="mtemp_use_yn" id="optionsRadiosInline2" value="N" checked>미선택
												</label>
											</div>
										
										</td>
									</tr>
									<tr>
										<th>메일템플릿 종류:</th>
										<td>
											<div class="form-group">
												<label>Selects</label>
												<select class="form-control" name="mtemp_group_code">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>
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
												<textarea class="form-control" rows="3" name="mtemp_content"></textarea>
											</div>
										</th>
									</tr>
									<tr>
										<th colspan="2">
											<button>전송</button>
											<button>취소</button>
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