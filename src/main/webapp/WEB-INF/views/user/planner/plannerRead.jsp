<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<c:import url="/WEB-INF/views/common/jquery.jsp"/>
	<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
	<meta charset="utf-8">
	<title>여행 계획</title>

	<!-- CSS Page Style -->
	<link rel="stylesheet" href="/assets/css/pages/shortcode_timeline2.css">
	</head>
	<body>
	<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
	<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${plannerDto.end_date}"/>
	<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
	<input type="hidden" name="mem_no" value="64" />
	<div class="wrapper">
		<!--=== Header ===-->
		<div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		</div>
	<!--=== End Header ===-->

    <!--=== Breadcrumbs ===-->
    <div class="breadcrumbs-v1">
        <div class="container" style="height: 50px;">
            <span>Blog Item Page</span>
            <h1>${plannerDto.title}</h1>
        </div>
    </div>
    <!--=== End Breadcrumbs ===-->

    <!--=== Content Part ===-->
    <div class="container content">     
        <div class="row">
            <!-- Begin Sidebar Menu -->
            <div class="col-md-3">
                <ul class="list-group sidebar-nav-v1" id="sidebar-nav">
                    <!-- Typography -->
                    <li class="list-group-item list-toggle">
                        <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-typography">Typography</a>
                        <ul id="collapse-typography" class="collapse">
                            <li><a href="shortcode_typo_general.html"><i class="fa fa-sort-alpha-asc"></i> General Typography</a></li>
                            <li>
                                <span class="badge badge-u">New</span>
                                <a href="shortcode_typo_headings.html"><i class="fa fa-magic"></i> Heading Options</a>
                            </li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_typo_dividers.html"><i class="fa fa-ellipsis-h"></i> Dividers</a>
                            </li>
                            <li><a href="shortcode_typo_blockquote.html"><i class="fa fa-quote-left"></i> Blockquote Blocks</a></li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_typo_boxshadows.html"><i class="fa fa-asterisk"></i> Box Shadows</a>
                            </li>
                            <li><a href="shortcode_typo_testimonials.html"><i class="fa fa-comments"></i> Testimonials</a></li>                            
                            <li><a href="shortcode_typo_tagline_boxes.html"><i class="fa fa-tasks"></i> Tagline Boxes</a></li>
                            <li><a href="shortcode_typo_grid.html"><i class="fa fa-align-justify"></i> Grid Layouts</a></li>
                        </ul>
                    </li>
                    <!-- End Typography -->

                    <!-- Buttons UI -->
                    <li class="list-group-item list-toggle">
                        <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-buttons">Buttons UI</a>
                        <ul id="collapse-buttons" class="collapse">
                            <li><a href="shortcode_btn_general.html"><i class="fa fa-flask"></i> General Buttons</a></li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_btn_brands.html"><i class="fa fa-html5"></i> Brand &amp; Social Buttons</a>
                            </li>
                            <li>
                                <span class="badge badge-u">New</span>
                                <a href="shortcode_btn_effects.html"><i class="fa fa-bolt"></i> Loading &amp; Hover Effects</a>
                            </li>
                        </ul>
                    </li>
                    <!-- End Buttons UI -->

                    <!-- Timeline -->
                    <li class="list-group-item list-toggle active">
                        <a class="accordion-toggle" href="#collapse-timeline" data-toggle="collapse">Timeline</a>
                        <ul id="collapse-timeline" class="collapse in">
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_timeline1.html"><i class="fa fa-dot-circle-o"></i> Timeline 1</a>
                            </li>
                            <li class="active">
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_timeline2.html"><i class="fa fa-dot-circle-o"></i> Timeline 2</a>
                            </li>
                        </ul>
                    </li>
                    <!-- End Timeline -->
                </ul>
            </div>
            <!-- End Sidebar Menu -->
            
            <!--Tag Box v4-->
            <div class="col-md-9">
                <div class="tag-box tag-box-v4 rounded margin-bottom-40">
                    <h2>Consectetur adipiscing elit harum quidem rerum magnaed et quam lacus</h2>
                    <p>${plannerDto.memo }</p>
                </div>
            </div>
            <!--End Tag Box v4-->

            <!-- Begin Content -->
            <div class="col-md-9">
                <ul class="timeline-v2" >
                <c:set var="i" value="0"/>
                <c:forEach var="item" items="${itemList}">                	                
                    <li class="equal-height-columns">                    
                	<c:set var="day" value="${item.item_order / 10100}" />                	
                        <div class="cbp_tmtime equal-height-column" style="width:100%;">
                        	<span>Day <fmt:formatNumber value="${day}" type="number" maxFractionDigits="0"/></span> 
                        	<span style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd(E)" value="${plannerDto.start_date}" /></span>
                        </div>
                        <i class="cbp_tmicon rounded-x hidden-xs"></i>
                        <div class="cbp_tmlabel equal-height-column">
                            <h2>${item.spot.spot_name}</h2>
                            <div class="row">
                                <div class="col-md-4">
                                    <img class="img-responsive" src="/attatchFile/spot/${item.spot.spot_photoes[0].save_name}.${item.spot.spot_photoes[0].extension}" alt=""> 
                                    <div class="md-margin-bottom-20"></div>
                                </div>
                                <div class="col-md-8">    
                                    <p>${item.spot.spot_note}</p>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 글상자 start-->
                        <div class="panel-group" style="margin:0 0 30px 25%; clear: both; position: relative;">
		                    <div class="panel panel-default rounded-2x">
		                        <div class="panel-body">
	                                <div class="row">
	                                	<c:if test="${item.item_photoes[0].save_name != null}">
	                                    <div class="col-md-4">
	                                        <img class="img-responsive" src="/attatchFile/item/${item.item_photoes[0].save_name}.${item.item_photoes[0].extension}" alt="">
	                                    </div>
	                                    </c:if>
	                                    <div class="col-md-8">
	                                        ${item.note}
	                                    </div>
	                                    
	                                    <c:if test="${item.moneyList != null }">
	                                    <hr/>
	                                    <div class="col-md-8">
	                                    	<c:forEach var="money" items="${item.moneyList}">
	                                    	${money.money_title } ${money.price }
	                                    	</c:forEach>
	                                    </div>
	                                    </c:if>
	                                </div>
	                            </div>
		                    </div>
	                    </div>
                        <!-- 글상자 end -->

                    </li>
                    </c:forEach>
                </ul>
            </div>
            </div>
            <!-- End Content -->
        </div>
    </div><!--/container-->     
    <!--=== End Content Part ===-->

    <!--=== Footer Version 1 ===-->
    <div class="footer-v1">
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
    </div>
    <!--=== End Footer Version 1 ===-->
  </body>
</html>