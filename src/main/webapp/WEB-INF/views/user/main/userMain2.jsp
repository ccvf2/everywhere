<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script type="text/javascript">
    //alert("☆★로그인시 아이디패스워드 꼭 확인하세요. 성국이서버는@everwhere   제서버는@everywhere 빠진y가 추가 되었습니다. 비밀번호는 동일하게 1234567890 입니다.-성욱-★☆");
    </script>
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
        
<%--             <div class="da-slide">
                <h2><i>떠나세요~</i> <br /> <i>당신을 기다리는</i> <br /> <i>많은곳들</i></h2>
                <p><i>일상에 지치고.. 시간에 쫒기고..</i> <br /> <i>갑시다!</i> <br /> <i>슈우우우우~</i></p>
                <div class="da-img"><img class="img-responsive" src="/attatchFile/admin/forground/${imglist.setting_url}" alt=""></div>
            </div> --%>

        	<c:forEach items="${forgroung}" var="imglist">
        		<c:out value="${imglist.setting_text}" escapeXml="false"/>
        	</c:forEach>
            
            
            
            
            
            
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
        <div class="headline"><h2>운영자 추천!</h2></div>
	        <div class="blog_masonry_3col" style="padding-bottom: 0px;">
		        <div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
				<div>
					<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a>
				</div>
 					<c:forEach var="list1" items="${list1}">
		            <div class="col-md-4">
		            <div class="grid-boxes-in" style="height: 430px;">
		                <img class="img-responsive" src="/attatchFile/planner/${list1.attach_file}" alt="" onError="this.src='/attatchFile/spot/no_image.jpg'" height="80%">
		                <div class="grid-boxes-caption">
		                    <h3><a href="/user/planner/readPlanner.do?planner_no=${list1.planner_no}">${list1.title}</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><a href="#">${list1.mem_name}</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${list1.reg_date}"/></li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i><c:out value="${list1.reply_Count}" escapeXml="false"/></a></li>
		                    </ul>
		                    <p>
		                    	<c:out value="${fn:substring(list1.memo, 0,50)}" escapeXml="false"/>
		                    	<c:if test="${fn:length(list1.memo) >50}">
						        	…
						        </c:if>
		                    </p>
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
        <div class="headline"><h2>좋아요 많은 순</h2></div>
	        <div class="blog_masonry_3col" style="padding-bottom: 0px;">
		        <div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
				<div>
					<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a>
				</div>
 					<c:forEach var="list1" items="${list1}">
		            <div class="col-md-4">
		            <div class="grid-boxes-in" style="height: 430px;">
		                <img class="img-responsive" src="/attatchFile/planner/${list1.attach_file}" onError="this.src='/attatchFile/spot/no_image.jpg'" alt="" height="80%">
		                <div class="grid-boxes-caption">
		                    <h3><a href="/user/planner/readPlanner.do?planner_no=${list1.planner_no}">${list1.title}</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><a href="#">${list1.mem_name}</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${list1.reg_date}"/></li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i><c:out value="${list1.reply_Count}" escapeXml="false"/></a></li>
		                    </ul>
		                    <p>
		                    	<c:out value="${fn:substring(list1.memo, 0,50)}" escapeXml="false"/>
		                    	<c:if test="${fn:length(list1.memo) >50}">
						        	…
						        </c:if>
		                    </p>
		                </div>
		            </div>
		            </div>
					</c:forEach>
				</div>
			</div>
        </div>
    	<!-- End Info Blokcs -->
    	
    	
    	<!-- Info Blokcs -->
    	<div class="row margin-bottom-5">
        <div class="headline"><h2>핫 플레이스!</h2>
					<a href="/user/search/searchSpot.do" style="float: right; line-height:50px;">더보기▶▶</a>
        </div>
	        <div class="blog_masonry_3col" style="padding-bottom: 0px;">
		        <div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
				<div>
				</div>
 					<c:forEach var="list1" items="${spotList}">
		            <div class="col-md-4">
		            <div class="grid-boxes-in" style="height: 430px;">
		                <img class="img-responsive" src="/attatchFile/spot/${list1.attach_file}" alt="${list1.spot_name}" onError="this.src='/attatchFile/spot/no_image.jpg'" height="80%" width="100%">
		                <div class="grid-boxes-caption">
		                    <h3><a href="/user/planner/readPlanner.do?planner_no=${list1.spot_no}">${list1.spot_name}</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><a href="#">${list1.spot_name}</a></li>
		                        <li>|</li>
		                        <%-- <li><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${list1.spot_regdate}"/></li> --%>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i><c:out value="${list1.total_star_score}" escapeXml="false"/></a></li>
		                    </ul>
		                    <p>
		                    	<c:out value="${fn:substring(list1.spot_note, 0,50)}" escapeXml="false"/>
		                    	<c:if test="${fn:length(list1.spot_note) >50}">
						        	…
						        </c:if>
		                    </p>
		                </div>
		            </div>
		            </div>
					</c:forEach>
				</div>
			</div>
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