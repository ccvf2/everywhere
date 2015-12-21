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
    
    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/assets/css/pages/profile.css">
    <link rel="stylesheet" href="/assets/css/pages/shortcode_timeline1.css">
    <link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/assets/plugins/animate.css">
</head>
<body>
<div class="wrapper">
    <!--=== Header ===-->
    <div class="header">
			<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	</div>
    <!--=== End Header ===-->

    <!--=== Profile ===-->
    <div class="container content profile">
    	<div class="row">
            <!--Left Sidebar-->
            <div class="col-md-3 md-margin-bottom-40">
                <c:import url="/WEB-INF/views/user/mypage/myPageLeft.jsp"/>
            </div>
            <!--End Left Sidebar-->

			<!-- 메인------------------------------------------------------------------------------------------------------------------------------ -->
            <!-- Profile Content -->
            <div class="col-md-9">
            	<c:if test="${plannerList.size()==0}">
                     <div class="alert alert-info alert-dismissable">
                         <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                         <i class="fa fa-info-circle"></i>  <strong><c:out value="${memberDto.mem_name}님,"/></strong>&nbsp;&nbsp;&nbsp; 여행 계획을 세워보세요!
                     </div>
               	</c:if>
               	<c:if test="${plannerList.size()>0}">
	                <ul class="timeline-v1">
		                <c:forEach var="plannerList" items="${plannerList}" varStatus="i">
		                	<c:if test="${i.index%2==0}">
		                		<li>
			                        <div class="timeline-badge primary"><i class="glyphicon glyphicon-record"></i></div> <!-- 좌측 타임라인 0번째 -->
			                        <div class="timeline-panel">
			                            <div class="timeline-heading">
			                                <img class="img-responsive" src="/assets/img/main/img10.jpg" alt=""/>
			                            </div>
			                            <div class="timeline-body text-justify">
			                                <h2><a href="#">${plannerList.title}</a></h2>
			                                <p>${plannerList.memo}</p>
			                                <a class="btn-u btn-u-sm" href="#">Read More</a>
			                            </div>
			                            <div class="timeline-footer">
			                                <ul class="list-unstyled list-inline blog-info">
			                                    <li><i class="fa fa-clock-o"></i> March 28, 2014</li>
			                                    <li><i class="fa fa-comments-o"></i> <a href="#">7 Comments</a></li>
			                                </ul>
			                                <a class="likes" href="#"><i class="fa fa-heart"></i>239</a>
			                            </div>
			                        </div>
			                    </li>
				            </c:if>
				            <c:if test="${i.index%2==1}">
				            	<li class="timeline-inverted">
			                        <div class="timeline-badge primary"><i class="glyphicon glyphicon-record invert"></i></div> <!-- 우측 타임라인 1번째 -->
			                        <div class="timeline-panel">
			                            <div class="timeline-heading">
			                                <img class="img-responsive" src="/assets/img/main/img12.jpg" alt=""/>
			                            </div>
			                            <div class="timeline-body text-justify">
			                                <h2><a href="#">${plannerList.title}</a></h2>
			                                <p>${plannerList.memo}</p>
			                                <a class="btn-u btn-u-sm" href="#">Read More</a>
			                            </div>
			                            <div class="timeline-footer">
			                                <ul class="list-unstyled list-inline blog-info">
			                                    <li><i class="fa fa-clock-o"></i> March 16, 2014</li>
			                                    <li><i class="fa fa-comments-o"></i> <a href="#">12 Comments</a></li>
			                                </ul>
			                                <a class="likes" href="#"><i class="fa fa-heart"></i>87</a>
			                            </div>
			                        </div>
			                    </li>
				            </c:if>
		                </c:forEach>
                    
	                    <li class="clearfix" style="float: none;"></li>
	                </ul>
	        	</c:if>
            </div>
            <!-- End Profile Content -->
            <!-- 메인------------------------------------------------------------------------------------------------------------------------------ -->
        </div>
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