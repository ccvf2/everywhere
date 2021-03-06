<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
 <html lang="ko-kr">
<head>
	<title>userMain</title>
	<c:import url="/WEB-INF/views/common/jquery.jsp" />
	<c:import url="/WEB-INF/views/user/common/utilImport.jsp" />
	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="/assets/plugins/parallax-slider/css/parallax-slider.css">
	<link rel="stylesheet" href="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">

	<!-- CSS Customization -->
	<link href="/assets/css/pages/blog_masonry_3col.css" rel="stylesheet">
	<script type="text/javascript" src="/script/user/planner/plannerRead.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#searchTotalValue").keypress(function(e) {			//enter검색
			if(e.keyCode == 13) { searchTotal();return false; }
		
		});
		
		
	})
		function menuControll1(str){
			$(document).ready(function() {
				$('#menu1_sub'+str).css("display","");
				$('#menu1_sub'+str).css("position","absolute");
			})
		}
		function menuControll2(str){
			$(document).ready(function() {
				$('#menu2_sub'+str).css("display","");
				$('#menu2_sub'+str).css("position","absolute");
			})
		}

		function menuClose(){
			$(document).ready(function() {
				$('div[id^=menu1_sub]').css("display","none");
				$('div[id^=menu2_sub]').css("display","none");
			})
		}
	</script>
</head>

<body onclick="menuClose()">
	<div class="wrapper">
		<!--=== Header ===-->
		<div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		</div>
		<!--=== End Header ===-->

		<!--=== Slider ===-->
		<div class="slider-inner">
			<div id="da-slider" class="da-slider" style="background: transparent url(${backgroungImg}) repeat 0% 0%;">
			<!-- <div id="da-slider" class="da-slider"> -->
	<%--			 <div class="da-slide">
					<h2><i>떠나세요~</i> <br /> <i>당신을 기다리는</i> <br /> <i>많은곳들</i></h2>
					<p><i>일상에 지치고.. 시간에 쫒기고..</i> <br /> <i>갑시다!</i> <br /> <i>슈우우우우~</i></p>
					<div class="da-img"><img class="img-responsive" src="/attatchFile/admin/forground/${imglist.setting_url}" alt=""></div>
				</div> --%>
				<c:forEach items="${forgroung}" var="imglist">
					<c:out value="${imglist.setting_text}" escapeXml="false"/>
				</c:forEach>

				<div class="da-arrows">
					<span class="da-arrows-prev"></span>
					<span class="da-arrows-next"></span>
				</div>
			</div>
		</div>
		<!--=== End Slider ===-->

		<!--=== Purchase Block ===-->
		<div class="purchase">
			<div class="container">
				<div class="row margin-bottom-5">
					<!-- <div class="col-md-9 animated fadeInLeft">
						<span>Unify is a clean and fully responsive incredible Template.</span>
						<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi  vehicula sem ut volutpat. Ut non libero magna fusce condimentum eleifend enim a feugiat corrupti quos.</p>
					</div>
					<div class="col-md-3 btn-buy animated fadeInRight">
						<a href="#" class="btn-u btn-u-lg"><i class="fa fa-cloud-download"></i> Download Now</a>
					</div> -->
					<form class="sky-form" style="border: 0px; background-color: transparent;">
						<div class="col-md-9 animated fadeInLeft" >
								<label class="input" style="display: -webkit-box;line-height: 34px; font-size: 1.4em;">통합검색 : &nbsp;<input type="text" id="searchTotalValue">
								<a class="btn-u animated fadeInRight" style="margin-left: 5px; display: initial; padding: 9px 15px;" href="javascript:searchTotal()">
									<i class="fa fa-search"></i> 검색
								</a>
								</label>
						</div>
					</form>
				</div>
			</div>
		</div><!--/row-->
		<!-- End Purchase Block -->

		<!--=== Content Part Start ===-->
		<div class="container content-sm">
			<!--=== row Start ===-->
			<div class="row margin-bottom-5">
				<div class="headline"><h2>운영자 추천!</h2></div>

				<div class="blog_masonry_3col" style="padding-bottom: 0px;">
					<div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">

					<div><a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a></div>

 					<c:forEach var="suggetList" items="${suggetList}">
						<div class="col-md-4">
							<span style="position: absolute; margin-left: 8px; font-size: 1.8em; color: #72c02c;" title="운영자 추천">
							<i class="fa fa-certificate" style="color: #ffb300; text-shadow: #ffffff 2px 2px 2px;" ></i>
							<c:choose>
								<c:when test="${suggetList.planner_ba_code eq 'E0001'}">
									<i class="fa fa-calendar-o" title="일정" style="text-shadow: #ffffff 2px 2px 2px;"></i>
								</c:when>
								<c:when test="${suggetList.planner_ba_code eq 'E0002'}">
									<i class="fa fa-check-circle" title="리뷰" style="text-shadow: #ffffff 2px 2px 2px;"></i>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							</span>
							
							<div class="grid-boxes-in  thumbnails thumbnail-style" style="height: 430px;">
								<img class="img-responsive" src="/attatchFile/planner/${suggetList.attach_file}" alt="" onError="this.src='/attatchFile/spot/no_image.jpg'" style="min-height: 50%;max-height: 51%" width="100%">

								<div class="grid-boxes-caption" style="min-height: 180px;">
									<h3><a href="/user/planner/readPlanner.do?planner_no=${suggetList.planner_no}">${suggetList.title}</a></h3>

									<%-- <a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${suggetList.mem_no}">${suggetList.mem_name}</a> --%>
									<a href="javascript:menuControll1('${suggetList.planner_no}')">${suggetList.mem_name}</a>
									<!-- 서브메뉴 -->
									<div class="col-md-3" id="menu1_sub${suggetList.planner_no}" style="display: none;">
										<ul class="dropdown-menu dropdown-show" role="menu">
											<li><a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${suggetList.mem_no}"><i class="fa fa-home"></i>${suggetList.mem_name}님 페이지 보기</a></li>
											<li class="divider"></li>
											<li><a href="/user/message/messageTalkList.do?recv_mem_no=${suggetList.mem_no}"><i class="fa  fa-comments-o"></i>${suggetList.mem_name}님께 쪽지보내기</a></li>
										</ul>
									</div>

									<ul class="list-inline grid-boxes-news">
										<li title="댓글"><a href="#"><i class="fa fa-comments-o"></i><c:out value="${suggetList.reply_Count}" escapeXml="false"/></a></li>
										<li>|</li>
										<li title="좋아요"><a href="#"><i class="fa fa-thumbs-o-up"></i><c:out value="${suggetList.sweet_count}" escapeXml="false"/></a></li>
										<li>|</li>
										<li title="북마크"><a href="#"><i class="fa fa-tags"></i><c:out value="${suggetList.bookmark_Count}" escapeXml="false"/></a></li>
										<li>|</li>
										<li title="작성일"><i class="fa fa-pencil"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${suggetList.reg_date}"/></li>
									</ul>

									<p>
										<c:choose>
											<c:when test="${fn:length(suggetList.memo) >30}">
												<c:out value="${fn:substring(suggetList.memo, 0,30)}" escapeXml="false"/>…
											</c:when>
											<c:when test="${fn:length(suggetList.memo) <40}">
												<c:out value="${suggetList.memo}" escapeXml="false"/>
											</c:when>
										</c:choose>
									</p>
								</div>

								<div style="margin: 1px auto; text-align: center;"><i class="fa fa-clock-o" title="여행기간"></i>&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${suggetList.start_date}"/>&nbsp;~&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${suggetList.end_date}"/></div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
			<!-- End Row-->

			<!-- Info Blokcs -->
			<div class="row margin-bottom-5">
				<div class="headline">
					<h2>좋아요 많은 순</h2>
					<a href="/user/planner/plannerList.do" style="float: right; line-height:50px; font-size: 1.3em;">더보기<i class="fa fa-share"></i></a>
				</div>

				<div class="blog_masonry_3col" style="padding-bottom: 0px;">
					<div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
	 					<c:forEach var="moreLikeList" items="${moreLikeList}">
							<div class="col-md-4">
							<c:choose>
								<c:when test="${moreLikeList.planner_ba_code eq 'E0001'}">
									<span style="position: absolute; margin-left: 8px; font-size: 1.8em; color: #72c02c;" title="일정"><i class="fa fa-calendar-o" style="text-shadow: #ffffff 2px 2px 2px;"></i></span>
								</c:when>
								<c:when test="${moreLikeList.planner_ba_code eq 'E0002'}">
									<span style="position: absolute; margin-left: 8px; font-size: 2em; margin-top: -3px; color: #72c02c;" title="리뷰"><i class="fa fa-check-circle" style="text-shadow: #ffffff 2px 2px 2px;"></i></span>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>

							<div class="grid-boxes-in thumbnails thumbnail-style" style="height: 430px;">
								<img class="img-responsive" src="/attatchFile/planner/${moreLikeList.attach_file}" onError="this.src='/attatchFile/spot/no_image.jpg'" alt="" style="min-height: 50%;max-height: 51%" width="100%">

								<div class="grid-boxes-caption" style="min-height: 180px;">
									<h3><a href="/user/planner/readPlanner.do?planner_no=${moreLikeList.planner_no}">${moreLikeList.title}</a></h3>

<%-- 									<a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${moreLikeList.mem_no}">${moreLikeList.mem_name}</a> --%>
									<a href="javascript:menuControll2('${moreLikeList.planner_no}')">${moreLikeList.mem_name}</a>


								<!-- 서브메뉴 -->
								<div class="col-md-3" id="menu2_sub${moreLikeList.planner_no}" style="display: none;">
									<ul class="dropdown-menu dropdown-show" role="menu">
										<li><a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${moreLikeList.mem_no}"><i class="fa fa-home"></i>${moreLikeList.mem_name}님 페이지 보기</a></li>
										<li class="divider"></li>
										<li><a href="/user/message/messageTalkList.do?recv_mem_no=${moreLikeList.mem_no}"><i class="fa  fa-comments-o"></i>${moreLikeList.mem_name}님께 쪽지보내기</a></li>
									</ul>
								</div>



									<ul class="list-inline grid-boxes-news">
										<li title="댓글"><a href="#"><i class="fa fa-comments-o"></i><c:out value="${moreLikeList.reply_Count}" escapeXml="false"/></a></li>
										<li>|</li>
										<li title="좋아요"><a href="#"><i class="fa fa-thumbs-o-up"></i><c:out value="${moreLikeList.sweet_count}" escapeXml="false"/></a></li>
										<li>|</li>
										<li title="북마크"><a href="#"><i class="fa fa-tags"></i><c:out value="${moreLikeList.bookmark_Count}" escapeXml="false"/></a></li>
										<li>|</li>
										<li title="작성일"><i class="fa fa-pencil"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${moreLikeList.reg_date}"/></li>
									</ul>

									<p>
										<c:choose>
											<c:when test="${fn:length(moreLikeList.memo) >30}">
												<c:out value="${fn:substring(moreLikeList.memo, 0,30)}" escapeXml="false"/>…
											</c:when>
											<c:when test="${fn:length(moreLikeList.memo) <40}">
												<c:out value="${moreLikeList.memo}" escapeXml="false"/>
											</c:when>
										</c:choose>
									</p>
								</div>
								<div style="margin: 1px auto; text-align: center;"><i class="fa fa-clock-o" title="여행기간"></i>&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${moreLikeList.start_date}"/>&nbsp;~&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${moreLikeList.end_date}"/></div>
							</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- End Info Blokcs -->

			<!-- Info Blokcs -->
<%-- 			<div class="row margin-bottom-5">
				<div class="headline">
					<h2>핫 플레이스!</h2>
					<a href="/user/search/searchSpot.do" style="float: right; line-height:50px; font-size: 1.3em;">더보기<i class="fa fa-share"></i></a>
				</div>

				<div class="blog_masonry_3col" style="padding-bottom: 0px;">
					<div class="container content grid-boxes" style="padding-top: 0px; padding-bottom: 0px;">
	 					<c:forEach var="list1" items="${spotList}">
							<div class="col-md-4">
								<div class="grid-boxes-in" style="height: 430px;">
									<a href="javascript:spotReadPage('${list1.spot_no}')"><img class="img-responsive" src="/attatchFile/spot/${list1.attach_file}" alt="${list1.spot_name}" onError="this.src='/attatchFile/spot/no_image.jpg'" height="80%" width="100%" style="max-height: 232px"></a>

									<div class="grid-boxes-caption">
										<h3><a href="javascript:spotReadPage('${list1.spot_no}')">${list1.spot_name}</a></h3>

										<ul class="list-inline grid-boxes-news">
											<li title="별점 / 등록한 사람"><i class="fa fa-star"></i><c:out value="${list1.star_score}"/> / <i class="fa fa-users"></i>&nbsp;<c:out value="${list1.count_star_score}"/></li>
											<li>|</li>
											<li title="나라:${list1.country_name}"><i class="fa fa-flag"></i><c:out value="${list1.country_name}"/></li>
											<li>|</li>
											<li title="도시:${list1.city_name}"><i class="fa fa-location-arrow"></i><c:out value="${list1.city_name}"/></li>
											<li>|</li>
											<li title="명소종류:${list1.spot_type_name}"><i class="fa fa fa-info"></i><c:out value="${list1.spot_type_name}"/></li>
											<li>|</li>
											<li title="주소:${list1.spot_addr}">
												<i class="fa fa-map-marker"></i>
												<c:out value="${fn:substring(list1.spot_addr, 0,40)}"/>
												<c:if test="${fn:length(list1.spot_addr) >40}">…</c:if>
											</li>
										</ul>

										<p>
											<c:out value="${fn:substring(list1.spot_note, 0,50)}" escapeXml="false"/>
											<c:if test="${fn:length(list1.spot_note) >50}">
												…
											</c:if>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div> --%>
			<!-- End Info Blokcs -->






	<!-- Recent Works -->
		<div class="headline">
		<h2>핫 플레이스!</h2>
		<a href="/user/search/searchSpot.do" style="float: right; line-height:50px; font-size: 1.3em;">더보기<i class="fa fa-share"></i></a>
		</div>
		<div class="row margin-bottom-5">
			<c:forEach var="list12" items="${spotList}">
				<div class="col-md-3 col-sm-6">
					<div class="thumbnails thumbnail-style thumbnail-kenburn" style="border: 1px solid #eee;">
						<div class="thumbnail-img">
							<div class="overflow-hidden" style="height: 165px;">
								<img class="img-responsive" src="/attatchFile/spot/${list12.attach_file}" alt="" style="min-width: 248px; min-height: 165px">
							</div>
							<a class="btn-more hover-effect" href="javascript:spotReadPage('${list12.spot_no}')"><i class="fa fa-question-circle"></i> 보기</a>
						</div>
						<div class="caption">
							<h3>
								<a class="hover-effect" href="javascript:spotReadPage('${list12.spot_no}')">
									<c:out value="${fn:substring(list12.spot_name, 0,15)}"/>
									<c:if test="${fn:length(list12.spot_name) >15}">…</c:if>
									<%-- ${list12.spot_name} --%>
								</a>
							</h3>
							
							<ul class="list-inline grid-boxes-news">
								<li title="별점 / 등록한 사람"><i class="fa fa-star"></i><c:out value="${list12.star_score}"/> / <i class="fa fa-users"></i>&nbsp;<c:out value="${list12.count_star_score}"/></li>
								<li>|</li>
								<li title="나라:${list12.country_name}"><i class="fa fa-flag"></i><c:out value="${list12.country_name}"/></li>
								<li>|</li>
								<li title="도시:${list12.city_name}"><i class="fa fa-location-arrow"></i><c:out value="${list12.city_name}"/></li>
								<li>|</li>
							</ul>
							<ul class="list-inline grid-boxes-news">
								<li title="명소종류:${list12.spot_type_name}"><i class="fa fa fa-info"></i><c:out value="${list12.spot_type_name}"/></li>
								<li>|</li>
								<li title="주소:${list12.spot_addr}">
									<i class="fa fa-map-marker"></i>
									<c:out value="${fn:substring(list12.spot_addr, 0,10)}"/>
									<c:if test="${fn:length(list12.spot_addr) >10}">…</c:if>
								</li>
							</ul>
							
							<p title="${list12.spot_note}">
								<c:out value="${fn:substring(list12.spot_note, 0,20)}" escapeXml="false"/>
								<c:if test="${fn:length(list12.spot_note) >20}">
									…
								</c:if>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	<!-- End Recent Works -->





		</div>
		<!--=== Content Part End ===-->




		<!--=== Footer Version 1 ===-->
		<div class="footer-v1">
			<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		</div>
		<!--=== End Footer Version 1 ===-->
	</div>
	<!--/wrapper-->

<!-- JS Global Compulsory -->
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="/assets/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="/assets/plugins/parallax-slider/js/jquery.cslider.js"></script>
<script type="text/javascript" src="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/assets/js/plugins/owl-carousel.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		//App.init();
		OwlCarousel.initOwlCarousel();
		ParallaxSlider.initParallaxSlider();
	});
</script>
</body>
</html>