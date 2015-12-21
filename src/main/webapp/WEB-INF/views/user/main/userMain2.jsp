<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="da-slide">
                <h2><i>CLEAN &amp; FRESH</i> <br /> <i>FULLY RESPONSIVE</i> <br /> <i>DESIGN</i></h2>
                <p><i>Lorem ipsum dolor amet</i> <br /> <i>tempor incididunt ut</i> <br /> <i>veniam omnis </i></p>
                <div class="da-img"><img class="img-responsive" src="/assets/plugins/parallax-slider/img/1.png" alt=""></div>
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
        <div class="row margin-bottom-20">
        <div class="headline"><h2>Recent Works</h2></div>
	        <div class="blog_masonry_3col">
		        <div class="container content grid-boxes" >
		        
		<div>
			<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a>
		</div>
					<c:forEach var="planner" items="${plannerList}">
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}">${planner.title}</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
					</c:forEach>
		            
		            

		            
				</div>
			</div>
	        

			
			
			
			
			
        </div>
    	<!-- End Row-->

    	<!-- Info Blokcs -->
    	<div class="row margin-bottom-30">
        	<!-- Welcome Block -->
    		<!-- <div class="col-md-8 md-margin-bottom-40">
    			<div class="headline"><h2>Welcome To Unify</h2></div>
                <div class="row">
                    <div class="col-sm-4">
                        <img class="img-responsive margin-bottom-20" src="/assets/img/main/img18.jpg" alt="">
                    </div>
                    <div class="col-sm-8">
                        <p>Unify is an incredibly beautiful responsive Bootstrap Template for corporate and creative professionals. It works on all major web browsers, tablets and phone.</p>
                        <ul class="list-unstyled margin-bottom-20">
                            <li><i class="fa fa-check color-green"></i> Donec id elit non mi porta gravida</li>
                            <li><i class="fa fa-check color-green"></i> Corporate and Creative</li>
                            <li><i class="fa fa-check color-green"></i> Responsive Bootstrap Template</li>
                            <li><i class="fa fa-check color-green"></i> Corporate and Creative</li>
                        </ul>
                    </div>
                </div>

                <blockquote class="hero-unify">
                    <p>Award winning digital agency. We bring a personal and effective approach to every project we work on, which is why. Unify is an incredibly beautiful responsive Bootstrap Template for corporate professionals.</p>
                    <small>CEO, Jack Bour</small>
                </blockquote>
            </div> -->
            <!--/col-md-8-->

            <!-- Latest Shots -->
            <div class="col-md-4">
    			<div class="headline"><h2>Latest Shots</h2></div>
    			<!-- <div id="myCarousel" class="carousel slide carousel-v1">
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="/assets/img/main/img4.jpg" alt="">
                            <div class="carousel-caption">
                                <p>Facilisis odio, dapibus ac justo acilisis gestinas.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="/assets/img/main/img2.jpg" alt="">
                            <div class="carousel-caption">
                                <p>Cras justo odio, dapibus ac facilisis into egestas.</p>
                            </div>
                            </div>
                        <div class="item">
                            <img src="/assets/img/main/img24.jpg" alt="">
                            <div class="carousel-caption">
                                <p>Justo cras odio apibus ac afilisis lingestas de.</p>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-arrow">
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
    			</div> -->
            </div><!--/col-md-4-->
    	</div>
    	<!-- End Info Blokcs -->

        <!-- Owl Clients v1 -->
        <div class="headline"><h2>Our Clients</h2></div>
        <div class="owl-clients-v1">
            <!-- <div class="item">
                <img src="/assets/img/clients4/1.png" alt="">
            </div>
            <div class="item">
                <img src="/assets/img/clients4/2.png" alt="">
            </div>
            <div class="item">
                <img src="/assets/img/clients4/3.png" alt="">
            </div>
            <div class="item">
                <img src="/assets/img/clients4/4.png" alt="">
            </div>
            <div class="item">
                <img src="/assets/img/clients4/5.png" alt="">
            </div>
            <div class="item">
                <img src="/assets/img/clients4/6.png" alt="">
            </div>
            <div class="item">
                <img src="/assets/img/clients4/7.png" alt="">
            </div>
            <div class="item">
                <img src="/assets/img/clients4/8.png" alt="">
            </div>
            <div class="item">
                <img src="/assets/img/clients4/9.png" alt="">
            </div> -->
        </div>
        <!-- End Owl Clients v1 -->
        
        
        
        
        
        
        
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