<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/jquery.jsp"/>
<script type="text/javascript"src="/script/admin/demo.js"></script>
<script type="text/javascript">
 $(function() {			
	var table1 = $("table").ariaSorTable({
		rowsToShow: 10,
		pager: true,
		onInit: function() {
			demoControl();
		}
	});
	
	$("#destroy").click(function (event) { 
		table1.ariaSorTable('destroy');
	});		
	$("#disable").click(function (event) { 
		table1.ariaSorTable('disable');
	});			
});		
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

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            EVERYWHERE <small>관리자 모드</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> 서비스 메인화면 교체 
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i>  <strong>서비스</strong> 메인화면을 수정 할 수 있습니다.
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> 슬라이드 이미지 백그라운드</h3>
                            </div>
                            <div class="panel-body">
									<div id="sortbleTable"> 
										<div id="table-wrapper">
										<table>
											<caption class="ui-state-highlight ui-corner-all">background Table</caption>
											<thead>
												<tr>
													<th class="ui-table-number ui-state-default">셋팅고유번호</th>
													<th class="ui-table-number ui-state-default">셋팅위치코드</th>
													<th>셋팅내용코드</th>
													<th>셋팅URL</th>
													<th>셋팅글번호</th>
													<th>사용여부</th>
													<th>셋팅될 내용</th>

												<tr>
											</thead>
											<tbody>
												<c:forEach var="list" items="${settingList}">
													<tr>
														<td>${list.setting_no}</td>
														<td>${list.setting_spot_code}</td>
														<td>${list.setting_type_code}</td>
														<td>${list.setting_url}</td>
														<td>${list.planner_no}</td>
														<td>${list.use_yn}</td>
														<td><c:out value="${list.setting_text}"/></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										</div>
									</div>


                                <div id="previewDiv"></div>
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
