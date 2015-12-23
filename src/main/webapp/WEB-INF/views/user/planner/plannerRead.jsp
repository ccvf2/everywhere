<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<c:import url="/WEB-INF/views/common/jquery.jsp"/>
	<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
	<meta charset="utf-8">
	<title>여행 계획</title>

	<!-- CSS Page Style -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/assets/css/pages/shortcode_timeline2.css">
	
	<script type="text/javascript" src="/script/user/planner/plannerRead.js"></script>
	<style type="text/css">
	.btn-share-group {
		height: 70px;
		padding: 15px 0;
		border-bottom: 1px solid #ddd;
		background: #eee;
		border-radius: 10px 10px 0 0;
		-webkit-border-radius: 10px 10px 0 0;
		-moz-border-radius: 10px 10px 0 0;
	}
	.btn-share-group i{
		font-size:24px;
		text-align: center;
		display: inline-block;;
	}
	.btn-share-group .txt-info{
		display: block;
	}
	.btn-bookmark {
		border-left: 1px solid #ccc;
		border-right: 1px solid #ccc;
	}
	.btn-share-group a {
		display: block;
		float: left;
		width: 33.33%;
		height: 45px;
		line-height: 15px;
		padding-top: 5px;
		text-align: center;
		color: #666;
		text-decoration: none;
		cursor: pointer;
	}
	</style>
	<script type="text/javascript">
	
	</script>
	<script type="text/javascript">
	function spotReadPage(no) {
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
</head>
<body onload="setBackground('${plannerDto.attach_file}', '${plannerDto.planner_no}','${checkSweet}', '${checkBookMark}')">
	<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
	<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${plannerDto.end_date}"/>
	<div class="wrapper">
		<!--=== Header ===-->
		<div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		</div>
	<!--=== End Header ===-->

	<!--=== Breadcrumbs ===-->
	<div class="breadcrumbs-v1">
		<div class="container" style="height: 50px;">
			<span>Blog Item Page</span>
			<h1>${plannerDto.title}</h1>
		</div>
	</div>
	<!--=== End Breadcrumbs ===-->

	<!--=== Content Part ===-->
	<div class="container content">
		<div class="row">
			<!-- Begin Sidebar Menu -->
			<div class="col-md-3">
				<!--글쓴이 정보 -->
				<c:if test="${plannerWriter.mem_profile_photo != null || plannerWriter.mem_profile_photo != '' }">				
					<img class="img-responsive profile-img margin-bottom-20" src="${plannerWriter.mem_profile_photo}" alt="">
				</c:if>
				<c:if test="${plannerWriter.mem_profile_photo == null || plannerWriter.mem_profile_photo == '' }">
					<img class="img-responsive profile-img" src="/assets/img/team/img32-md.jpg" alt="">
				</c:if>
				<ul class="list-group sidebar-nav-v1 margin-bottom-20 active">
					<li class="list-group-item list-toggle">
						<a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-buttons">${plannerWriter.mem_name}</a>
						<c:if test="${mem_object.mem_no != plannerWriter.mem_no}">
						<ul id="collapse-buttons" class="collapse in">
							<li>
								<a href="shortcode_btn_general.html"><i class="fa fa-flask"></i> 마이페이지 이동</a>
							</li>
							<li>
								<a href="shortcode_btn_brands.html"><i class="fa fa-html5"></i> 쪽지 보내기 </a>
							</li>
						</ul>
						</c:if>
						
						<c:if test="${mem_object.mem_no == plannerWriter.mem_no}">
						<ul id="collapse-buttons" class="collapse in">
							<li>
								<a href="shortcode_btn_general.html"><i class="fa fa-flask"></i> 글 공개 여부 설정</a>
							</li>
							<li>
								<a href="shortcode_btn_brands.html"><i class="fa fa-html5"></i> 글 수정 </a>
							</li>
							<li>
								<a href="javascript:deletePlanner('${plannerDto.planner_no}')"><i class="fa fa-html5"></i> 글 삭제 </a>
							</li>
						</ul>
						</c:if>
					</li>
				</ul>

				<div class="btn-share-group">
					<a id="likeBtn" class="btn-like " title="좋아요">
						<span><i class="fa fa-heart-o" ></i><i class="fa fa-heart" style="color:green"></i><span class="plan-detail-view-like-count"> ${sweet_count }</span></span>
						<span class="txt-info">추천</span>
					</a><!-- 좋아요 -->
					<a id="bookmarkBtn" class="btn-bookmark  " title="북마크">
						<span><i class="fa fa-bookmark-o" ></i><i class="fa fa-bookmark" style="color:green"></i><span class="plan-detail-view-bookmark-count"> ${bookmark_count }</span></span>
						<span class="txt-info">북마크</span>
					</a><!-- 북마크 -->
					<a id="customizeBtn" class="btn-customize " title="커스터마이즈">
						<span><i class="fa  fa-files-o" ></i><i class="fa fa-files" style="color:green"></i><span class="plan-detail-view-scrap-count">1</span></span>
						<span class="txt-info">커스터마이즈</span>
					</a><!--커스터마이즈 -->
				</div>

				
				<ul class="list-group sidebar-nav-v1 margin-bottom-20 active">
					<li class="list-group-item list-toggle">
						<a data-toggle="collapse" href="#collapse-money">total : ${moneyTotal[8]}</a>
						<ul id="collapse-money" class="collapse in">
							<li><a><i class="fa fa-plane"></i> 항공료 : ${moneyTotal[0]}</a></li>
							<li><a><i class="fa fa-hotel"></i> 숙박비 : ${moneyTotal[1]} </a></li>
							<li><a><i class="fa fa-bus"></i> 교통비 : ${moneyTotal[2]}</a></li>
							<li><a><i class="fa fa-shopping-bag"></i> 쇼핑비 : ${moneyTotal[3]}</a></li>
							<li><a><i class="fa fa-cutlery"></i> 식사비 : ${moneyTotal[4]}</a></li>
							<li><a><i class="fa fa-ticket"></i> 입장료 : ${moneyTotal[5]}</a></li>
							<li><a><i class="fa fa-gamepad"></i> 오락비 : ${moneyTotal[6]}</a></li>
							<li><a><i class="fa fa-bars"></i> 기  타 : ${moneyTotal[7]}</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- End Sidebar Menu -->

			<!--Tag Box v4-->
			<div class="col-md-9">
				<div class="tag-box tag-box-v4 rounded margin-bottom-40">
					<p>${plannerDto.memo}</p>
				</div>
			</div>
			<!--End Tag Box v4-->

			<!-- Begin Content -->
			<div class="col-md-9">
				<ul class="timeline-v2" >
					<fmt:formatNumber var="count" value="0"/>
					<c:forEach var="item" items="${itemList}">
					<li class="equal-height-columns">
						<fmt:formatNumber var="day" value="${item.item_order / 10100}" type="number" maxFractionDigits="0"/>
						<c:if test="${count < day }">
							<c:set var="count" value="${day}"/>
							<div class="cbp_tmtime equal-height-column" style="width:100%;">
								<span>Day ${day}</span>
								<span style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd(E)" value="${plannerDto.start_date}" /></span>
							</div>
						</c:if>
						<i class="cbp_tmicon rounded-x hidden-xs"></i>
						<c:if test="${item.spot_no != 0 }">
						<div class="cbp_tmlabel equal-height-column">
							<h2><a href="javascript:spotReadPage('${item.spot.spot_no}')">${item.spot.spot_name}</a></h2>
							<div class="row">
								<div class="col-md-4">
									<img class="img-responsive" src="/attatchFile/spot/${item.spot.spot_photoes[0].save_name}.${item.spot.spot_photoes[0].extension}" alt=""> 
									<div class="md-margin-bottom-20"></div>
								</div>
								<div class="col-md-8">
									<p>${item.spot.spot_note}</p>
								</div>
							</div>
						</div>
						</c:if>

						<!-- 글상자 start-->
						<c:if test="${item.note != null }">
							<div class="panel-group" style="margin:0 0 30px 25%; clear: both; position: relative;">
								<div class="panel panel-default rounded-2x">
									<div class="panel-body" style="padding:8px;">
										<c:if test="${item.item_photoes[0].save_name != null}">
											<div class="row" style="margin:5px;">
												<img class="img-responsive" src="/attatchFile/item/${item.item_photoes[0].save_name}.${item.item_photoes[0].extension}" alt="">
											</div>
										</c:if>
										<div class="row" style="margin:5px;">
											${item.note}
										</div>
										<c:if test="${item.moneyList.size() != 0 }">
											<div class="row"  style="margin:5px;">
												<hr style="margin:5px 0px;"/>
												<c:forEach var="money" items="${item.moneyList}">
													<p style="margin:3px">${money.money_title } ${money.price }</p>
												</c:forEach>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</c:if>
						<!-- 글상자 end -->
					</li>
					</c:forEach>
				</ul>
			</div>
			</div>
			<!-- End Content -->
		</div>
	</div><!--/container-->     
	<!--=== End Content Part ===-->

	<!--=== Footer Version 1 ===-->
	<div class="footer-v1">
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	</div>
	<!--=== End Footer Version 1 ===-->
	
</body>
</html>