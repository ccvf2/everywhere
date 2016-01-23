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
    <script type="text/javascript" src="/script/user/planner/plannerRead.js"></script>
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
        <div class="headline"><h2>운영자 추천!</h2>
        </div>
	        <div class="blog_masonry_3col" style="padding-bottom: 0px;">
		        <div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
				<div>
					<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a>
				</div>
 					<c:forEach var="suggetList" items="${suggetList}">
		            <div class="col-md-4">
		            	<span style="position: absolute; margin-left: 8px; font-size: 1.8em; color: #72c02c;" title="운영자 추천"><i class="fa fa-thumbs-o-up"></i></span>
		            <div class="grid-boxes-in" style="height: 430px;">
		                <img class="img-responsive" src="/attatchFile/planner/${suggetList.attach_file}" alt="" onError="this.src='/attatchFile/spot/no_image.jpg'" style="min-height: 50%;max-height: 51%" width="100%">
		                <div class="grid-boxes-caption">
		                    <h3><a href="/user/planner/readPlanner.do?planner_no=${suggetList.planner_no}">${suggetList.title}</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><a href="#">${suggetList.mem_name}</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${suggetList.reg_date}"/></li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i><c:out value="${suggetList.reply_Count}" escapeXml="false"/></a></li>
		                    </ul>
		                    <p>
		                    	<c:out value="${fn:substring(suggetList.memo, 0,50)}" escapeXml="false"/>
		                    	<c:if test="${fn:length(suggetList.memo) >50}">
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
        <div class="headline"><h2>좋아요 많은 순</h2>
        	<a href="/user/planner/plannerList.do" style="float: right; line-height:50px; font-size: 1.3em;">더보기<i class="fa fa-share"></i></a>
        </div>
	        <div class="blog_masonry_3col" style="padding-bottom: 0px;">
		        <div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
 					<c:forEach var="moreLikeList" items="${moreLikeList}">
		            <div class="col-md-4">
		            <c:choose>
		            	<c:when test="${moreLikeList.planner_ba_code eq 'E0001'}">
				            <span style="position: absolute; margin-left: 8px; font-size: 1.8em; color: #72c02c;" title="일정"><i class="fa fa-calendar-o"></i></span>
		            	</c:when>
		            	<c:when test="${moreLikeList.planner_ba_code eq 'E0002'}">
				            <span style="position: absolute; margin-left: 8px; font-size: 2em; margin-top: -3px; color: #72c02c;" title="리뷰"><i class="fa fa-check-circle"></i></span>
		            	</c:when>
		            	<c:otherwise>
		            	</c:otherwise>
		            </c:choose>
		            
		            <div class="grid-boxes-in" style="height: 430px;">
		                <img class="img-responsive" src="/attatchFile/planner/${moreLikeList.attach_file}" onError="this.src='/attatchFile/spot/no_image.jpg'" alt="" style="min-height: 50%;max-height: 51%" width="100%">
		                <div class="grid-boxes-caption">
		                    <h3><a href="/user/planner/readPlanner.do?planner_no=${moreLikeList.planner_no}">${moreLikeList.title}</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><a href="#">${moreLikeList.mem_name}</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${moreLikeList.reg_date}"/></li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i><c:out value="${moreLikeList.reply_Count}" escapeXml="false"/></a></li>
		                    </ul>
		                    <p>
		                    	<c:out value="${fn:substring(moreLikeList.memo, 0,50)}" escapeXml="false"/>
		                    	<c:if test="${fn:length(moreLikeList.memo) >50}">
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
					<a href="/user/search/searchSpot.do" style="float: right; line-height:50px; font-size: 1.3em;">더보기<i class="fa fa-share"></i></a>
        </div>
	        <div class="blog_masonry_3col" style="padding-bottom: 0px;">
		        <div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
				<div>
				</div>
 					<c:forEach var="list1" items="${spotList}">
		            <div class="col-md-4">
		            <div class="grid-boxes-in" style="height: 430px;">
		                <a href="javascript:spotReadPage('${list1.spot_no}')"><img class="img-responsive" src="/attatchFile/spot/${list1.attach_file}" alt="${list1.spot_name}" onError="this.src='/attatchFile/spot/no_image.jpg'" height="80%" width="100%" style="max-height: 232px"></a>
		                <div class="grid-boxes-caption">
		                    <h3><a href="javascript:spotReadPage('${list1.spot_no}')">${list1.spot_name}</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li title="별점 / 등록한 사람"><i class="fa fa-star"></i><c:out value="${list1.star_score}"/> / <i class="fa fa-users"></i>&nbsp;<c:out value="${list1.count_star_score}"/></li>
		                        <li>|</li>
		                        <li title="나라:${list1.country_name}"><i class="fa fa-flag"></i><c:out value="${list1.country_name}"/></li>
		                        <li>|</li>
		                        <li title="도시:${list1.city_name}"><i class="fa fa-location-arrow"></i><c:out value="${list1.city_name}"/></li>
		                        <li>|</li>
		                        <li title="명소종류:${list1.spot_type_name}"><i class="fa fa fa-info"></i><c:out value="${list1.spot_type_name}"/></li>
		                        <li>|</li>
		                        <li title="주소:${list1.spot_addr}"><i class="fa fa-map-marker"></i>
		                        <c:out value="${fn:substring(list1.spot_addr, 0,40)}"/>
		                    	<c:if test="${fn:length(list1.spot_addr) >40}">
						        	…
						        </c:if>
		                        </li>
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