<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<link rel="stylesheet" href="/script/common/jquery-ui/jquery-ui.css">
	<script src="/script/common/jquery-1.11.3.js"></script>
    <script src="/script/common/jquery-ui/jquery-ui.js"></script>
    <script>
    $(function() {
        $( "#drop_item li" ).draggable({
          appendTo: "body",
          helper: "clone"
        });
        $( "#drop_item2 ol" ).droppable({
            activeClass: "ui-state-default",
            hoverClass: "ui-state-hover",
            accept: ":not(.ui-sortable-helper)",
            drop: function( event, ui ) {
              $( this ).find( ".placeholder" ).remove();
              $( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );
            }
          }).sortable({
            items: "li:not(.placeholder)",
            sort: function() {
              // gets added unintentionally by droppable interacting with sortable
              // using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
              $( this ).removeClass( "ui-state-default" );
            }
          });
        
      });
    </script>
    
    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/assets/css/pages/profile.css">
    
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    
    
</head>
<body>  
	<div class="wrapper">
		<!--=== Header ===-->	
	    <div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	    </div>    
		<!--=== End Header ===-->
	
		<!--=== Breadcrumbs ===-->    
	    <div class="breadcrumbs-v1">
	        <div class="container" style="height: 50px;">
	            <span>${plannerDto.title}</span>
	            <h1>Basic Item Page</h1>
	        </div>
	    </div>
    <!--=== End Breadcrumbs ===-->
	</div>

	 <!--=== Content Part ===-->
    <div class="container content profile" >     
        <div class="row">
            <!--Left Sidebar-->
            <div class="col-md-3 md-margin-bottom-40">
                <img class="img-responsive profile-img margin-bottom-20" src="assets/img/team/img32-md.jpg" alt="">

                <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                    <li class="list-group-item">
                        <a href="page_profile.html"><i class="fa fa-bar-chart-o"></i> Overall</a>
                    </li>
                    <li class="list-group-item">
                        <a href="page_profile_me.html"><i class="fa fa-user"></i> Profile</a>
                    </li>
                </ul>   

                <div class="panel-heading-v2 overflow-h">
                    <h2 class="heading-xs pull-left"><i class="fa fa-bar-chart-o"></i> Task Progress</h2>
                    <a href="#"><i class="fa fa-cog pull-right"></i></a>
                </div>
                <h3 class="heading-xs">Web Design <span class="pull-right">92%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: 92%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="92" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
                <h3 class="heading-xs">Unify Project <span class="pull-right">85%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: 85%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="85" role="progressbar" class="progress-bar progress-bar-blue">
                    </div>
                </div>
                <h3 class="heading-xs">Sony Corporation <span class="pull-right">64%</span></h3>
                <div class="progress progress-u progress-xxs margin-bottom-40">
                    <div style="width: 64%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="64" role="progressbar" class="progress-bar progress-bar-dark">
                    </div>
                </div>

                <hr>

                <!--Notification-->
                <div class="panel-heading-v2 overflow-h">
                    <h2 class="heading-xs pull-left"><i class="fa fa-bell-o"></i> Notification</h2>
                    <a href="#"><i class="fa fa-cog pull-right"></i></a>
                </div>
                <ul class="list-unstyled mCustomScrollbar margin-bottom-20" data-mcs-theme="minimal-dark">
                    <li class="notification">
                        <i class="icon-custom icon-sm rounded-x icon-bg-red icon-line icon-envelope"></i>
                        <div class="overflow-h">
                            <span><strong>Albert Heller</strong> has sent you email.</span>
                            <small>Two minutes ago</small>
                        </div>    
                    </li>
                    <li class="notification">
                        <img class="rounded-x" src="assets/img/testimonials/img5.jpg" alt="">
                        <div class="overflow-h">
                            <span><strong>Taylor Lee</strong> started following you.</span>
                            <small>Today 18:25 pm</small>
                        </div>    
                    </li>
                    <li class="notification">
                        <i class="icon-custom icon-sm rounded-x icon-bg-yellow icon-line fa fa-bolt"></i>
                        <div class="overflow-h">
                            <span><strong>Natasha Kolnikova</strong> accepted your invitation.</span>
                            <small>Yesterday 1:07 pm</small>
                        </div>    
                    </li>
                    <li class="notification">
                        <img class="rounded-x" src="assets/img/testimonials/img1.jpg" alt="">
                        <div class="overflow-h">
                            <span><strong>Mikel Andrews</strong> commented on your Timeline.</span>
                            <small>23/12 11:01 am</small>
                        </div>    
                    </li>
                    <li class="notification">
                        <i class="icon-custom icon-sm rounded-x icon-bg-blue icon-line fa fa-comments"></i>
                        <div class="overflow-h">
                            <span><strong>Bruno Js.</strong> added you to group chating.</span>
                            <small>Yesterday 1:07 pm</small>
                        </div>    
                    </li>
                    <li class="notification">
                        <img class="rounded-x" src="assets/img/testimonials/img6.jpg" alt="">
                        <div class="overflow-h">
                            <span><strong>Taylor Lee</strong> changed profile picture.</span>
                            <small>23/12 15:15 pm</small>
                        </div>    
                    </li>
                </ul>    
                <button type="button" class="btn-u btn-u-default btn-u-sm btn-block">Load More</button>
                <!--End Notification-->

                <div class="margin-bottom-50"></div>

                <!--Datepicker-->
                <form action="#" id="sky-form2" class="sky-form">
                    <div id="inline-start"></div>
                </form> 
                <!--End Datepicker-->
            </div>
            <!--End Left Sidebar-->
            
            <!--Tag Box v4-->
            <div class="col-md-9">
            	<div class="profile-body margin-bottom-20">
            	<form action="/user/spot/addSpotWrite.do" id="sky-form" class="sky-form" style="border:none;" onsubmit="return addSpotForm(this)" method="post" enctype="multipart/form-data">
                <fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
				<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${plannerDto.end_date}"/>  		
				<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
                <input type="hidden" name="mem_no" value="${mem_object.mem_no}">
                <div class="tag-box tag-box-v4 rounded-2x margin-bottom-30">
	               <label class="textarea">
                       <i class="icon-append fa fa-question-circle"></i>
                       <textarea rows="5" placeholder="부산으로 떠나는 즐거운 여행"></textarea>
                       <b class="tooltip tooltip-top-right">여행에 대한 짧은 메모를 입력해주세요</b>
                   </label>
                   <div class="row" style="margin-bottom:5px;">   
                      <div class="col col-6">
                          <label class="input">
                              <i class="icon-append fa fa-calendar"></i>
                              <input type="text" name="start_date" id="start" placeholder="Start date">
                          </label>
                      </div>
                      <div class="col col-6">
                          <label class="input">
                              <i class="icon-append fa fa-calendar"></i>
                              <input type="text" name="finish" id="finish" placeholder="Expected finish date">
                          </label>
                      </div>
                  </div> 
                </div>
                
                
                <input type="hidden" name="day_count" value="3"/>
                <c:forEach var="i" begin="1" end="3">
                <div class="tag-box tag-box-v4 rounded-2x margin-bottom-40" id="drop_item2">
                	<ol>
                	<li>
                	<div class="panel-group">
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" href="#collapse${i}">Collapsible list group</a>
					        </h4>
					      </div>
					      <div id="collapse${i}" class="panel-collapse collapse">
					        <div class="panel-body">Panel Body</div>
					        <div class="panel-body">Panel Body</div>
					      </div>
					    </div>
					    </div>
 					 </li>
 					 </ol>
 					 
 					 <div class="panel-group">
 					 	<div class="drag_able">
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" href="#collapse${i}${i+1}">Collapsible list group</a>
					        </h4>
					      </div>
					      <div id="collapse${i}${i+1}" class="panel-collapse collapse">
					        <div class="panel-body">Panel Body</div>
					        <div class="panel-body">Panel Body</div>
					      </div>
					      </div>
					    </div>
 					 </div>
                </div>
                </c:forEach>
                </form>
                </div>
            </div>
            <!--End Tag Box v4-->
		</div>
	</div>
	
	<!-- 달력 -->
	
	
	<!-- JS Global Compulsory -->           
	<script type="text/javascript" src="/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
	
	<!-- JS Implementing Plugins -->
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/assets/js/app.js"></script>
	<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="assets/plugins/counter/waypoints.min.js"></script>
	<script type="text/javascript" src="assets/plugins/counter/jquery.counterup.min.js"></script> 
	<script type="text/javascript" src="assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/masking.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/datepicker.js"></script>	
	<script type="text/javascript" src="/assets/js/plugins/validation.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/style-switcher.js"></script>
	
	<script type="text/javascript">
	    jQuery(document).ready(function() {
	        App.init();
	        App.initScrollBar();
	        Masking.initMasking();
	        Datepicker.initDatepicker();
	        Validation.initValidation();
	    });
	</script>
</body>
</html>