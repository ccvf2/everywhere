<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                	<div class="col-xs-6 col-md-4">
						<div class="form-group">
                          <label>계정 상태</label>
                          <select class="form-control">
                              <option>1</option>
                              <option>2</option>
                              <option>3</option>
                              <option>4</option>
                              <option>5</option>
                          </select>
                        </div>
                        
                        <div class="form-group">
                          <label>계정 상태</label>
                          <select class="form-control">
                              <option>1</option>
                              <option>2</option>
                              <option>3</option>
                              <option>4</option>
                              <option>5</option>
                          </select>
                        </div>
					</div>
					<div class="col-xs-12 col-md-7">
						<input type="text" class="form-control">
	                    
					</div>
					<div class="col-xs-12 col-md-1">
					<span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-search"></i></button></span>
	                    
					</div>
					
				</div>
                

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