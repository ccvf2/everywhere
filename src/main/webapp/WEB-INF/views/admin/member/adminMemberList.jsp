<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자-메일템플릿-목록</title>
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/script/common/jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/script/common/jquery-ui/jquery-ui.css" />

<script type="text/javascript">
	$(function() {
		$("#start_date").datepicker({
			dateFormat : "yy-mm-dd",
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3,
			prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
			onClose : function(selectedDate) {
				$("#end_date").datepicker("option", "minDate", selectedDate);
			}
		});
		$("#end_date").datepicker({
			dateFormat : "yy-mm-dd",
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3,
			prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
			onClose : function(selectedDate) {
				$("#start_date").datepicker("option", "maxDate", selectedDate);
			}
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
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                        </ol>
                    </div>
                </div>
                <form>
	                <!-- 필터들 -->
	                <div class="row">
	                	<div class="col-xs-6 col-sm-2">
							<div class="form-group">
	                          <label>사용자 종류</label>
	                           	<select name="memLevel" class="form-control">
									<c:forEach var="memLevel" items="${memLevelList}">
										<option value="${memLevel.code}">${memLevel.code_name}</option>
									</c:forEach>
									<option value="" selected="selected">모두</option>
								</select>
	                        </div>
	                    </div>
	                  	<div class="col-xs-6 col-sm-2">    
	                        <div class="form-group">
	                          <label>계정 상태</label>
	                          <select name="memStatus" class="form-control">
									<c:forEach var="memStatus" items="${memStatusList}">
										<option value="${memStatus.code}">${memStatus.code_name}</option>
									</c:forEach>
									<option value="" selected="selected">모두</option>
							   </select>
	                        </div>
	                    </div>
	                  	<div class="col-xs-6 col-sm-2">        
	                        <div class="form-group">
	                          <label>핸드폰 인증 상태</label>
	                           <select name="phoneStatus" class="form-control">
									<c:forEach var="phoneStatus" items="${phoneStatusList}">
										<option value="${phoneStatus.code}">${phoneStatus.code_name}</option>
									</c:forEach>
									<option value="" selected="selected">모두</option>
							   </select>
	                        </div>
						</div>
						<div class="col-xs-6 col-sm-3">
							<label>시작일</label>
							<input type="text" name="start_date" id="start_date" />
							
							
						</div>
						<div class="col-xs-6 col-sm-3">
							<label>종료일</label>
							<input type="text" name="end_date" id="end_date" /><br/>
						</div>
					</div>
					
					<!-- 검색칸 -->
	                <div class="row">
	                	<div class="col-xs-4 col-md-7">
	                		<select name="phoneStatus" class="form-control">
								<option value="email">이메일</option>
								<option value="name">이름</option>
								<option value="emailname">이메일+이름</option>
						   </select>
						</div>
	                	<div class="col-xs-8 col-md-7">
							<input type="text" class="form-control">
		                    <span class="input-group-btn">
		                    	<button class="btn btn-default" type="button">
		                    		<i class="fa fa-search"></i>
		                    	</button>
		                    </span>
						</div>
	                </div>
				</form>
                <div class="row">
                    <div class="col-lg-12">
                    side:${memberList.size()}
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                            	<colgroup>
                            		<col width="5%"/>
                            		<col width="25%"/>
                            		<col width="15%"/>
                            		<col width="15%"/>
                            		<col width="8%"/>
                            		<col width="8%"/>
                            		<col width="10%"/>
                            		<col width="14%"/>
                            	</colgroup>
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>이메일</th>
                                        <th>이름</th>
                                        <th>전화번호</th>
                                        <th>사용자 종류</th>
                                        <th>계정 상태</th>
                                        <th>핸드폰인증상태</th>
                                        <th>가입일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${memberList}" var="member" varStatus="index">
                                    <tr>
                                        <td><c:out value="${member.mem_no}"/></td>
                                        <td><a href=""><c:out value="${member.mem_email}"/></a></td>
                                        <td><c:out value="${member.mem_name}"/></td>
                                        <td><c:out value="${member.mem_phone}"/></td>
                       					<td>
	                       					<c:forEach var="memLevel" items="${memLevelList}">
												<c:if test="${member.mem_level_code==memLevel.code}">
										  			${memLevel.code_name}
										  		</c:if>
											</c:forEach>
										</td>
										<td>
	                       					<c:forEach var="memStatus" items="${memStatusList}">
												<c:if test="${member.mem_status_code==memStatus.code}">
										  			${memStatus.code_name}
										  		</c:if>
											</c:forEach>
										</td>
										<td>
	                       					<c:forEach var="phoneStatus" items="${phoneStatusList}">
												<c:if test="${member.mem_p_status_code==phoneStatus.code}">
										  			${phoneStatus.code_name}
										  		</c:if>
											</c:forEach>
										</td>
                                        <td><fmt:formatDate pattern="yy-MM-dd hh:mm" value="${member.mem_reg_date}"/></td>
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