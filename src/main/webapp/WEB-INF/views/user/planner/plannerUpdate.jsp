<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/common/jquery.jsp"/>
<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
<meta charset="UTF-8">
<title>타이틀 입력</title>
	<!-- CSS Page Style -->
	<link rel="stylesheet" href="/assets/css/pages/profile.css">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

	<!-- 도시&국가 셀렉트박스 -->
	<script type="text/javascript" src="/script/user/planner/selectedCountry.js"></script>
	<script type="text/javascript" src="/script/user/planner/plannerUpdate.js"></script>
</head>
<style>
.affix {
	top : 0px;
	width : 18.447%;
}
</style>

<body onload="setBackground('${plannerDto.attach_file}')">
	<div class="wrapper">
		<!--=== Header ===-->	
		<div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		</div>
		<!--=== End Header ===-->

		<!--=== Breadcrumbs ===-->
		<div class="breadcrumbs-v1">
			<div class="container" style="height: 50px;">
				<span></span>
				<h1>${plannerDto.title}</h1>
			</div>
		</div>
		<!--=== End Breadcrumbs ===-->
	</div>

	<!--=== Content Part ===-->
	<div class="container content profile" >
		<div class="row">
		<!--Left Sidebar-->
			<nav class="col-sm-3 md-margin-bottom-40" >
				<!-- 사이드 바 메뉴 고정 -->
				<div class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="307" id="sidebar">
					<!--Notification-->
					<div class="tag-box tag-box-v4 rounded-2x margin-bottom-20" style="padding : 7px;">
						<div class="panel-heading-v2 overflow-h">
							<h2 class="heading-xs pull-left"><i class="fa fa-map-marker"></i> Spot</h2>
						</div>
	
						<div class="panel-heading-v2 overflow-h">
							<form class="sky-form">
							<input type="hidden" id="spot_page" value="1"/>
								<!-- 나라 -->
								<label class="select">
									<select name="country_code" id="selectCountry" onchange="selectSpotList(true)">
										<option value=""> Country </option>
										<c:forEach var="country" items="${countryList}" >
											<option value="${country.code}">${country.code_name}</option>
										</c:forEach>
									</select>
									<i></i>
								</label>
	
								<!-- 도시 -->
								<label class="select">
									<select name="city_code" id="selectCity" onchange="selectSpotList(false)">
										<option value=""> City </option>
									</select>
									<i></i>
								</label>
	
								<!-- 명소타입 -->
								<label class="select">
									<select name="spot_type_code" id="selectType" onchange="selectSpotList(false)">
										<option value=""> SpotType </option>
										<c:forEach var="spotType" items="${spotTypeList}">
											<option value="${spotType.code}">${spotType.code_name}</option>
										</c:forEach>
									</select>
									<i></i>
								</label>
							</form>
						</div>
						<hr style="margin : 0px 0px 5px 0px;"/>
	
						<div>
							<ul class="list-unstyled mCustomScrollbar margin-bottom-20" data-mcs-theme="minimal-dark" id="spotLists">
								<c:forEach var="spot" items="${spotList}">
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;" id="spotItem">
										<div id="${spot.spot_no}_item" class="ui-widget-content" style="border:0px;">
											<i style="margin:0;"><img alt="" src="/attatchFile/spot/${spot.spot_photoes[0].save_name}.${spot.spot_photoes[0].extension}" style="width:35px;height:35px;margin-right:5px;"></i>
											<div class="overflow-h">
												<span>
													<strong><a href="javascript:spotReadPage('${spot.spot_no}')">${spot.spot_name}</a></strong>
												</span>
												<span><small><c:out value="${spot.spot_note}"/></small></span>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<button type="button" class="btn-u btn-u-default btn-u-sm btn-block" onclick="selectMoreSpotList()">Load More</button>
						<!--End Notification-->
					</div>
					
					<div class="tag-box tag-box-v4 rounded-2x margin-bottom-20" style="padding : 7px;">
						<form action="#" id="sky-form" class="sky-form">
						<!--Datepicker-->
							<div class="row">
								<section class="col col-3">
									<div id="inline-start"></div>
								</section>
							</div>
						</form>
					<!--End Datepicker-->
					</div>
				</div>
			</nav>
			<!--End Left Sidebar-->

		<!--Tag Box v4-->
		<div class="col-md-9">
			<div class="profile-body margin-bottom-20">
				<form action="/user/planner/writePlanner.do" id="plannerform" class="sky-form" style="border:none;" onsubmit="return false;" method="post" enctype="multipart/form-data">
					<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
					<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
					<input type="hidden" name="mem_no" value="${mem_object.mem_no}">
					<input type="hidden" name="planner_title" value="${plannerDto.title}">
						<div class="tag-box tag-box-v4 rounded-2x margin-bottom-30">
							<label class="textarea">
								<i class="icon-append fa fa-question-circle"></i>
								<textarea name="planner_memo" rows="5" placeholder="부산으로 떠나는 즐거운 여행">${plannerDto.memo}</textarea>
								<b class="tooltip tooltip-top-right">여행에 대한 짧은 메모를 입력해주세요</b>
							</label>
							<div class="row" style="margin-bottom:5px;">
								<div class="col col-4">
									<label class="input">
										<i class="icon-append fa fa-calendar"></i>
										<input type="date" name="start_date" placeholder="Start Date" value="${start_date }">
									</label>
								</div>
								<div class="col col-2" style="padding-left: 0px;">
									<label class="input">
										<input type="number" min="1" value="${day_count}" name="day_count" id="day_count" onchange="addDay(this)" style="padding:5px;width:55px;">
										<input type="hidden" value="${day_count}" id="before_day_count">
									</label>
								</div>
								<div class="col col-2 pull-right">
									<label class="input">
										<i data-toggle="tooltip" title="배경이미지 수정" class="icon-picture input input-file" style="font-size:23px" onclick="addPhoto(this,'${id_value}')"> 
											<div class="button" style="background-color:rgba(255, 255, 255, 0);"><input type="file" name="attach_file" onchange="addPlannerPhoto(this)" accept="image/*" size="0"/></div>
										</i>
									</label>
								</div>
							</div> 
						</div>

						<!-- Day Schedule -->
						<c:set var="item_count" value="${fn:length(itemList)}"/>
						<c:set var="read_count" value="0"/>
						<c:forEach var="i" begin="1" end="${day_count}">
							<div class="tag-box tag-box-v4 rounded-2x margin-bottom-30" id="d${i}_items_div">
								<h2 class="heading-xs" id="d${i}_items_date">Day ${i}</h2>
									<ol class="list-unstyled" id="d${i}_item_ol">
									<c:set var="day_item_count" value="0"/>
									<c:forEach var="index" begin="${read_count}" end="${item_count}">
									<fmt:formatNumber var="day" value="${itemList[index].item_order / 10100}" type="number" maxFractionDigits="0"/>
										<c:if test="${i == day }">
											<c:set var="day_item_count" value="${day_item_count+1}"/>
											<c:set var="id_value" value="d${i}_item${day_item_count}"/>
											<li id="d${i}_item1_li">
											<div class="panel-group">
												<input type="hidden" name="${id_value}_no" value="${itemList[index].item_no}"/>
												<div class="panel panel-default">
													<div class="ui-widget-header dropItem" style="height:52px;">
														<a data-toggle="collapse" href="#collapse_${id_value}">
															<i class="icon-note pull-right"></i>
														</a>
														<h4 class="panel-title">
															<span>Drag spot to add</span>
														</h4>
														<input type="hidden" id="${id_value}_spot_no" name="${id_value}_spot_no" value="0"/>
													</div>
													<div id="collapse_${id_value}" class="panel-collapse collapse">
														<div id="${id_value}_note_div" class="panel-body" style="padding:0px">
															<label class="textarea" style="margin:0">
																<textarea style="border:0px" rows="3" id="${id_value}_note" name="${id_value}_note" placeholder="Write some notes..">${itemList[index].note}</textarea>
															</label>
														</div>
														<input type="hidden" id="${id_value}_money_count" name="${id_value}_money_count" value="0"/>
														<div class="project-share">
															<ul class="list-inline comment-list-v2" style="float: left">
																<li><i data-toggle="tooltip" title="일정삭제" class="icon-trash" style="font-size:23px" onclick="deleteItem('${id_value}')"></i></li>
															</ul>
															<ul class="list-inline comment-list-v2 pull-right">
																<li><i data-toggle="tooltip" title="시간정보 추가" class="icon-hourglass" style="font-size:23px" onclick="addTime('${id_value}')"></i></li>
																<li><i data-toggle="tooltip" title="사진 추가" class="icon-picture input input-file" style="font-size:23px" onclick="addPhoto(this,'${id_value}')">
																<div class="button" style="background-color:rgba(255, 255, 255, 0);"><input type="file" name="${id_value}_attach_photoes" onchange="addPhoto(this,'${id_value}')" accept="image/*"/></div>
																	</i></li>
																<li><i data-toggle="tooltip" title="가계부 추가" class="icon-credit-card" style="font-size:23px" onclick="addMoney('${id_value}')"></i></li>
															</ul>
														</div>
													</div>
												</div>
											</div> 
										</li>
										<c:set var="read_count" value="${index}"/>
									</c:if>
									
									</c:forEach>
								</ol>
								<ul class="bs-glyphicons">	 
									<li style="width:50%; height:100%; padding:0px; border: 0px; text-align: right"><span data-toggle="tooltip" title="일정 추가" class="glyphicon glyphicon-plus-sign" onclick="addItem('d${i}_item')"></span></li> 					 
								</ul>
								<input type="hidden" id="d${i}_item_count" name="d${i}_item_count" value="${day_item_count}">
							</div>
						</c:forEach>
						<button type="button" class="btn-u" id="submit_btn" onclick="">Submit</button>
					</form>
				</div>
			</div>
			<!--End Tag Box v4-->
		</div>
	</div>

	<!-- 동적 입력창을 위한 HTML 레퍼런스값  -->
	<div style="display:none" id="dayDiv">
		<div class="tag-box tag-box-v4 rounded-2x margin-bottom-30" id="d0_items_div">
			<input type="hidden" id="d0_item_count" name="d0_item_count" value="1">
			<h2 class="heading-xs" id="d0_items_date">Day 0</h2>
			<c:set var="id_value" value="d0_item1"/>
			<ol class="list-unstyled" id="d0_item_ol">
				<li id="d0_item1_li">
					<div class="panel-group ">
						<input type="hidden" name="d0_item1_no"/>
						<div class="panel panel-default">
							<div class="ui-widget-header dropItem" style="height:52px;">
								<a data-toggle="collapse" href="#collapse_d0_item1">
									<i class="icon-note pull-right"></i>
								</a>
								<h4 class="panel-title">
									<span>Drag spot to add</span>
								</h4>
								<input type="hidden" id="d0_item1_spot_no" name="d0_item1_spot_no" value="0"/>
							</div>
							<div id="collapse_d0_item1" class="panel-collapse collapse">
								<div id="d0_item1_note_div" class="panel-body" style="padding:0px">
									<label class="textarea" style="margin:0">
										<textarea style="border:0px" rows="3" id="d0_item1_note" name="d0_item1_note" placeholder="Write some notes.."></textarea>
									</label>
								</div>
								<input type="hidden" id="d0_item1_money_count" name="d0_item1_money_count" value="0"/>
								<div class="project-share">
									<ul class="list-inline comment-list-v2" style="float: left">
										<li><i data-toggle="tooltip" title="일정삭제" class="icon-trash" style="font-size:23px" onclick="deleteItem('${id_value}')"></i></li>
									</ul>
									<ul class="list-inline comment-list-v2 pull-right">
										<li><i data-toggle="tooltip" title="시간정보 추가" class="icon-hourglass" style="font-size:23px" onclick="addTime('d0_item1')"></i></li>
										<li><i data-toggle="tooltip" title="사진 추가" class="icon-picture input input-file" style="font-size:23px" onclick="addPhoto(this,'d0_item1')">
										<div class="button" style="background-color:rgba(255, 255, 255, 0);"><input type="file" name="d0_item1_attach_photoes" onchange="addPhoto(this,'d0_item1')" accept="image/*"/></div>
										</i></li>
										<li><i data-toggle="tooltip" title="가계부 추가" class="icon-credit-card" style="font-size:23px" onclick="addMoney('d0_item1')"></i></li>
									</ul>
								</div>
							</div>
						</div>
					</div> 
				</li>
			</ol>
			<ul class="bs-glyphicons">	 
				<li style="width:50%; height:100%; padding:0px; border: 0px; text-align: right"><span data-toggle="tooltip" title="일정 추가" class="glyphicon glyphicon-plus-sign" onclick="addItem('d0_item')"></span></li>
			</ul>
		</div>
	</div>
	<!-- 동적 입력창을 위한 HTML 값 finish -->

	<!-- JS Page Level -->
	<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/datepicker.js"></script>

	<script type="text/javascript">
	jQuery(document).ready(function() {
		App.initScrollBar();
		Datepicker.initDatepicker();
	});
	</script>
</body>
</html>