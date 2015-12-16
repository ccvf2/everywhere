<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/assets/plugins/animate.css">
    <link rel="stylesheet" href="/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/assets/css/pages/profile.css">
    <link rel="stylesheet" href="/assets/css/pages/shortcode_timeline1.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/assets/css/custom.css">
</head>
<body>
<div class="wrapper">
    <!--=== Header ===-->
    <div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	</div>
    <!--=== End Header ===-->

    <!--=== Profile ===-->
    <div class="container content blog-page blog-item">
    <!-- <div class="container content profile"> -->
    	<div class="row">
            <!--Left Sidebar-->
            <div class="col-md-3 md-margin-bottom-40">
                <c:import url="/WEB-INF/views/user/mypage/myPageLeft.jsp"/>
            </div>
            <!--End Left Sidebar-->

			<!-- 메인------------------------------------------------------------------------------------------------------------------------------ -->
            <!-- Profile Content -->
            mem_object.mem_no=${mem_object.mem_no}
            <div style="overflow:auto; overflow-x:hidden; max-height:700px; border:1px solid #e5e5e5;">
            <c:forEach var="list" items="${parsonTalkList}">
            	<c:choose>
            		<c:when test="${list.recv_mem_no==mem_object.mem_no}">
            			<!-- 자기글 일때. -->
            			<div class="row">
	            		<div class="col-md-12">
		            		<div class="col-md-5" style="float:right">
		                        <div id="testimonials-1" class="carousel slide testimonials testimonials-v2 testimonials-bg-dark">
		                            <div class="carousel-inner">
		                                <div class="item active">
		                      				<!-- <span class="magazine-badge label-red">Travel</span> -->
		                                    <p>${list.message}</p>
			                                <div class="testimonial-info" style="text-align: right;">
			                                    <span class="testimonial-author">
			                                        <c:out value="${list.recv_mem_name}" />
			                                        <em>
		                                        		<c:out value="${list.recv_time}" />, 
			                                        	<c:out value="${list.recv_mem_email}" /> 
			                                        </em>
			                                    </span>
			                                </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
	                    </div>
	                    </div>
            		</c:when>
            		<c:when test="${list.recv_mem_no!=mem_object.mem_no}">
            			<!-- 상대방 일때. -->
            			<div class="row">
			            <div class="col-md-12">
				            <div class="col-md-5" style="float:left;">
								<div class="margin-bottom-5">
				                    <div id="testimonials-1" class="carousel slide testimonials testimonials-v1">
				                        <div class="carousel-inner">
				                            <div class="item active">
				                                <p style="text-align: right;">${list.message}</p>
				                                <div class="testimonial-info">
				                                    <span class="testimonial-author">
				                                        <c:out value="${list.recv_mem_name}" />
				                                        <em>
				                                        <c:out value="${list.recv_mem_email}" />,
			                                        	<c:choose>
			                                        		<c:when test="${list.recv_time==''}">읽지않음</c:when>
			                                        		<c:otherwise><c:out value="${list.recv_time}" /></c:otherwise>
			                                        	</c:choose>
				                                        </em>
				                                    </span>
				                                </div>
				                            </div>
				                        </div>
				
				                    </div>
				                </div>
				            </div>
			            </div>
			            </div>
			        </c:when>
            		<c:otherwise>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
            </div>


			<div class="col-md-9">
			<hr>
                    <h2 class="margin-bottom-20">Post a Comment</h2>
                    <!-- Form -->
                    <form action="assets/php/sky-forms-pro/demo-comment-process.php" method="post" id="sky-form3" class="sky-form comment-style">
                        <fieldset>
                            <div class="row sky-space-30">
                                <div class="col-md-6">
                                    <div>
                                        <input type="text" name="email" id="email" placeholder="Email" class="form-control" style="border:1px solid #e5e5e5;">
                                    </div>
                                </div>
                            </div>

                            <div class="sky-space-30">
                                <div>
                                    <textarea rows="8" name="message" id="message" placeholder="Write comment here ..." class="form-control" style="border:1px solid #e5e5e5;"></textarea>
                                </div>
                            </div>

                            <p><button type="submit" class="btn-u">Submit</button></p>
                        </fieldset>

                        <div class="message">
                            <i class="rounded-x fa fa-check"></i>
                            <p>Your comment was successfully posted!</p>
                        </div>
                    </form>
                    <!-- End Form -->
			</div>
        </div>

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <!-- End Profile Content -->
            <!-- 메인------------------------------------------------------------------------------------------------------------------------------ -->
    </div><!--/container-->
    <!--=== End Profile ===-->

    <!--=== Footer Version 1 ===-->
    <div class="footer-v1">
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	</div>
    <!--=== End Footer Version 1 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->
<script type="text/javascript" src="/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="/assets/plugins/counter/waypoints.min.js"></script>
<script type="text/javascript" src="/assets/plugins/counter/jquery.counterup.min.js"></script>
<script type="text/javascript" src="/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/assets/js/app.js"></script>
<script type="text/javascript" src="/assets/js/plugins/datepicker.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        App.initCounter();
        App.initScrollBar();
        Datepicker.initDatepicker();
    });
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>