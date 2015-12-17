<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록수정</title>
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/style.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="/assets/plugins/animate.css">
<link rel="stylesheet" href="/assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="/assets/css/pages/profile.css">
<link rel="stylesheet" href="/assets/css/pages/shortcode_timeline1.css">

<!-- CSS Customization -->
<link rel="stylesheet" href="/assets/css/custom.css">

<c:import url="/WEB-INF/views/common/jquery.jsp" />
<c:import url="/WEB-INF/views/user/common/utilImport.jsp" />
</head>
<body>
	<div class="wrapper">
    	<!--=== Header ===-->
    	<div class="header">
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
					<div class="panel panel-u margin-bottom-40">
				    	<div class="panel-heading" style="height:30px;" align="left">
				    		<h3 class="panel-title">No.${visitorDto.visitor_no}</h3>
				    	</div>
				    	<div class="panel-body">
				    		<form class="margin-bottom-40" role="form" action="/user/visitor/visitorUpdate.do" method="post" onsubmit="return visitorForm(this)">
							<input type="hidden" name="visitor_no" value="${visitorDto.visitor_no}"/>
							<input type="hidden" name="pageNumber" value="${pageNumber}"/>
								<div class="form-group" align="left">
									<span>아이디:${mem_no}</span>
								</div>
								<div class="form-group">
									<textarea class="form-control" rows="5" cols="65" name="visitor_content" style="resize:none;">${visitorDto.visitor_content}</textarea>
								</div>
								<div class="form-group" align="right">
									<input type="submit" class="btn-u" value="수정완료"/>
								</div>
							</form>
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