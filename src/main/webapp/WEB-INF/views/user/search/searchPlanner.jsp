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
    <title>스케줄 찾기</title>
	<link rel="stylesheet" href="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
	<!-- 검색 상자 및 컨탠츠 상자 top margin 및 bottom margin 제거 -->
	<style type="text/css">
		.search-block-v2 {
		    margin-bottom: 0px;
		}
	</style>
	<!-- 검색용 css -->
	<link rel="stylesheet" href="/assets/css/pages/page_search_inner.css">
	<!-- CSS Theme-->
	<link rel="stylesheet" href="/assets/css/theme-colors/default.css">
	<!-- JS Page Level -->
	<script src="/assets/js/app.js"></script>

	<script type="text/javascript" src="/script/common/commonReply.js"></script>
	<!-- 제이쿼리 라이브러리.(필수) : commonReplyInit() 함수호출 전 선언  -->
	<script src="/assets/plugins/jquery/jquery.min.js"></script>
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  	<c:import url="/WEB-INF/views/common/jquery.jsp"/>
	<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
  </head>
  <body>
   	<div class="wrapper">
	    <!--=== Header ===-->
	    <!-- Header가 꼭 imprt 되어 있어야 한다.(안그러면화면이깨짐) -->
	    <div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	    </div>
	    <!--=== End Header ===-->

		<!--=== Breadcrumbs ===-->
	    <div class="breadcrumbs breadcrumbs-dark" style="padding: 0px 0px;">
	        <div class="container">
	            <h1 class="pull-left">여행 스케줄</h1>
	            <ul class="pull-right breadcrumb">
	                <li><a href="index.html">홈</a></li>
	                <li><a href="">검색</a></li>
	                <li class="active">스케줄 검색 결과</li>
	            </ul>
	        </div>
	    </div>
	    <!--=== End Breadcrumbs ===-->
	
	    <!--=== Search Block Version 2 ===-->
	    <div class="search-block-v2" style=" margin-bottom: 0px;padding: 20px 0 28px;">
	        <div class="container">
		        <form action="#" id="sky-form" >
			        <div class="row">
			            <div class="col-md-6 col-md-offset-3">
			                <h2>스케줄 검색</h2>
			                <div class="input-group">
			                    <input type="text" class="form-control" placeholder="찾을 스케줄을 검색...">
			                    <span class="input-group-btn">
			                        <button class="btn-u" type="button"><i class="fa fa-search"></i></button>
			                    </span>
			                </div>
			            </div>
	                 </div>
	            </form>
	        </div>
	    </div><!--/container-->
	    <!--=== End Search Block Version 2 ===-->
		
		<div class="container content-sm" style="padding-top:0px;">
		<div class="row">
			<div class="headline"><h2>스케줄 검색 결과</h2></div>
			
		</div>
    	<!-- 스케줄 검색 결과 시작 -->
        <div class="row margin-bottom-20">
	       
	        <div class="blog_masonry_3col">
		        <div class="container content grid-boxes">
		        
		        
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            
		            
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            
		            <div class="col-md-4">
		            <div class="grid-boxes-in">
		                <img class="img-responsive" src="/assets/img/main/img3.jpg" alt="" style="width: 360px; height: 227px;">
		                <div class="grid-boxes-caption">
		                    <h3><a href="#">Unify Clean and Fresh Fully Responsive Template</a></h3>
		                    <ul class="list-inline grid-boxes-news">
		                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
		                        <li>|</li>
		                        <li><i class="fa fa-clock-o"></i> July 06, 2014</li>
		                        <li>|</li>
		                        <li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
		                    </ul>
		                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		                </div>
		            </div>
		            </div>
		            
		            
				</div>
			</div>
        </div>
    	<!-- End Row-->
		<!--  스케줄 검색 결과 끝 -->
		





	     <!--=== Footer Version 1 ===-->
	    <div class="footer-v1">
			<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	    </div>
	    <!--=== End Footer Version 1 ===-->
    </div>
    
     </div>
    <!-- 쪽지함에서 충돌로 인하 주석처리! -->
	<script type="text/javascript" src="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<!-- 쪽지함에서 충돌로 인하 주석처리! -->
	<script type="text/javascript" src="/assets/js/plugins/owl-carousel.js"></script>
  </body>
</html>