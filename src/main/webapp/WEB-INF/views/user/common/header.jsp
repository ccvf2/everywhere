<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<script>
//로그인 폼 모달
function loginFormReqiest() {
	var makeDiv ="<div id='loginForm'></div>";
	var requestURL="/user/login/loginModal.do";
		$.ajax({
					url : requestURL,
					type : "GET",
					dataType : "html",
					success : function(data) {
						$("body").append(makeDiv);
						$("#loginForm").append(data)
					},
					error : function() {
						alert("목록 가져오기 실패");
					}
				})
}


//회원가입 폼 모달
function joinFormReqiest() {
	var makeDiv ="<div id='joinForm'></div>";
	var requestURL="/user/member/register.do";
		$.ajax({
					url : requestURL,
					type : "GET",
					dataType : "html",
					success : function(data) {
						$("body").append(makeDiv);
						$("#joinForm").append(data)
					},
					error : function() {
						alert("목록 가져오기 실패");
					}
				})
}

//여행스케줄 작성 모달
function plannerCreateReqiest() {
	//alert("Qyd")
	var makeDiv2 ="<div id='plannerCreateForm'></div>";
	var requestURL="/user/planner/plannerCreate.do";
 		$.ajax({
					url : requestURL,
					type : "GET",
					dataType : "html",
					success : function(data) {
						//alert(data);
						$("body").append(makeDiv2);
						$("#plannerCreateForm").append(data);
					},
					error : function() {
						alert("목록 가져오기 실패"); 
					}
				});
}

</script>
<meta charset="UTF-8">
<title>타이틀 입력</title>

</head>
	        <div class="container">
	            <!-- Logo -->
	            <a class="logo" href="/">
	                <img src="/assets/img/logo1-default.png" alt="Logo">
	            </a>
	            <!-- End Logo -->
	
	            <!-- Topbar -->
	            <div class="topbar">
	                <ul class="loginbar pull-right">
	                	<c:choose>
	                		<c:when test="${ mem_object.mem_name=='' || mem_object==null }">
	                    		<li><a href="javascript:loginFormReqiest()">login</a></li>
								<li class="topbar-devider"></li>
	                    		<li>
	                    			<!-- <a href="/user/member/register.do">회원가입</a> -->
	                    			<a href="javascript:joinFormReqiest()">회원가입</a>
	                    		</li>
	                		</c:when>
	                		<c:otherwise>
			                	<li>${mem_object.mem_name}님 안녕하세요.</li>
			                    <li class="topbar-devider"></li>
			                    <li><a href="/user/login/loginout.do" style="color: #72c02c;">Logout</a></li>
			                    <li class="topbar-devider"></li>
			                    <c:if test="${mem_object.mem_level_code=='M0001'}">
			                    <li><a href="/admin/main/main.do" style="color: #72c02c;">관리자페이지</a></li>
			                    </c:if>
	                		</c:otherwise>
	                	</c:choose>
	                </ul>
	            </div>
	            <!-- End Topbar -->
	
	            <!-- Toggle get grouped for better mobile display -->
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="fa fa-bars"></span>
	            </button>
	            <!-- End Toggle -->
	        </div><!--/end container-->
	
	        <!-- Collect the nav links, forms, and other content for toggling -->
	        <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
	            <div class="container">
	                <ul class="nav navbar-nav">
	                    <!-- Home -->
	                    <c:set var="path" value="<%= request.getRequestURI().replaceAll(\"/WEB-INF/view\", \"\") %>" />
	                  	<c:set var="active" value=" active" />
	                  	
	                    <!-- Search Block -->
	                    <li>
	                        <i class="search fa fa-search search-btn"></i>
	                        <div class="search-open">
	                            <div class="input-group animatedfadeInDown ">
	                                <input type="text" class="form-control" placeholder="Search">
	                                <span class="input-group-btn">
	                                    <button class="btn-u" type="button">Go</button>
	                                </span>
	                            </div>
	                        </div>
	                    </li>
	                    <!-- End Search Block -->
	                    <li class="dropdown <c:if test="${ fn:startsWith(path, '/user/member')}">${ on }</c:if>">
	                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
	                           리뷰
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a href="index.html">Option 1: Default Page</a></li>
	                            <li><a href="page_home8.html">Option 5: Home Discover</a></li>
	                            <li><a href="page_home4.html">Option 17: Home Basic v4</a></li>
	                            <li class="active"><a href="page_home7.html">Option 18: Home Basic v5</a></li>
	                        </ul>
	                    </li>
	                    <!-- End Home -->
	
	                    <!-- Pages -->
	                    <li class="dropdown">
	                        <a href="javascript:plannerCreateReqiest()" class="dropdown-toggle">
	                            여행 스케줄 작성
	                        </a>
	                    </li>
	                    <!-- End Pages -->
	
	                    <!-- Blog -->
	                    <li class="dropdown<c:if test="${ fn:startsWith(path, '/user/member')}">${ on }</c:if>">
	                        <a href="/user/accompany/accompanyList.do" class="dropdown-toggle">
	                            여행동행구하기
	                        </a>
	                     </li>   	                    
	                    <!-- End Blog -->
	
	                    <!-- Portfolio -->
	                    <li class="dropdown">
	                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
	                            마이페이지
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a href="portfolio_hover_colors.html">Portfolio Hover Colors</a></li>
	                        </ul>
	                    </li>
	                    <!-- End Portfolio -->
	
	                    <!-- Features -->
<%-- 	                    <li class="dropdown<c:if test="${ fn:startsWith(path, '/user/member')}">${ on }</c:if>">
	                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
	                            쪽지함
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li class="dropdown-submenu">
	                                <a href="javascript:void(0);">Headers</a>
	                            </li>
	                            <li><a href="feature_gallery.html">Gallery Examples</a></li>
	                        </ul>
	                    </li> --%>
	                    <!-- End Features -->

	
	                    <!-- Misc Pages -->
<%-- 	                    <li class="dropdown<c:if test="${ fn:startsWith(path, '/user/member')}">${ on }</c:if>">
	                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
	                            Misc
	                        </a>
	                        <ul class="dropdown-menu pull-right">
	                            <li><a href="page_misc_blank.html">Blank page</a></li>
	                            <li><a href="page_misc_boxed.html">Boxed Page</a></li>
	                            <li><a href="page_misc_boxed_img.html">Boxed Image Page</a></li>
	                            <li><a href="page_misc_boxed_fixed_header.html">Boxed Fixed Menu</a></li>
	                            <li><a href="page_misc_dark.html">Dark Page</a></li>
	                            <li><a href="page_misc_dark_boxed.html">Dark Boxed Page</a></li>
	                            <li><a href="page_misc_dark_other_color.html">Dark Page with Theme Color</a></li>
	                            <li><a href="page_misc_sticky_footer.html">Sticky Footer Example</a></li>
	                        </ul>
	                    </li> --%>
	                    <!-- End Misc Pages -->
	
	                </ul>
	            </div><!--/end container-->
		</div><!--/navbar-collapse-->
</html>