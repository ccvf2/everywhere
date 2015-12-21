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
	<link rel="stylesheet" href="/assets/css/pages/shortcode_timeline2.css">
	<script type="text/javascript">
	function setBackground(image){
		if(image != null){
			$('.breadcrumbs-v1').css('background-image', 'url(/attatchFile/planner/'+image+')');
		}
	}
	</script>
</head>
<body onload="setBackground('${plannerDto.attach_file}')">
	<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
	<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${plannerDto.end_date}"/>
	<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
	<input type="hidden" name="mem_no" value="64" />
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
				<!--멤버프로필 사진 -->
				<c:if test="${mem_object.mem_profile_photo != null || mem_object.mem_profile_photo != '' }">
					<img class="img-responsive profile-img margin-bottom-20" src="${mem_object.mem_profile_photo}" alt="">
				</c:if>
				<c:if test="${mem_object.mem_profile_photo == null || mem_object.mem_profile_photo == '' }">
					<img class="img-responsive profile-img" src="/assets/img/team/img32-md.jpg" alt="">
				</c:if>
				<ul class="list-group sidebar-nav-v1 margin-bottom-40 active">
					<li class="list-group-item list-toggle">
						<a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-buttons">${mem_object.mem_name}</a>
						<ul id="collapse-buttons" class="collapse in">
							<li>
								<a href="shortcode_btn_general.html"><i class="fa fa-flask"></i> 마이페이지 이동</a>
							</li>
							<li>
								<a href="shortcode_btn_brands.html"><i class="fa fa-html5"></i> 쪽지 보내기 </a>
							</li>
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
							<h2>${item.spot.spot_name}</h2>
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
						<div class="panel-group" style="margin:0 0 30px 25%; clear: both; position: relative;">
							<div class="panel panel-default rounded-2x">
								<div class="panel-body">
									<c:if test="${item.item_photoes[0].save_name != null}">
										<div class="row" style="margin:3px;">
											<img class="img-responsive" src="/attatchFile/item/${item.item_photoes[0].save_name}.${item.item_photoes[0].extension}" alt="">
										</div>
									</c:if>
									<c:if test="${item.note != null }">
										<div class="row" style="border:1px solid #EEE;margin:5px;">
											${item.note}
										</div>
										<c:if test="${item.moneyList.size() != 0 }">
											<div class="row">
												<c:forEach var="money" items="${item.moneyList}">
													${money.money_title } ${money.price }
												</c:forEach>
											</div>
										</c:if>
									</c:if>
								</div>
							</div>
						</div>
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