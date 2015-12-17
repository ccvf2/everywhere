<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<!-- --------------------------------css Start------------------------------------- -->
<!-- Favicon -->
<link rel="shortcut icon" href="/assets/favicon.ico">

<!-- Web Fonts -->
<link rel="shortcut" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&subset=cyrillic,latin">

<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="/assets/css/headers/header-default.css">
<link rel="stylesheet" href="/assets/css/footers/footer-v1.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="/assets/plugins/animate.css">
<link rel="stylesheet" href="/assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="/assets/plugins/parallax-slider/css/parallax-slider.css">
<link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
<!-- 쪽지함에서 충돌로 인하 주석처리! -->
<!-- <link rel="stylesheet" href="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css"> -->

<!-- CSS Theme -->
<!-- <link rel="stylesheet" href="/assets/css/theme-colors/default.css"> -->

<!-- CSS Page Style -->
<link rel="stylesheet" href="assets/css/pages/page_log_reg_v1.css">

<!-- CSS Customization -->
<link rel="stylesheet" href="/assets/css/custom.css">
<!-- --------------------------------css End--------------------------------------------------------- -->

<!-- **********************************  javascript  Start ****************************************** -->
<!-- JS Global Compulsory -->
<!-- <script src="/assets/plugins/jquery/jquery.min.js"></script> -->
<script src="/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- JS Implementing Plugins -->
<script src="/assets/plugins/back-to-top.js"></script>
<script src="/assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="/assets/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="/assets/plugins/parallax-slider/js/jquery.cslider.js"></script>
<!-- 쪽지함에서 충돌로 인하 주석처리! -->
<!-- <script type="text/javascript" src="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script> -->
<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
<!-- <script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script> -->
<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.form.min.js"></script>

<!-- JS Customization -->
<script type="text/javascript" src="/assets/js/custom.js"></script>

<!-- JS Page Level -->
<script src="/assets/js/app.js"></script>
<script type="text/javascript" src="/assets/js/forms/reg.js"></script>
<script type="text/javascript" src="/assets/js/forms/login.js"></script>
<script type="text/javascript" src="/assets/js/forms/contact.js"></script>
<script type="text/javascript" src="/assets/js/forms/comment.js"></script>
<!-- 쪽지함에서 충돌로 인하 주석처리! -->
<!-- <script type="text/javascript" src="/assets/js/plugins/owl-carousel.js"></script> -->
<script type="text/javascript" src="/assets/js/plugins/parallax-slider.js"></script>
<script type="text/javascript" src="/assets/js/app.js"></script>

<!-- <script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
    });
</script> -->

<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        RegForm.initRegForm();
        LoginForm.initLoginForm();
        ContactForm.initContactForm();
        CommentForm.initCommentForm();
        });
</script>
</head>
<body>
</body>
</html>