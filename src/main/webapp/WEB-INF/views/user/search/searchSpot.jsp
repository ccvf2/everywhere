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
    
    <!-- item 3개씩 나오게 -->
    <link href="/assets/css/pages/blog_masonry_3col.css" rel="stylesheet">
    <!-- 사이드바 검색 결과 -->
    <link rel="stylesheet" href="/assets/css/pages/profile.css">
    <link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
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
    
    <script type="text/javascript">
		function spotReadPage(no) {
			//alert(no);
			var makeDiv ="<div id='showModal"+no+"'></div>";
			var requestURL="/user/spot/spotReadPage.do?spot_no="+no;
				$.ajax({
							url : requestURL,
							type : "GET",
							dataType : "html",
							success : function(data) {
								$("body").append(makeDiv);
								$("#showModal"+no).append(data)
							},
							error : function() {
								alert("목록 가져오기 실패");
							}
						})
		}
	</script>
    
    
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
            <div class="col-md-3">
            
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
	                                <input type="text" list="list" name="searchWord1" placeholder="지역 검색">
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
	                                <input type="text" name="searchWord2" placeholder="명소 검색">
	                            </label>
	                        </section>
	                    </fieldset>
	                    
	                    
	                    <fieldset style="padding: 15px 15px 5px;">
	                        <section>
	                            <label class="label">명소 종류</label>
	                            <div class="inline-group">
	                            	<label class="checkbox"><input type="checkbox" name="spot_type_code" checked="checked" value=""><i></i>전체</label>
	                            	<c:forEach var="spotType" items="${spotTypeList}">
	                            		<label class="checkbox"><input type="checkbox" name="spot_type_code" value="${spotType.code}"><i></i>${spotType.code_name}</label>
	                            	</c:forEach>
	                            </div>
	                        </section>
	                    </fieldset>
	                    
	                    <!--   <footer>
	                        <button type="submit" class="btn-u">Submit</button>
	                        <button type="button" class="btn-u btn-u-default" onclick="window.history.back();">Back</button>
	                    </footer> -->
	                </form>
	                
	                
					<%-- <div>
						<ul class="list-unstyled mCustomScrollbar margin-bottom-20" data-mcs-theme="minimal-dark" id="spotLists">
							<c:forEach var="spot" items="${spotList}">
								<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;" id="spotItem">
									<div id="${spot.spot_no}_item" class="ui-widget-content" style="border:0px;">
										<i style="margin:0;"><img alt="" src="/attatchFile/spot/${spot.spot_photoes[0].save_name}.${spot.spot_photoes[0].extension}" style="width:35px;height:35px;margin-right:5px;"></i>
										<div class="overflow-h">
											<span>
												<strong><a href="javascript:spotReadPage('${spot.spot_no}')">${spot.spot_name}</a></strong>
											</span>
											<small><c:out value="${spot.spot_note}"/></small>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
	                 --%>
	                
	                
	              <div class="tag-box tag-box-v4 margin-bottom-20" style="padding : 0px; border: 1px #bbb;">
						<ul class="list-unstyled mCustomScrollbar margin-bottom-20 _mCS_1 mCS-autoHide" data-mcs-theme="minimal-dark" id="spotLists" style="position: relative; overflow: visible;">
							<c:forEach var="spot" items="${spotList}">
								<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
									<div id="${spot.spot_no}_item" class="ui-widget-content" style="border:0px;">
										<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/${spot.spot_photoes[0].save_name}.${spot.spot_photoes[0].extension}" style="width:35px;height:35px;margin-right:5px;"></i>
										<div class="overflow-h">
											<span>
												<strong><a href="javascript:spotReadPage('${spot.spot_no}')">${spot.spot_name}</a></strong>
											</span><br/>
											<small><c:out value="${spot.spot_note}"/></small>
										</div>
									</div>
								</li>
							</c:forEach>
							<!-- <div id="mCSB_1" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" tabindex="0">
								<div id="mCSB_1_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
									<div id="86_item" class="rounded">
										<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/_1450618175316.JPG" style="width:35px;height:35px;margin-right:5px;" class="mCS_img_loaded"></i>
										<div class="overflow-h">
											<span><strong><a href="javascript:spotReadPage(86)">방콕 수완나품 국제공항</a></strong></span><br/>
											<small>공항은 타이 사뭇쁘라깐 주 방플리 군에 위치한 국제 공항이다. 돈므앙 국제공항을 대체하여 새롭게 개항한 방콕의 신 국제공항이다.</small>
										</div>
									</div>
									</li>
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
									<div id="76_item" class="rounded">
										<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/_1450613545522.JPG" style="width:35px;height:35px;margin-right:5px;" class="mCS_img_loaded"></i>
										<div class="overflow-h">
											<span><strong><a href="javascript:spotReadPage(76)">Wat Pho</a></strong></span><br/>
											<small>왓 포는 타이 방콕에 있는 불교 사원으로 공식적으로 "왓 프라 체투폰 위몬 망클라람 랏차워람아하위한" 또는 간단하게 줄여서 ‘왓 포’라고 한다.</small>
										</div>
									</div>
									</li>
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
									<div id="77_item" class="rounded">
										<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/_1450613776530.JPG" style="width:35px;height:35px;margin-right:5px;" class="mCS_img_loaded"></i>
										<div class="overflow-h">
											<span><strong><a href="javascript:spotReadPage(77)">BTS 스카이트레인</a></strong></span><br/>
											<small>BTS 스카이트레인은 타이 방콕의 교통난을 위해 만든 지상철이다</small>
										</div>
									</div>
									</li>
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
									<div id="142_item" class="rounded">
										<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/_1450622979355.JPG" style="width:35px;height:35px;margin-right:5px;" class="mCS_img_loaded"></i>
										<div class="overflow-h">
											<span><strong><a href="javascript:spotReadPage(142)">Wat Phra That Doi Kham</a></strong></span><br/>
											<small>치앙마이를 대표하는 사원!</small>
										</div>
									</div>
									</li>
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
									<div id="113_item" class="rounded">
										<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/_1450621260676.JPG" style="width:35px;height:35px;margin-right:5px;" class="mCS_img_loaded"></i>
										<div class="overflow-h">
											<span><strong><a href="javascript:spotReadPage(113)">오아궁</a></strong></span><br/>
											<small>방콕 왕궁은 타이 방콕에 있는 복합 건축물이다. 정식 명칭은 “프라 보롬 마하 랏차 왕” 이다.</small>
										</div>
									</div>
									</li>
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
									<div id="114_item" class="rounded">
										<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/_1450621356729.JPG" style="width:35px;height:35px;margin-right:5px;" class="mCS_img_loaded"></i>
										<div class="overflow-h">
											<span><strong><a href="javascript:spotReadPage(114)">새벽 사원 (왓 아룬)</a></strong></span><br/>
											<small>왓 아룬(타이어: วัดอรุณ, Wat Arun, 새벽사원)은 타이 방콕 야이 구의 불교 사원으로 차오프라야 강 왼쪽 강변에 있다.</small>
										</div>
									</div>
									</li>
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
									<div id="140_item" class="rounded">
										<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/_1450622773023.JPG" style="width:35px;height:35px;margin-right:5px;" class="mCS_img_loaded"></i>
										<div class="overflow-h">
											<span><strong><a href="javascript:spotReadPage(140)">짐 톰슨 하우스</a></strong></span>
											<small>짐 톰프슨의 집은 타이 방콕에 있는 박물관이다.</small>
										</div>
									</div>
									</li>
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
									<div id="141_item" class="rounded">
										<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/_1450622848659.JPG" style="width:35px;height:35px;margin-right:5px;" class="mCS_img_loaded"></i>
										<div class="overflow-h">
											<span><strong><a href="javascript:spotReadPage(141)">황금 불상 (왓 트라이밋) 사원</a></strong></span>
											<small>황금불상 사원 (Wat Traimit, the Temple of the Golden Buddha)이라고도 한다.</small>
										</div>
									</div>
									</li>
								</div>
							</div> -->
							<div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;">
								<div class="mCSB_draggerContainer">
									<div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; display: block; height: 247px; max-height: 286px; top: 0px;" oncontextmenu="return false;">
										<div class="mCSB_dragger_bar" style="line-height: 50px;">
										</div>
									</div>
									<div class="mCSB_draggerRail">
									</div>
								</div>
							</div>
						</ul>
						<button type="button" class="btn-u btn-u-default btn-u-sm btn-block" onclick="selectMoreSpotList()">Load More</button>
						<!--End Notification-->
					</div>
						              





	             
		               
	            </div>
	            <!-- End Blog Newsletter -->
	            
	         </div>
	         <!-- End sideBar -->
	         
	         <!-- 명소 검색 뷰 시작 -->
               <div class="col-md-9">
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
	<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
	    jQuery(document).ready(function() {
	        App.initScrollBar();
	    });
	</script>
  </body>
</html>