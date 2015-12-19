<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<%--     <c:import url="/WEB-INF/views/common/jquery.jsp"/>
    <c:import url="/WEB-INF/views/user/common/utilImport.jsp"/> --%>
<!-- --------------------------------css Start------------------------------------- -->
<!-- Favicon -->
<!-- <link rel="shortcut icon" href="/assets/favicon.ico"> -->

<!-- Web Fonts -->
<!-- <link rel="shortcut" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&subset=cyrillic,latin"> -->

<!-- CSS Global Compulsory -->
<!-- <link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/style.css"> -->

<!-- CSS Header and Footer -->
<!-- <link rel="stylesheet" href="/assets/css/headers/header-default.css">
<link rel="stylesheet" href="/assets/css/footers/footer-v1.css">
 -->
<!-- CSS Implementing Plugins -->
<!-- <link rel="stylesheet" href="/assets/plugins/animate.css">
<link rel="stylesheet" href="/assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="/assets/plugins/parallax-slider/css/parallax-slider.css">
 -->
 <!-- 쪽지함에서 충돌로 인하 주석처리! -->
<!-- <link rel="stylesheet" href="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css"> -->
<!-- CSS Theme -->
<!-- <link rel="stylesheet" href="/assets/css/theme-colors/default.css"> -->
<!-- CSS Customization -->
<!-- <link rel="stylesheet" href="/assets/css/custom.css"> -->
<!-- --------------------------------css End------------------------------------- -->
<!-- **********************************  javascript  Start ****************************************** -->
<!-- JS Global Compulsory -->
<!-- hjahn. 드래그&드롭 관련 충돌로 인해 주석처리  -->
<!-- <script src="/assets/plugins/jquery/jquery.min.js"></script> -->
<!-- <script src="/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script> -->

<!-- JS Implementing Plugins -->
<!-- <script src="/assets/plugins/back-to-top.js"></script>
<script src="/assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="/assets/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="/assets/plugins/parallax-slider/js/jquery.cslider.js"></script> -->
<!-- 쪽지함에서 충돌로 인하 주석처리! -->
<!-- <script type="text/javascript" src="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script> -->

<!-- JS Customization -->
<!-- <script type="text/javascript" src="/assets/js/custom.js"></script> -->

<!-- JS Page Level -->
<!-- <script src="/assets/js/app.js"></script> -->
<!-- 쪽지함에서 충돌로 인하 주석처리! -->
<!-- <script type="text/javascript" src="/assets/js/plugins/owl-carousel.js"></script> -->
<!-- <script type="text/javascript" src="/assets/js/plugins/parallax-slider.js"></script> -->

<!-- CSS Global Compulsory -->
<!-- <link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/style.css"> -->
<script>
jQuery(document).ready(function() {
   	//App.init();
    //OwlCarousel.initOwlCarousel();
    //ParallaxSlider.initParallaxSlider();
});
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
	                    		<li><a data-toggle="modal" data-target="#loginModal">login</a></li>
								<li class="topbar-devider"></li>
	                    		<li>
	                    			<a href="/user/member/register.do">회원가입</a>
	                    		</li>
									<!-- 로그인 페이지 모달 -->
									<div class="modal fade" id="loginModal" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<form class="reg-page" action="/user/login/login.do" name="memberLogin" method="post">
									                   <div class="reg-header">
									                       <h2>Login to your account</h2>
									                   </div>
									                   
									                   <div class="input-group margin-bottom-20">
									                       <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
									                       <input type="text" name="mem_email" placeholder="Email address" class="form-control" value="admin@everwhere.com">
									                   </div>
									                   
									                   <div class="input-group margin-bottom-20">
									                       <span class="input-group-addon"><i class="fa fa-lock"></i></span>
									                       <input type="password" name="mem_pwd" placeholder="Password" class="form-control" value="1234567890">
									                   </div>
									                   
									                   <div class="row">
									                       <div class="col-md-6 checkbox">
									                           <label><input type="checkbox">로그인 상태 유지</label>
									                       </div>
									                       <div class="col-md-6">
									                           <button class="btn-u pull-right" type="submit">로그인</button>
									                       </div>
									                   </div>
										
													<hr>
									
									                   <h4>비밀번호를 잊어버리셨나요?</h4>
									                   <p>걱정하지 마세요, <a class="color-green" href="#">여기를 누르시면</a> 비밀번호를 변경할 수 있습니다.</p>
												</form>
											</div>
										</div>
									</div>
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
	                            <li><a href="page_home14.html">Option 6: Home Incredible</a></li>
	                            <li><a href="page_home9.html">Option 7: Home Creative</a></li>
	                            <li><a href="page_home10.html">Option 8: Home Inspire</a></li>
	                            <li><a href="page_home11.html">Option 9: Home Desire</a></li>
	                            <li><a href="page_jobs.html">Option 10: Home Jobs</a></li>
	                            <li><a href="page_home3.html">Option 11: Amazing Content</a></li>
	                            <li><a href="page_home6.html">Option 12: Home Magazine</a></li>
	                            <li><a href="page_home1.html">Option 14: Home Basic v1</a></li>
	                            <li><a href="page_home2.html">Option 15: Home Basic v2</a></li>
	                            <li><a href="page_home5.html">Option 16: Home Basic v3</a></li>
	                            <li><a href="page_home4.html">Option 17: Home Basic v4</a></li>
	                            <li class="active"><a href="page_home7.html">Option 18: Home Basic v5</a></li>
	                        </ul>
	                    </li>
	                    <!-- End Home -->
	
	                    <!-- Pages -->
	                    <li class="dropdown">
	                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
	                            여행 스케줄 작성
	                        </a>
	                    </li>
	                    <!-- End Pages -->
	
	                    <!-- Blog -->
	                    <li class="dropdown<c:if test="${ fn:startsWith(path, '/user/member')}">${ on }</c:if>">
	                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
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