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
			<!--=== News Block ===-->
	        	<div class="col-md-9">
		        	<c:if test="${plannerList.size()==0}">
	                     <div class="shadow-wrapper">
		                    <div class="tag-box tag-box-v1 box-shadow shadow-effect-2">
		                        <h2>아직 여행계획이 없으시군요.</h2>
		                        <p>새로운 여행계획.<br/>
		                         당신만의 여행계획을 만들어보세요.<br/>
		                         </p>
		                    </div>
		                </div>
					</c:if>
					<c:if test="${plannerList.size()>0}">
						<c:forEach var="plannerList" items="${plannerList}">
						
							<c:choose>
								<c:when test="${plannerList.attach_file.length()<5}">
									<c:set var="plannerImg" value="/attatchFile/spot/no_image.jpg"/>
								</c:when>
								<c:otherwise>
									<c:set var="plannerImg" value="/attatchFile/planner/${plannerList.attach_file}"/>
								</c:otherwise>
							</c:choose>
						
							<div class="col-md-4 sm-margin-bottom-30">
				                <div class="news-v2-badge">
				                    <img class="img-responsive" src="${plannerImg}" alt="">
				                </div>
				                <div class="news-v2-desc bg-color-light">
				                    <h3><a href="#"><c:out value="${plannerList.title}"/></a></h3>
				                    <small><a href="#">댓글 ${plannerList.reply_Count}</a></small>
				                    <small><a href="#">좋아요 ${plannerList.sweet_count}</a></small>
				                    <small><a href="#">즐겨찾기 ${plannerList.bookmark_Count}</a></small>
				                    <p>
				                    	<c:out value="${plannerList.memo}"/>
							        </p>
				                </div>
			            	</div>
		            	</c:forEach>
					</c:if>
		        </div>
		    <!--=== End News Block ===-->
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