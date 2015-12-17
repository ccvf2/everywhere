<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자-메일템플릿-목록</title>

<link rel="stylesheet" type="text/css" href="/script/common/jquery-ui/jquery-ui.css" />
<style type="text/css">
	.ui-datepicker{
		z-index: 9999 !important;
		background: #999;}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/jquery.jsp"/>
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
	                           	<select name="memLevel" id="memLevel" class="form-control">
	                           		<option value="" selected="selected">모두</option>
									<c:forEach var="memLevel" items="${memLevelList}">
										<option value="${memLevel.code}">${memLevel.code_name}</option>
									</c:forEach>
								</select>
	                        </div>
	                    </div>
	                  	<div class="col-xs-6 col-sm-2">    
	                        <div class="form-group">
	                          <label>계정 상태</label>
	                          <select name="memStatus" id="memStatus" class="form-control">
	                          		<option value="" selected="selected">모두</option>
									<c:forEach var="memStatus" items="${memStatusList}">
										<option value="${memStatus.code}">${memStatus.code_name}</option>
									</c:forEach>
							   </select>
	                        </div>
	                    </div>
	                  	<div class="col-xs-6 col-sm-2">        
	                        <div class="form-group">
	                          <label>핸드폰 인증 상태</label>
	                           <select name="phoneStatus" id="phoneStatus" class="form-control">
									<c:forEach var="phoneStatus" items="${phoneStatusList}">
										<option value="${phoneStatus.code}">${phoneStatus.code_name}</option>
									</c:forEach>
									<option value="" selected="selected">모두</option>
							   </select>
	                        </div>
						</div>
						<div class="col-xs-6 col-sm-3">
							<div class="form-group">
								<label>시작일</label>
								<input type="text" name="start_date" id="start_date" class="form-control"/>
							</div>
							
						</div>
						<div class="col-xs-6 col-sm-3">
							<label>종료일</label>
							<input type="text" name="end_date" id="end_date" class="form-control"/><br/>
						</div>
					</div>
					
					<!-- 검색칸 -->
	                <div class="row">
	                	<div class="col-xs-4">
	                		<label>필터</label>
	                		<select name="searchOption" id="searchOption" class="form-control">
	                			<option value="emailname">이메일+이름</option>
								<option value="email">이메일</option>
								<option value="name">이름</option>
						   </select>
						</div>
	                	<div class="col-xs-8">
	                		<label>검색어</label>
	                		<div class="input-group">
                                <input type="text" id="search" class="form-control">
		                    <span class="input-group-btn">
		                    	<button class="btn btn-default" type="button" onclick="searchFun()">
		                    		<i class="fa fa-search"></i>
		                    	</button>
		                    </span>
                            </div>
						</div>
	                </div>
				</form>
                <div class="row">
                    <div class="col-lg-12">
                    	검색결과:${memberList.size()}
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                            	<colgroup>
                            		<col width="5%"/><!-- 번호 -->
                            		<col width="25%"/>
                            		<col width="15%"/>
                            		<col width="15%"/>
                            		<col width="8%"/><!-- 사용자 종류 -->
                            		<col width="10%"/><!-- 계정 상태 -->
                            		<col width="10%"/>
                            		<col width="12%"/>
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
											<select name="memStatus" id="memStatus${member.mem_no}" class="form-control" onchange="changeStatus('${member.mem_no}')">
	                       						<c:forEach var="memStatus" items="${memStatusList}">
													<c:if test="${member.mem_status_code==memStatus.code}">
														<option value="${memStatus.code}" selected="selected">${memStatus.code_name}</option>
													</c:if>
													<c:if test="${member.mem_status_code!=memStatus.code}">
														<option value="${memStatus.code}">${memStatus.code_name}</option>
													</c:if>
												</c:forEach>
											</select>
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
    
    
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/script/common/jquery-ui/jquery-ui.js"></script>

<!-- 회원관리 페이지에 필요한 javascript -->
<script type="text/javascript" src="/script/admin/member/searchMember.js"></script>
<script type="text/javascript" src="/script/admin/member/changeMemberStatus.js"></script>
<script type="text/javascript" src="/script/admin/member/adminDatepicker.js"></script>
</body>
</html>