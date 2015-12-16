<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>여행 계획</title>

    <!-- Bootstrap -->
    <link href="/script/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
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
            <h1>Basic Item Page</h1>
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

                    <!-- Icons -->
                    <li class="list-group-item list-toggle">                   
                        <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-icons">Icons</a>
                        <ul id="collapse-icons" class="collapse">
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_icon_general.html"><i class="fa fa-chevron-circle-right"></i> General Icons</a>
                            </li>
                            <li><a href="shortcode_icon_fa.html"><i class="fa fa-chevron-circle-right"></i> Font Awesome Icons</a></li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_icon_line.html"><i class="fa fa-chevron-circle-right"></i> Line Icons</a>
                            </li>
                            <li><a href="shortcode_icon_glyph.html"><i class="fa fa-chevron-circle-right"></i> Glyphicons (Bootstrap)</a></li>
                        </ul>
                    </li>
                    <!-- End Icons -->

                    <!-- Thumbails -->
                    <li class="list-group-item"><a href="shortcode_thumbnails.html">Thumbnails</a></li>
                    <!-- End Thumbails -->

                    <!-- Components -->
                    <li class="list-group-item list-toggle">
                        <a class="accordion-toggle" href="#collapse-components" data-toggle="collapse">Components</a>
                        <ul id="collapse-components" class="collapse">
                            <li><a href="shortcode_compo_messages.html"><i class="fa fa-comment"></i> Alerts &amp; Messages</a></li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_compo_labels.html"><i class="fa fa-tags"></i> Labels &amp; Badges</a>
                            </li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_compo_progress_bars.html"><i class="fa fa-align-left"></i> Progress Bars</a>
                            </li>
                            <li>
                                <span class="badge badge-u">New</span>
                                <a href="shortcode_compo_media.html"><i class="fa fa-volume-down"></i> Audio/Videos &amp; Images</a>
                            </li>
                            <li><a href="shortcode_compo_panels.html"><i class="fa fa-columns"></i> Panels</a></li>
                            <li><a href="shortcode_compo_pagination.html"><i class="fa fa-arrows-h"></i> Pagination</a></li>
                        </ul>
                    </li>
                    <!-- End Components -->

                    <!-- Accordion and Tabs -->
                    <li class="list-group-item"><a href="shortcode_accordion_and_tabs.html">Accordion and Tabs</a></li>
                    <!-- End Accordion and Tabs -->

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

                    <!-- Carousel Examples -->                    
                    <li class="list-group-item">
                        <span class="badge badge-u">New</span>                    
                        <a href="shortcode_carousels.html">Carousel Examples</a>
                    </li>
                    <!-- End Carousel Examples -->                    

                    <!-- Forms -->
                    <li class="list-group-item list-toggle">
                        <a class="accordion-toggle" href="#collapse-forms" data-toggle="collapse">Forms</a>
                        <ul id="collapse-forms" class="collapse">
                            <li><a href="shortcode_form_general.html"><i class="fa fa-bars"></i> Common Bootstrap Forms</a></li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_form_general1.html"><i class="fa fa-bars"></i> General Unify Forms</a>
                            </li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_form_advanced.html"><i class="fa fa-bars"></i> Advanced Forms</a>
                            </li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_form_layouts.html"><i class="fa fa-bars"></i> Form Layouts</a>
                            </li>                            
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_form_layouts_advanced.html"><i class="fa fa-bars"></i> Advanced Form Layouts</a>
                            </li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_form_states.html"><i class="fa fa-bars"></i> Form States</a>
                            </li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_form_sliders.html"><i class="fa fa-bars"></i> Form Sliders</a>
                            </li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_form_modals.html"><i class="fa fa-bars"></i> Modals</a>
                            </li>
                        </ul>
                    </li>
                    <!-- End Forms -->

                    <!-- Tables -->
                    <li class="list-group-item"><a href="shortcode_table_general.html">Tables</a></li>
                    <!-- End Tables -->

                    <!-- Maps -->                    
                    <li class="list-group-item list-toggle">                   
                        <a class="accordion-toggle" href="#collapse-maps" data-toggle="collapse">Maps</a>
                        <ul id="collapse-maps" class="collapse">
                            <li>
                                <span class="badge badge-u">New</span>
                                <a href="shortcode_maps_google.html"><i class="fa fa-map-marker"></i> Google Maps</a>
                            </li>
                            <li>
                                <span class="badge badge-u">New</span>                            
                                <a href="shortcode_maps_vector.html"><i class="fa fa-align-center"></i> Vector Maps</a>
                            </li>
                        </ul>
                    </li>
                    <!-- End Maps -->                    

                    <!-- Charts -->
                    <li class="list-group-item">
                        <span class="badge badge-u">New</span>                    
                        <a href="shortcode_compo_charts.html">Charts &amp; Countdowns</a>
                    </li>
                    <!-- End Charts -->
                </ul>
            </div>
            <!-- End Sidebar Menu -->
            
            <!--Tag Box v4-->
            <div class="col-md-9">
                <div class="tag-box tag-box-v4 rounded margin-bottom-40" style="float: left;">                                    
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
                                    <img class="img-responsive" src="assets/img/main/img1.jpg" alt=""> 
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
	                                    <div class="col-md-4">
	                                        <img class="img-responsive" src="assets/img/main/img12.jpg" alt="">
	                                    </div>
	                                    <div class="col-md-8">
	                                        ${item.note}
	                                    </div>
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