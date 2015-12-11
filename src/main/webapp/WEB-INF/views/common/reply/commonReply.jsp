<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">
<!-- Web Fonts -->
<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>
<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/user/style.css">
<!-- CSS Header and Footer -->
<link rel="stylesheet" href="/css/user/headers/header-default.css">
<link rel="stylesheet" href="/css/user/footers/footer-v1.css">
<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="/plugins/animate.css">
<link rel="stylesheet" href="/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
<!-- CSS Customization -->
<link rel="stylesheet" href="/css/user/custom.css">


<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<!-- JS Global Compulsory -->
<!-- <script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script> -->
<script type="text/javascript" src="/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/plugins/smoothScroll.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="/script/user/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/script/user/js/app.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    App.init();
});
	function clickTo() {
		$(function() {
			$.ajax({
						/* url : "/common/code/codelist.ajax?code_group=T0001", */
						url : "/common/reply/replylist.ajax?type_code=A00001&item_no=282",
						type : "get",
						dataType : "text",
						success : replyUpdate,
						error : function() {
							alert("hul");
						}
					})
		})
	}
	function replyUpdate(jsonData, status, xhr) {
		//alert(jsonData);
		//var obj = jQuery.parseJSON(jsonData);
		//var obj = JSON.parse(jsonData);
		var arr = new Array();
		arr = JSON.parse(jsonData);
		console.log(arr);
		//alert(obj.common_code.length);
		//alert(obj.common_code[0].code_no);
	}

	function replyDelete() {
		alert("b");
	}
</script>
</head>
<body>
	<div id="replyArea">
		<div id="replywrap">
			<div id="replyWriteArea">
				<input type="text" name="reply_list" maxlength="1000" />
			</div>
			<div id="replyListArea">
				<!-- Recent Comments -->
				<div class="media">
					<h3>Comments</h3>
					<a class="pull-left" href="#"> <img class="media-object"
						src="assets/img/testimonials/img2.jpg" alt="" />
					</a>
					<div class="media-body">
						<h4 class="media-heading">
							Media heading <span>5 hours ago / <a href="#">Reply</a></span>
						</h4>
						<p>Donec id erum quidem rerumd facilis est et expedita
							distinctio lorem ipsum dolorlit non mi portas sats eget metus.
							Fusce dapibus, tellus ac cursus commodo, tortor mauris
							condimentum nibh, ut fermentum massa justo sit amet risus. Etiam
							porta sem malesuada magna..</p>

						<hr>

						<div class="media">
							<a class="pull-left" href="#"> <img class="media-object"
								src="assets/img/testimonials/img5.jpg" alt="" />
							</a>
							<div class="media-body">
								<h4 class="media-heading">
									Media heading <span>17 hours ago / <a href="#">Reply</a></span>
								</h4>
								<p>Donec id erum quidem rerumd facilis est et expedita
									distinctio lorem ipsum dolorlit non mi portas sats eget metus.
									Fusce dapibus, tellus ac cursus commodo, tortor mauris
									condimentum nibh, ut fermentum massa justo sit amet risus.
									Etiam porta sem malesuada magna..</p>
							</div>
						</div>

						<hr>

						<div class="media">
							<a class="pull-left" href="#"> <img class="media-object"
								src="assets/img/testimonials/img1.jpg" alt="" />
							</a>
							<div class="media-body">
								<h4 class="media-heading">
									Media heading <span>2 days ago / <a href="#">Reply</a></span>
								</h4>
								<p>Donec id erum quidem rerumd facilis est et expedita
									distinctio lorem ipsum dolorlit non mi portas sats eget metus.
									Fusce dapibus, tellus ac cursus commodo, tortor mauris
									condimentum nibh, ut fermentum massa justo sit amet risus.
									Etiam porta sem malesuada magna..</p>
							</div>
						</div>
					</div>
				</div>
				<!--/media-->

				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object"
						src="assets/img/testimonials/img4.jpg" alt="" />
					</a>
					<div class="media-body">
						<h4 class="media-heading">
							Media heading <span>July 5,2013 / <a href="#">Reply</a></span>
						</h4>
						<p>Donec id erum quidem rerumd facilis est et expedita
							distinctio lorem ipsum dolorlit non mi portas sats eget metus.
							Fusce dapibus, tellus ac cursus commodo, tortor mauris
							condimentum nibh, ut fermentum massa justo sit amet risus. Etiam
							porta sem malesuada magna..</p>
					</div>
				</div>
				<!--/media-->
				<!-- End Recent Comments -->
			</div>
		</div>
	</div>
	<a href="javascript:clickTo()">눌러봐봐</a>
</body>
</html>