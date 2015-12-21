<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
<c:import url="/WEB-INF/views/common/jquery.jsp" />
<c:import url="/WEB-INF/views/user/common/utilImport.jsp" />
    <title>Unify - Responsive Website Template</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/assets/plugins/parallax-slider/css/parallax-slider.css">
    <link rel="stylesheet" href="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">

    <!-- CSS Customization -->
    <link href="/assets/css/pages/blog_masonry_3col.css" rel="stylesheet">
</head>

<body>
<div class="wrapper">
    <!--=== Header ===-->
    <div class="header">
    	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
    </div>
    <!--=== End Header ===-->

    <!--=== Slider ===-->
    <div class="slider-inner">
        <div id="da-slider" class="da-slider" style="background: transparent url(${backgroungImg}) repeat 0% 0%;">
        <!-- <div id="da-slider" class="da-slider"> -->
            <div class="da-slide">
                <h2><i>떠나세요~</i> <br /> <i>당신을 기다리는</i> <br /> <i>많은곳들</i></h2>
                <p><i>일상에 지치고.. 시간에 쫒기고..</i> <br /> <i>갑시다!</i> <br /> <i>슈우우우우~</i></p>
                <div class="da-img"><img class="img-responsive" src="/attatchFile/admin/forground/Untitled-1.png" alt=""></div>
            </div>
            <div class="da-slide">
                <h2><i>RESPONSIVE VIDEO</i> <br /> <i>SUPPORT AND</i> <br /> <i>MANY MORE</i></h2>
                <p><i>Lorem ipsum dolor amet</i> <br /> <i>tempor incididunt ut</i></p>
                <div class="da-img">
                   <!--  <iframe src="http://player.vimeo.com/video/47911018" width="530" height="300" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe> -->
                </div>
            </div>
            <div class="da-slide">
                <h2><i>USING BEST WEB</i> <br /> <i>SOLUTIONS WITH</i> <br /> <i>HTML5/CSS3</i></h2>
                <p><i>Lorem ipsum dolor amet</i> <br /> <i>tempor incididunt ut</i> <br /> <i>veniam omnis </i></p>
                <div class="da-img"><img src="/assets/plugins/parallax-slider/img/html5andcss3.png" alt="image01" /></div>
            </div>
            <div class="da-arrows">
                <span class="da-arrows-prev"></span>
                <span class="da-arrows-next"></span>
            </div>
        </div>
    </div><!--/slider-->
    <!--=== End Slider ===-->


    <!--=== Content Part ===-->
    <div class="container content-sm">


    	<!-- Recent Works -->
        <div class="row margin-bottom-5">
        <div class="headline"><h2>최근등록스케줄</h2></div>
	        <div class="blog_masonry_3col" style="padding-bottom: 0px;">
		        <div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
				<div>
					<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a>
				</div>
 					<c:forEach var="list1" items="${list1}">
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="/user/planner/readPlanner.do?planner_no=${list1.planner_no}">${list1.title}</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><a href="#">${list1.mem_name}</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${list1.reg_date}"/></li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> ${list1.reply_Count}</a></li>
		                    </ul>
		                    <p><c:out value="${list1.memo}"></c:out> </p>
		                </div>
		            </div>
		            </div>
					</c:forEach>
				</div>
			</div>
        </div>
    	<!-- End Row-->

    	<!-- Info Blokcs -->
    	<div class="row margin-bottom-5">
            <!-- Latest Shots -->
            <div class="col-md-4">
    			<div class="headline"><h2>댓글이 많은 순</h2></div>
	        <div class="blog_masonry_3col" style="padding-bottom: 0px;">
		        <div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
				<div>
					<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a>
				</div>
 					<c:forEach var="list1" items="${list1}">
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="/user/planner/readPlanner.do?planner_no=${list1.planner_no}">${list1.title}</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><a href="#">${list1.mem_name}</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${list1.reg_date}"/></li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> ${list1.reply_Count}</a></li>
		                    </ul>
		                    <p><c:out value="${list1.memo}"></c:out> </p>
		                </div>
		            </div>
		            </div>
					</c:forEach>
				</div>
			</div>

            </div><!--/col-md-4-->
    	</div>
    	<!-- End Info Blokcs -->
    	<!-- Info Blokcs -->
    	<div class="row margin-bottom-5">
            <!-- Latest Shots -->
            <div class="col-md-4">
    			<div class="headline"><h2>운영자 추천</h2></div>
	        <div class="blog_masonry_3col" style="padding-bottom: 0px;">
		        <div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
				<div>
					<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a>
				</div>
 					<c:forEach var="list1" items="${list1}">
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="/user/planner/readPlanner.do?planner_no=${list1.planner_no}">${list1.title}</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><a href="#">${list1.mem_name}</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${list1.reg_date}"/></li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> ${list1.reply_Count}</a></li>
		                    </ul>
		                    <p><c:out value="${list1.memo}"></c:out> </p>
		                </div>
		            </div>
		            </div>
					</c:forEach>
				</div>
			</div>

            </div><!--/col-md-4-->
    	</div>
    	<!-- End Info Blokcs -->


        
        
        
        
        
        
    </div><!--/container-->
    <!-- End Content Part -->

    <!--=== Footer Version 1 ===-->
    <div class="footer-v1">
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
    </div>
    <!--=== End Footer Version 1 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->
<!-- <script type="text/javascript" src="/assets/plugins/jquery/jquery.min.js"></script> -->
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="/assets/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="/assets/plugins/parallax-slider/js/jquery.cslider.js"></script>
<script type="text/javascript" src="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/assets/js/plugins/owl-carousel.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
      	//App.init();
        OwlCarousel.initOwlCarousel();
        ParallaxSlider.initParallaxSlider();
    });
</script>
<!--[if lt IE 9]>
    <script src="/assets/plugins/respond.js"></script>
    <script src="/assets/plugins/html5shiv.js"></script>
    <script src="/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>