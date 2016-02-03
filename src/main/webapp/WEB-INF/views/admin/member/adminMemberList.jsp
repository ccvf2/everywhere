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
                                <i class="fa fa-dashboard"></i> 관리자 회원관리
                            </li>
                        </ol>
                    </div>
                </div>
                <form>
	                <!-- 필터 시작 -->
	                <div class="row">
	                	<div class="col-xs-6 col-sm-2">
							<div class="form-group">
	                          <label>사용자 종류</label>
	                          <c:choose>
	                          	<c:when test="${adminMemberDto.mem_level_code!=null}">
	                          		<select name="memLevel" id="memLevel" class="form-control" onchange="searchFun(1)">
		                           		<option value="" selected="selected">모두</option>
										<c:forEach var="memLevel" items="${memLevelList}">
											<c:choose>
												<c:when test="${adminMemberDto.mem_level_code==memLevel.code}">
													<option value="${memLevel.code}" selected="selected">${memLevel.code_name}</option>
												</c:when>
												<c:otherwise>
													<option value="${memLevel.code}">${memLevel.code_name}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
	                          	</c:when>
	                          	<c:otherwise>
	                          		<select name="memLevel" id="memLevel" class="form-control" onchange="searchFun()">
		                           		<option value="" selected="selected">모두</option>
										<c:forEach var="memLevel" items="${memLevelList}">
											<option value="${memLevel.code}">${memLevel.code_name}</option>
										</c:forEach>
									</select>
	                          	</c:otherwise>
	                          </c:choose>
	                           	
	                        </div>
	                    </div>
	                  	<div class="col-xs-6 col-sm-2">    
	                        <div class="form-group">
	                          <label>계정 상태</label>
	                          <c:choose>
	                          	<c:when test="${adminMemberDto.mem_status_code!=null}">
		                          	<select name="memStatus" id="memStatus" class="form-control" onchange="searchFun()">
			                          		<option value="">모두</option>
											<c:forEach var="memStatus" items="${memStatusList}">
												<c:choose>
													<c:when test="${adminMemberDto.mem_status_code==memStatus.code}">
														<option value="${memStatus.code}" selected="selected">${memStatus.code_name}</option>
													</c:when>
													<c:otherwise>
														<option value="${memStatus.code}">${memStatus.code_name}</option>	
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>	
		                        </c:when>
	                          	<c:otherwise>
	                          		<select name="memStatus" id="memStatus" class="form-control" onchange="searchFun()">
		                          		<option value="" selected="selected">모두</option>
										<c:forEach var="memStatus" items="${memStatusList}">
											<option value="${memStatus.code}">${memStatus.code_name}</option>
										</c:forEach>
									</select>	
	                          	</c:otherwise>
	                          </c:choose>
	                          
	                        </div>
	                    </div>
	                  	<div class="col-xs-6 col-sm-2">        
	                        <div class="form-group">
	                          <label>핸드폰 인증 상태</label>
	                          ${adminMemberDto.mem_p_status_code}
	                          <c:choose>
	                          	<c:when test="${adminMemberDto.mem_p_status_code!=null}">
	                          		<select name="phoneStatus" id="phoneStatus" class="form-control" onchange="searchFun()">
										<c:forEach var="phoneStatus" items="${phoneStatusList}">
											<c:choose>
												<c:when test="${adminMemberDto.mem_p_status_code==phoneStatus.code}">
													<option value="${phoneStatus.code}" selected="selected">${phoneStatus.code_name}</option>
												</c:when>
												<c:otherwise>
													<option value="${phoneStatus.code}">${phoneStatus.code_name}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<option value="" selected="selected">모두</option>
								   </select>
	                          	</c:when>
	                          	<c:otherwise>
	                          		<select name="phoneStatus" id="phoneStatus" class="form-control" onchange="searchFun()">
										<c:forEach var="phoneStatus" items="${phoneStatusList}">
											<option value="${phoneStatus.code}">${phoneStatus.code_name}</option>
										</c:forEach>
										<option value="" selected="selected">모두</option>
								   </select>
	                          	</c:otherwise>
	                          </c:choose>
	                        </div>
						</div>
						<div class="col-xs-6 col-sm-3">
							<div class="form-group">
								<label>회원가입 기간 ~부터</label>
								<input type="text" name="start_date" id="start_date" class="form-control"/>
							</div>
							
						</div>
						<div class="col-xs-6 col-sm-3">
							<label>~까지</label>
							<input type="text" name="end_date" id="end_date" class="form-control"/><br/>
						</div>
					</div>
					<!-- 필터 끝 -->
					
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
	                			<!--  검색어 가져오기 -->
	                			<c:choose>
	                				<c:when test="${adminMemberDto.mem_name!=null}">
	                					<c:set var="searchValue" value="${adminMemberDto.mem_name}"></c:set>
	                				</c:when>
	                				<c:when test="${adminMemberDto.mem_email!=null}">
	                					<c:set var="searchValue" value="${adminMemberDto.mem_email}"></c:set>
	                				</c:when>
	                			</c:choose>
	                			
                                <input type="text" id="search" class="form-control" value="${searchValue}">
                            <!-- 검색 버튼 시작 -->
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
                    	검색결과:${adminMemberDto.totalCount}
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
                                        <th>번호<br/>(mem_no)</th>
                                        <th>이메일<br/>(mem_email)</th>
                                        <th>이름<br/>(mem_name)</th>
                                        <th>전화번호<br/>(mem_phone)</th>
                                        <th>사용자 종류<br/>(mem_level_code)</th>
                                        <th>계정 상태<br/>(mem_status_code)</th>
                                        <th>핸드폰인증상태<br/>(mem_p_status_code)</th>
                                        <th>가입일<br/>(mem_reg_date)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${memberList}" var="member" varStatus="index">
                                    <tr>
                                        <td><c:out value="${member.mem_no}"/></td>
                                        <td><a href=""><c:out value="${member.mem_email}"/></a></td>
                                        <td>
                                        	<a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${member.mem_no}&SCHEDULE_TYPE=E0002&MYPAGE_SEARCH_CODE=M1029">
                                        		<c:out value="${member.mem_name}"/>
                                        	</a>
                                        </td>
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
				
				
				<!-- 페이징 시작 -->
				<div class="text-center">
					<c:if test="${adminMemberDto.totalCount > 0}">
						<nav>
							<ul class="pagination">
								<!-- 이전 버튼 -->
								<c:if test="${adminMemberDto.startPage > adminMemberDto.pageBlock}">
									<li>
										<a href="javascript:searchFun('${adminMemberDto.currentPage - adminMemberDto.pageBlock}')" aria-label="이전">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>
								<!-- 이전 버튼 끝 -->
								
								<!-- 페이지 번호 시작 -->
								<c:forEach var="i" begin="${adminMemberDto.startPage}" end="${adminMemberDto.endPage}">
									 <c:if test="${i!=adminMemberDto.currentPage}">
									 	<li><a href="javascript:searchFun('${i}')">${i}</a></li>
									 </c:if>
									 <c:if test="${i==adminMemberDto.currentPage}">
									 	<li class="active"><a href="javascript:searchFun('${i}')">${i}</a></li>
									 </c:if>
								</c:forEach>
								<!-- 페이지 번호 끝 -->
								
								<!-- 다음 버튼 -->
								<c:if test="${endPage < pageCount }">
									<li>
										<a href="javascript:searchFun('${adminMemberDto.currentPage+adminMemberDto.pageBlock}')" aria-label="다음">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
								<!-- 다음 버튼 끝 -->
							</ul>
						</nav>
					</c:if>
				</div>
				<!-- 페이징 끝 -->
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