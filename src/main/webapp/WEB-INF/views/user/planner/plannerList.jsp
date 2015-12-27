<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="/assets/css/pages/blog_masonry_3col.css" rel="stylesheet">
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
            	<div class="headline"><h2>최근등록스케줄</h2></div>
			        <div class="blog_masonry_3col" style="padding-bottom: 0px;">
				        <div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
						<div>
							<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a>
						</div>
		 					<c:forEach var="plannerList" items="${plannerList}">
				            <div class="col-md-4">
				            <div class="grid-boxes-in" style="height: 430px;">
				                <img class="img-responsive" src="/attatchFile/planner/${plannerList.attach_file}" alt="" height="80%">
				                <div class="grid-boxes-caption">
				                    <h3><a href="/user/planner/readPlanner.do?planner_no=${plannerList.planner_no}">${plannerList.title}</a></h3>
				                    <ul class="list-inline grid-boxes-news">
				                        <li><a href="#">${list1.mem_name}</a></li>
				                        <li>|</li>
				                        <li><i class="fa fa-clock-o"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${plannerList.reg_date}"/></li>
				                        <li>|</li>
				                        <li><a href="#"><i class="fa fa-comments-o"></i><c:out value="${plannerList.reply_Count}" escapeXml="false"/></a></li>
				                    </ul>
				                    <p>
				                    	<c:out value="${fn:substring(plannerList.memo, 0,50)}" escapeXml="false"/>
				                    	<c:if test="${fn:length(plannerList.memo) >50}">
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
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
	<c:forEach var="planner" items="${plannerList}">
		<div>
			<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a>
		</div>
	</c:forEach>
</body>
</html> --%>