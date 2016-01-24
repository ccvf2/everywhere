<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>404 Error Page</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/assets/css/pages/page_404_error1.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/assets/css/custom.css">
</head>
<body>

<!--=== Content Part ===-->
<div class="container">
    <!--Error Block-->
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="error-v2">
                <span class="error-v2-title">404</span>
                <span>페이지를 찾을 수 없습니다.</span>
                <p>문제가 계속 될 경우 관리자에 문의하세요. <br></p>
                        <div class="col-md-6 col-md-offset-3">
                            <a class="btn-u btn-brd btn-u-light" href="/user/main/main.do">메인으로 가기</a>
                        </div>
            </div>
        </div>
    </div>
    <!--End Error Block-->
    <!--=== Sticky Footer ===-->
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
	    <div class="container sticky-footer">
	        <p class="copyright-space" style="color: white;">
	            2015 &copy; everywhere Developer Team( SeongUk BAE, HeeJin ANN, SeongGuk KWAK, SeongGwang KIM, JunHo KIM ).
	            <br/> ALL Rights Reserved.
	        </p>
	    </div>
    	</div>
    </div>
    <!--=== End Sticky Footer ===-->
</div><!--/container-->
<!--=== End Content Part ===-->


<!-- JS Global Compulsory -->
<script type="text/javascript" src="/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/assets/plugins/backstretch/jquery.backstretch.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/assets/js/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
    });
</script>
<script type="text/javascript">
    $.backstretch([
      "/assets/img/bg/2.jpg",
      "/assets/img/bg/8.jpg",
      ], {
        fade: 1000,
        duration: 7000
    });
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>