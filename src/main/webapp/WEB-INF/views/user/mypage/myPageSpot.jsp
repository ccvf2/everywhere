<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/WEB-INF/views/common/jquery.jsp"/>
	<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
	<!-- 공통댓글관련 함수  -->
	<script type="text/javascript" src="/script/common/commonReply.js"></script>
	<meta charset="utf-8">
	<title>명소 찾기</title>
	<!-- CSS Page Style -->
	<link rel="stylesheet" href="/assets/css/pages/profile.css">
	<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
	<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
	</head>
	<body>
	<div class="wrapper">
		<!--=== Header ===-->
		<!-- Header가 꼭 imprt 되어 있어야 한다.(안그러면화면이깨짐) -->
		<div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		</div>
		<!--=== End Header ===-->

		<div class="container content profile">
			<div class="row">
				<!-- Blog Sidebar -->
				<div class="col-md-3 md-margin-bottom-40">
					<c:import url="/WEB-INF/views/user/mypage/myPageLeft.jsp"/>
				</div>
				<!-- End sideBar -->
				
				<!-- 명소 검색 결과 시작 -->
				<div class="col-md-9">
					<div class="shadow-wrapper">
						<div class="tag-box tag-box-v1 box-shadow shadow-effect-2">
							<h2><c:out value="${mem_object.mem_name}님의 명소"></c:out></h2>
						</div>
					</div>
					<form action="/user/spot/mySpotList.do" method="get" class="sky-form">
						<header>검색으로 명소를 더욱 빠르게 찾아보세요</header>
						<div>
							<fieldset>
								<section>
									<div class="input-group">
										<input type="text" class="form-control" name="search" id="search"
											placeholder="검색하실 명소를 입력해주세요." value="${search}"/> <span class="input-group-btn">
											<button class="btn-u btn-block" type="button"
												onclick="javascript:location.href='/user/spot/mySpotList.do?search='+search.value">검색</button>
										</span>
									</div>
								</section>
							</fieldset>
						</div>
					</form>
					검색된 갯수 : <strong><c:out value="${total}"/></strong>&nbsp;개 
					<div class="row margin-bottom-5">
						<c:forEach var="spot" items="${mySpotList}">
							<div class="col-md-4">
								<div class="thumbnails thumbnail-style thumbnail-kenburn" style="border: 1px solid #eee;">
									<div class="thumbnail-img">
										<div class="overflow-hidden" style="height: 165px;">
											<img class="img-responsive" src="/attatchFile/spot/${spot.attach_file}" alt="" style="min-width: 248px; min-height: 165px">
										</div>
										<a class="btn-more hover-effect" href="javascript:spotUpdatePage('${spot.spot_no}', '${currPage}')"><i class="fa fa-question-circle"></i> 수정 </a>
									</div>
									<div class="caption">
										<h3>
											<a class="hover-effect" href="javascript:spotReadPage('${spot.spot_no}')">
												<c:out value="${fn:substring(spot.spot_name, 0,14)}"/>
												<c:if test="${fn:length(spot.spot_name) > 14}">…</c:if>
												<%-- ${list12.spot_name} --%>
											</a>
										</h3>
										
										<ul class="list-inline grid-boxes-news">
											<li title="나라:${spot.country_name}"><i class="fa fa-flag"></i><c:out value="${spot.country_name}"/></li>
											<li>|</li>
											<li title="도시:${spot.city_name}"><i class="fa fa-location-arrow"></i><c:out value="${spot.city_name}"/></li>
											<li>|</li>
											<li title="명소종류:${spot.spot_type_name}"><i class="fa fa fa-info"></i><c:out value="${spot.spot_type_name}"/></li>
										</ul>
										<ul class="list-inline grid-boxes-news">
											
											<li title="주소:${spot.spot_addr}">
												<div style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap">
												<i class="fa fa-map-marker"></i>
												<c:out value="${fn:substring(spot.spot_addr, 0,19)}" escapeXml="false"/>
												<c:if test="${fn:length(spot.spot_addr) >19}">
												…
											</c:if>
												</div>
											</li>
										</ul>
										<p title="${spot.spot_note}">
											<c:out value="${fn:substring(spot.spot_note, 0,19)}" escapeXml="false"/>
											<c:if test="${fn:length(spot.spot_note) >19}">
												…
											</c:if>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- 페이징 시작 -->
					<div class="text-center">
						<c:if test="${total > 0 }">
							<div class="btn-group" role="group" aria-label="First group">
								<nav>
									<ul class="pagination">
									<c:set var="pageBlock" value="5" />
									<c:if test="${startPage > pageBlock}">
										<li>
											<a href="/user/spot/mySpotList.do?spot_page=${startPage-1}" class="btn btn-default" aria-label="Previous">
												<span aria-hidden="true">«</span>
											</a>
										</li>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i!=currPage}">
											<li><a href="javascript:moveSpotPage(${i})" role="button" class="btn btn-default">${i}</a></li>
										</c:if>
										<c:if test="${i==currPage}">
											<li class="active"><a href="/user/spot/mySpotList.do?spot_page=${i}" role="button" class="btn btn-default">${i}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${endPage < pageCount }">
										<li>
										<a href="/user/spot/mySpotList.do?spot_page=${endPage+1}" class="btn btn-default" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
										</li>
									</c:if>
								  </ul>
								</nav>
								<!-- 페이징 끝 -->
							</div>
						</c:if>
					</div>
				</div>
				<!-- 명소 아이템 리스트 끝 -->
			</div>
			<!-- End Container -->
		</div>
		<!--=== Footer Version 1 ===-->
		<div class="footer-v1">
			<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		</div>
		<!--=== End Footer Version 1 ===-->
	</div>
	<!-- JS Page Level -->
	<script src="/assets/js/app.js"></script>
	<script src="/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/script/user/search/searchSpot.js"></script>
	<script type="text/javascript" src="/assets/plugins/masonry/jquery.masonry.min.js"></script>
	<script type="text/javascript" src="/assets/js/pages/blog-masonry.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/style-switcher.js"></script>
	<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
		function spotUpdatePage(no, page){
			location.href="/user/spot/spotUpdate.do?spot_no=" + no + "&page=" + page;
		}
		
		function moveSpotPage(page){
			var search = $("#search").val();
			location.href="/user/spot/mySpotList.do?spot_page=" + page + "&search=" + search;
		}

		function spotReadPage(no) {
			//alert(no);
			var makeDiv ="<div id='showModal"+no+"'></div>";
			var requestURL="/user/spot/spotRead.do?spot_no="+no;
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
		};
	</script>
  </body>
</html>