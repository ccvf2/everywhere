<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/WEB-INF/views/common/jquery.jsp"/>
	<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
	<!-- 공통댓글관련 함수  -->
	<script type="text/javascript" src="/script/common/commonReply.js"></script>
	<meta charset="utf-8">
	<title>여행 계획</title>

	<!-- CSS Page Style -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/assets/css/pages/shortcode_timeline2.css">
	
	<script type="text/javascript" src="/script/user/planner/plannerRead.js"></script>
	<link rel="stylesheet" href="/css/user/planner/plannerRead.css"/>
</head>
<body onload="setPlanner('${plannerDto.attach_file}', '${plannerDto.planner_no}','${checkSweet}', '${checkBookMark}', '${plannerDto.use_yn}')">
	<script type="text/javascript">
	$(document).ready(function() {
		commonReplyInit('R0002', '${mem_object.mem_no}', '${plannerDto.planner_no}','');
		$("#formWrap").removeClass();
		$("#formWrap").addClass("news-v3-in margin-bottom-20");
		$("#formWrapInner").removeClass();
		$("#formWrapInner").addClass("news-v3-in margin-bottom-20");
	});
	</script>
	
	<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
	<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${plannerDto.end_date}"/>
	<div class="wrapper">
		<!--=== Header ===-->
		<div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		</div>
		<!--=== End Header ===-->

		<!--=== Breadcrumbs ===-->
		<div class="breadcrumbs-v5">
			<div class="container" style="height: 50px;">
				<c:if test="${plannerDto.planner_ba_code == 'E0001'}">
					<span>여행 스케줄</span>
				</c:if>
				<c:if test="${plannerDto.planner_ba_code == 'E0002'}">
					<span>여행 리뷰</span>
				</c:if>
				<h1 id="title">${plannerDto.title}</h1>
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
						<img class="img-responsive profile-img margin-bottom-20" src="/attatchFile/member/${plannerWriter.mem_profile_photo}" alt="" style="min-width: 263px; min-height: 265px">
					</c:if>
					<c:if test="${plannerWriter.mem_profile_photo == null || plannerWriter.mem_profile_photo == '' }">
						<img class="img-responsive profile-img" src="/assets/img/team/img32-md.jpg" alt="" style="min-width: 263px; min-height: 265px">
					</c:if>
					<ul class="list-group sidebar-nav-v1 margin-bottom-20 active">
						<li class="list-group-item list-toggle">
							<a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-buttons">${plannerWriter.mem_name}</a>
							<c:if test="${mem_object.mem_no != plannerWriter.mem_no}">
								<ul id="collapse-buttons" class="collapse in">
									<li>
										<a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${plannerWriter.mem_no}"><i class="fa fa-home"></i> 친구페이지 이동</a>
									</li>
									<li>
										<a href="/user/message/messageTalkList.do?recv_mem_no=${plannerWriter.mem_no}"><i class="fa fa-comments-o"></i> 쪽지 보내기 </a>
									</li>
								</ul>
							</c:if>

							<c:if test="${mem_object.mem_no == plannerWriter.mem_no}">
								<ul id="collapse-buttons" class="collapse in">
									<li>
										<a href="javascript:renamePlanner(${plannerDto.planner_no})"><i class="fa fa-pencil"></i> 글  제목 수정 </a>
									</li>
									
									<li id="planner_lock">
										<a href="javascript:lockPlanner(${plannerDto.planner_no}, true)"><i class="fa fa-unlock"></i> 글 공개 ▶  비공개</a>
									</li>
									<li id="planner_unlock">
										<a href="javascript:lockPlanner(${plannerDto.planner_no}, false)"><i class="fa fa-lock"></i> 글 비공개 ▶  공개</a>
									</li>
									<li>
										<a href="javascript:updatePlanner(${plannerDto.planner_no})"><i class="fa fa-pencil-square-o"></i> 글 수정 </a>
									</li>
									<li>
										<a href="javascript:deletePlanner(${plannerDto.planner_no})"><i class="fa fa-trash-o"></i> 글 삭제 </a>
									</li>
								</ul>
							</c:if>
						</li>
					</ul>

					<div class="btn-share-group">
						<a id="likeBtn" class="btn-like " title="좋아요">
							<span><i class="fa fa-heart-o" ></i><i class="fa fa-heart" style="color:green"></i><span class="plan-detail-view-like-count"> ${sweet_count }</span></span>
							<span class="txt-info">좋아요</span>
						</a><!-- 좋아요 -->
						<a id="bookmarkBtn" class="btn-bookmark  " title="즐겨찾기">
							<span><i class="fa fa-bookmark-o" ></i><i class="fa fa-bookmark" style="color:green"></i><span class="plan-detail-view-bookmark-count"> ${bookmark_count }</span></span>
							<span class="txt-info">즐겨찾기</span>
						</a><!-- 즐겨찾기 -->
					</div>

					<ul class="list-group sidebar-nav-v1 margin-bottom-20 active">
						<li class="list-group-item list-toggle">
							<a data-toggle="collapse" href="#collapse-money"><span style="font-weight: bold">총 여행경비 &nbsp; ${moneyTotal[8]}원</span></a>
							<ul id="collapse-money" class="collapse in">
								<li><a><span style="display:inline-block; width: 30%"><i class="fa fa-plane"></i> 항공료  </span> ${moneyTotal[0]}원</a></li>
								<li><a><span style="display:inline-block; width: 30%"><i class="fa fa-hotel"></i> 숙박비  </span>${moneyTotal[1]}원 </a></li>
								<li><a><span style="display:inline-block; width: 30%"><i class="fa fa-bus"></i> 교통비  </span>${moneyTotal[2]}원</a></li>
								<li><a><span style="display:inline-block; width: 30%"><i class="fa fa-shopping-bag"></i> 쇼핑비  </span>${moneyTotal[3]}원</a></li>
								<li><a><span style="display:inline-block; width: 30%"><i class="fa fa-cutlery"></i> 식사비  </span>${moneyTotal[4]}원</a></li>
								<li><a><span style="display:inline-block; width: 30%"><i class="fa fa-ticket"></i> 입장료  </span>${moneyTotal[5]}원</a></li>
								<li><a><span style="display:inline-block; width: 30%"><i class="fa fa-gamepad"></i> 오락비 </span>${moneyTotal[6]}원</a></li>
								<li><a><span style="display:inline-block; width: 30%"><i class="fa fa-bars"></i> 기  타 </span>${moneyTotal[7]}원</a></li>
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

					<ul class="timeline-v2" >
						<fmt:formatNumber var="count" value="0"/>
						<c:forEach var="item" items="${itemList}">
						<li class="equal-height-columns">
							<fmt:formatNumber var="day" value="${item.item_order / 10000}" type="number" maxFractionDigits="0"/>
								<div class="cbp_tmtime equal-height-column" style="width:100%;">
									<c:if test="${count < day }">
										<c:set var="count" value="${day}"/>
										<span>Day ${day}</span>
										<span style="font-size: 15px">${dateList[count-1]}</span>
									</c:if>
									<span style="font-size: 12px">${item.item_time}</span>
								</div>
							<i class="cbp_tmicon rounded-x hidden-xs"></i>
							<c:if test="${item.spot_no != 0 }">
							<div class="cbp_tmlabel equal-height-column">
								<h2><a href="javascript:spotReadPage('${item.spot.spot_no}')">${item.spot.spot_name}</a></h2>
								<div class="row">
									<div class="col-md-4">
										<img class="img-responsive" src="/attatchFile/spot/${item.spot.spot_photoes[0].save_name}.${item.spot.spot_photoes[0].extension}" alt="" style="width: 100%; height: 70%;"> 
										<div class="md-margin-bottom-20"></div>
									</div>
									<div class="col-md-8">
										<p>${item.spot.spot_note}</p>
									</div>
								</div>
							</div>
							</c:if>

							<!-- 글상자 start-->
							<c:if test="${item.note != null || item.item_photoes[0].save_name != null || item.moneyList.size() != 0}">
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
												<c:if test="${item.note != null}">
													<hr style="margin:5px 0px;"/>
												</c:if>
												<div class="row"  style="margin:5px;">
													<c:forEach var="money" items="${item.moneyList}">
														<p style="margin:3px">${money.money_title } ${money.price }원</p>
													</c:forEach>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${item.spot_no == 0 && item.note == null && item.item_photoes[0].save_name == null && item.moneyList.size() == 0}">
								<div class="panel-group" style="margin:0 0 30px 25%; clear: both; position: relative;">
									<div class="panel panel-default rounded-2x">
										<div class="panel-body" style="padding:8px;">
											작성된 일정이 없습니다.
										</div>
									</div>
								</div>
							</c:if>
							<!-- 글상자 end -->
						</li>
						</c:forEach>
					</ul>
					<div id="replyArea">
						<div id="replywrap">
							<div id="replyListArea"></div>
							<c:if test="${mem_object!=null}">
								<div id="replyWriteArea"></div>
							</c:if>
						</div>
					</div>
				</div>
				<!--End Tag Box v4-->
			</div>
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