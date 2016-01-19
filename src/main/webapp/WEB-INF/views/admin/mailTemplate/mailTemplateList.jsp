<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자-메일템플릿-목록</title>
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
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							EVERYWHERE <small>관리자 모드</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active">
								<i class="fa fa-dashboard"></i> Dashboard
							</li>
						</ol>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-12">
					side:${mailTemplatList.size()}
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
								<colgroup>
									<col width="5%"/>
									<col width="10%"/>
									<col width="40%"/>
									<col width="45%"/>
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>구분</th>
										<th>템플릿명</th>
										<th>메일제목</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${mailTemplatList}" var="list" varStatus="index">
									<tr>
										<td><c:out value="${index.count}"/></td>
										<td><c:out value="${list.mtemp_group_code}"/></td>
										<td><c:out value="${list.mtemp_name}"/></td>
										<td><c:out value="${list.mtemp_title}"/></td>
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