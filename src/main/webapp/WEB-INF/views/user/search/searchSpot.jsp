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
    <title>명소 찾기</title>
    <link href="/assets/css/pages/blog_masonry_3col.css" rel="stylesheet">
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

	 	<div class="container">
        	<div class="row">
			<!-- Blog Sidebar -->
            <div class="col-md-2">
            
	            <!-- Blog Newsletter -->
	            <div class="blog-newsletter">
	               <div class="headline-v2"></div>
            	 	<form action="#" class="sky-form">
	                    <header>명소 검색</header>
	                    
	                    <fieldset style="padding: 15px 15px 5px;">
	                    	<!-- 지역 찾기 -->
	                    	  <section>
	                            <label class="input">
	                            	<!-- 자동완성 input : works in Chrome, Firefox, Opera and IE10. -->
	                                <input type="text" list="list" placeholder="지역 검색">
	                                <datalist id="list">
	                                	<c:forEach var="country" items="${countryList}">
	                                		<option value="${country.code_name}"></option>
	                                	</c:forEach>
	                                </datalist>
	                            </label>
	                        </section>
	                    	<!-- 명소 검색 -->
	                        <section>
	                            <label class="input">
	                                <input type="text" placeholder="명소 검색">
	                            </label>
	                        </section>
	                    </fieldset>
	                    
	                    
	                    <fieldset style="padding: 15px 15px 5px;">
	                        <section>
	                            <label class="label">명소 종류</label>
	                            <div class="inline-group">
	                            	<label class="checkbox"><input type="checkbox" name="checkbox-inline" checked=""><i></i>전체</label>
	                            	<c:forEach var="spotType" items="${spotTypeList}">
	                            		<label class="checkbox"><input type="checkbox" name="checkbox-inline"><i></i>${spotType.code_name}</label>
	                            	</c:forEach>
	                            </div>
	                        </section>
	                    </fieldset>
	                    
	                  <!--   <footer>
	                        <button type="submit" class="btn-u">Submit</button>
	                        <button type="button" class="btn-u btn-u-default" onclick="window.history.back();">Back</button>
	                    </footer> -->
	                </form>
	                
	                <hr/>
	            </div>
	            <!-- End Blog Newsletter -->
	            
	         </div>
	         <!-- End sideBar -->
	         
	         <!-- 명소 검색 뷰 시작 -->
               <div class="col-md-10">
               		<div class="blog_masonry_3col">
				        <div class="container-fluid content grid-boxes masonry" style="position: relative; height: 2250px; overflow: hidden;">
				            <div class="grid-boxes-in masonry-brick" style="position: absolute; width: 300px; top: 40px; left: 15px;">
				                <img class="img-responsive" src="http://htmlstream.com/preview/unify-v1.8/assets/img/main/img3.jpg" alt="">
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
				
				            <div class="grid-boxes-in masonry-brick" style="position: absolute; width: 300px; top: 932px; left: 15px;">
				                <img class="img-responsive" src="http://htmlstream.com/preview/unify-v1.8/assets/img/main/img1.jpg" alt="">
				                <div class="grid-boxes-caption">
				                    <h3><a href="#">Allan Ingwersen Project</a></h3>
				                    <ul class="list-inline grid-boxes-news">
				                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
				                        <li>|</li>
				                        <li><i class="fa fa-clock-o"></i> July 19, 2014</li>
				                        <li>|</li>
				                        <li><a href="#"><i class="fa fa-comments-o"></i> 12</a></li>
				                    </ul>                
				                    <p>Donec semper tempus nisi felis vel est porttitor interdum. Sed risusdak velit, facilisis et arcu hendrerit, scelerisque iaculis felis...</p>
				                </div>
				            </div>
				
				
				
				            <div class="grid-boxes-in masonry-brick" style="position: absolute; width: 300px; top: 1574px; left: 500px;">
				                <img class="img-responsive full-width" src="http://htmlstream.com/preview/unify-v1.8/assets/img/main/img12.jpg" alt="">
				                <div class="grid-boxes-caption">
				                    <h3><a href="#">Facilisis odio, dapibus ac justo acilisis gestinas</a></h3>
				                    <ul class="list-inline grid-boxes-news">
				                        <li><span>By</span> <a href="#">Kathy Reyes</a></li>
				                        <li>|</li>
				                        <li><i class="fa fa-clock-o"></i> July 22, 2014</li>
				                        <li>|</li>
				                        <li><a href="#"><i class="fa fa-comments-o"></i> 15</a></li>
				                    </ul>                
				                    <p>Donec semper tempus nisi, non gravida augue iaculis ate. Maecenas pharetra turpis est, vitae venenatis eleifend itae amet. Mauris sit amet sapien eget lacus posuere.</p>
				                </div>
				            </div>
				 
				        </div><!--/container-->
				    </div>
               	
               	
                   
               </div>
	         
          	</div>
          	<!-- End Container -->


	     <!--=== Footer Version 1 ===-->
	    <div class="footer-v1">
			<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	    </div>
	    <!--=== End Footer Version 1 ===-->
    </div>
    
    </div>
	<script type="text/javascript" src="/assets/plugins/masonry/jquery.masonry.min.js"></script>
	<script type="text/javascript" src="/assets/js/pages/blog-masonry.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/style-switcher.js"></script>
  </body>
</html>