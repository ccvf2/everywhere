<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/common/jquery.jsp"/>
<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
<meta charset="UTF-8">
<title>여행계획 쓰기</title>
	<!-- CSS Page Style -->
	<link rel="stylesheet" href="/assets/css/pages/profile.css">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

	<!-- 도시&국가 셀렉트박스 -->
	<script type="text/javascript" src="/script/user/planner/selectedCountry.js"></script>
	<script type="text/javascript" src="/script/user/planner/addPlannerPage.js"></script>
	<script type="text/javascript" src="/script/user/spot/addSpotPage.js"></script>
	<script type="text/javascript" src="/script/user/spot/googleMap.js"></script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
</head>
<style>
.affix {
	top : 0px;
}
</style>
<script type="text/javascript">
$(document).ready(function () {
	$('.nav-stacked').width($('.col-sm-3').width());
});
</script>
<body>
	<div class="wrapper">
		<!--=== Header ===-->	
		<div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		</div>
		<!--=== End Header ===-->

		<!--=== Breadcrumbs ===-->
		<div class="breadcrumbs-v5">
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
				<div class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="445">
					<!--Notification-->
					<div class="tag-box tag-box-v4 rounded-2x margin-bottom-20" style="padding : 7px;">
						<div class="panel-heading-v2 overflow-h">
							<h2 class="heading-xs pull-left"><i class="fa fa-map-marker"></i> 명소</h2>
							<div style="float: right">
							<button type="button" class="btn-u btn-u-red" id="spotAdd_btn" onclick="addSpotPage()">명소추가</button>
							</div>
						</div>
	
						<div class="panel-heading-v2 overflow-h">
							<div class="panel-heading-v2 overflow-h">
								<form class="sky-form" onSubmit="return false;">
									<input type="hidden" id="spot_page" value="1"/>
									<label class="input-group">
										<span class="input">
											<input type="text"  onKeypress="enterSearch(event)" id="searchWord" placeholder="검색할 명소를 입력해주세요"/>
										</span>
										<span class="input-group-btn">
											<button type="button" class="btn-u btn-u-default" style="margin:0px;" onclick="searchSpot()">
											<i class="fa fa-search"></i>
											</button>
										</span>
									</label>
									<!-- 나라 -->
									<label class="select">
										<select name="country_code" id="selectCountry" onchange="selectSpotList(true)">
											<option value=""> 나라 </option>
											<c:forEach var="country" items="${countryList}" >
												<option value="${country.code}">${country.code_name}</option>
											</c:forEach>
										</select>
										<i></i>
									</label>
		
									<!-- 도시 -->
									<label class="select">
										<select name="city_code" id="selectCity" onchange="selectSpotList(false)">
											<option value=""> 도시 </option>
										</select>
										<i></i>
									</label>
		
									<!-- 명소타입 -->
									<label class="select">
										<select name="spot_type_code" id="selectType" onchange="selectSpotList(false)">
											<option value=""> 명소타입 </option>
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
								<ul class="list-unstyled mCustomScrollbar margin-bottom-5" data-mcs-theme="minimal-dark" id="spotLists">
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
							<hr style="margin : 0px 0px 5px 0px;"/>
							<button type="button" class="btn-u btn-u-default btn-u-sm btn-block" id="spotRead" onclick="selectMoreSpotList()">Load More (${spotList.size()}/${totalSpot})</button>
							<!--End Notification-->
						</div>
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
					<input type="hidden" name="planner_title" value="${plannerDto.title}">
						<div class="tag-box tag-box-v4 rounded-2x margin-bottom-30">
							<label class="textarea">
								<i class="icon-append fa fa-question-circle"></i>
								<textarea name="planner_memo" rows="5" placeholder="부산으로 떠나는 즐거운 여행"></textarea>
								<b class="tooltip tooltip-top-right">여행에 대한 짧은 메모를 입력해주세요</b>
							</label>
							<div class="row">
								<div class="col col-4">
									<span>여행시작날짜</span> 
									<label class="input">
										<i class="icon-append fa fa-calendar"></i>
										<input type="date" id="start_date" name="start_date" onchange="selectDate(this)" value="${start_date }">
									</label>
								</div>
								<div class="col col-2" style="padding-left: 0px;">
									<span>여행기간</span> 
									<label class="input">
										<input type="number" min="1" value="${day_count}" name="day_count" id="day_count" onchange="addDay(this)" style="padding:5px;width:55px;">
										<input type="hidden" value="${day_count}" id="before_day_count">
									</label>
								</div>
								<div class="pull-right" style="margin-right: 20px;">
									<span>배경 이미지 수정</span> 
									<label class="input" style="text-align: right">
										<i data-toggle="tooltip" title="배경이미지 수정" class="icon-picture input input-file" style="font-size:23px" onclick="addPhoto(this,'${id_value}')"> 
											<div class="button" style="background-color:rgba(255, 255, 255, 0);"><input type="file" name="attach_file" onchange="addPlannerPhoto(this)" accept="image/*" size="0"/></div>
										</i>
									</label>
								</div>
							</div> 
						</div>

						<!-- Day Schedule -->
						<c:forEach var="i" begin="1" end="${day_count}">
							<div class="tag-box tag-box-v4 rounded-2x margin-bottom-30" id="d${i}_items_div">
								<input type="hidden" id="d${i}_item_count" name="d${i}_item_count" value="1">
								<h2 class="heading-xs" id="d${i}_items_date">Day ${i}</h2>
								<c:set var="id_value" value="d${i}_item1"/>
									<div id="d${i}_item1_div">
									<ol class="list-unstyled">
										<li>
											<div class="panel-group">
												<input type="hidden" name="${id_value}_no"/>
												<div class="panel panel-default">
													<div class="ui-widget-header dropItem" style="height:52px;">
														<a data-toggle="collapse" href="#collapse_${id_value}">
															<i class="icon-note pull-right"></i>
														</a>
														<h4 class="panel-title">
															<span> 명소를 여기로 끌어와 주세요 </span>
														</h4>
														<input type="hidden" id="${id_value}_spot_no" name="${id_value}_spot_no" value="0"/>
													</div>
													<c:set var="collapse" value=""/>
													<c:if test="${i == 1 }">
														<c:set var="collapse" value="in"/>
													</c:if>
													<div id="collapse_${id_value}" class="panel-collapse collapse ${collapse}">
														<div id="${id_value}_note_div" class="panel-body" style="padding:0px">
															<label class="textarea" style="margin:0">
																<textarea style="border:0px" rows="3" id="${id_value}_note" name="${id_value}_note" placeholder="Write some notes.."></textarea>
															</label>
														</div>
														<input type="hidden" id="${id_value}_money_count" name="${id_value}_money_count" value="0"/>
														<div class="project-share">
															<ul class="list-inline comment-list-v2" style="float: left">
																<li>시간 : </li>
																<li><input type="text" name="${id_value}_time" maxlength="20" placeholder="예) 8시 ~ 10시 사이"/> </li>
															</ul>
															<ul class="list-inline comment-list-v2 pull-right">
																<li><i data-toggle="tooltip" title="사진 추가" class="icon-picture input input-file" style="font-size:23px" onclick="addPhoto(this,'${id_value}')">
																<div class="button" style="background-color:rgba(255, 255, 255, 0);"><input type="file" name="${id_value}_attach_photoes" onchange="addPhoto(this,'${id_value}')" accept="image/*"/></div>
																	</i></li>
																<li><i data-toggle="tooltip" title="가계부 추가" class="icon-credit-card" style="font-size:23px" onclick="addMoney('${id_value}')"></i></li>
																<li><i data-toggle="tooltip" title="일정삭제" class="icon-trash" style="font-size:23px" onclick="deleteItem('${id_value}')"></i></li>
															</ul>
														</div>
													</div>
												</div>
											</div> 
										</li>
									</ol>
									<ol class="bs-glyphicons">	 
										<li style="width:100%; height:100%; padding:0px; border: 0px; text-align: center"><span data-toggle="tooltip" title="일정 추가" class="glyphicon glyphicon-plus-sign" onclick="addItem('d${i}_item1')"></span></li> 					 
									</ol>
								</div>
							</div>
						</c:forEach>
						<button type="button" class="btn-u pull-right" id="submit_btn" onclick="checkPlanner()">Submit</button>
						<button type="button" class="btn-u btn-u-default" onclick="window.history.back();">Back</button>
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
			<div id="d0_item1_div">
			<ol class="list-unstyled">
				<li>
					<div class="panel-group ">
						<input type="hidden" name="d0_item1_no"/>
						<div class="panel panel-default">
							<div class="ui-widget-header dropItem" style="height:52px;">
								<a data-toggle="collapse" href="#collapse_d0_item1">
									<i class="icon-note pull-right"></i>
								</a>
								<h4 class="panel-title">
									<span> 명소를 여기로 끌어와 주세요 </span>
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
										<li>시간 : </li>
										<li><input type="text" name="d0_item1_time" maxlength="20" placeholder="예) 8시 ~ 10시 사이"/> </li>
									</ul>
									<ul class="list-inline comment-list-v2 pull-right">
										<li><i data-toggle="tooltip" title="사진 추가" class="icon-picture input input-file" style="font-size:23px" onclick="addPhoto(this,'d0_item1')">
										<div class="button" style="background-color:rgba(255, 255, 255, 0);"><input type="file" name="d0_item1_attach_photoes" onchange="addPhoto(this,'d0_item1')" accept="image/*"/></div>
										</i></li>
										<li><i data-toggle="tooltip" title="가계부 추가" class="icon-credit-card" style="font-size:23px" onclick="addMoney('d0_item1')"></i></li>
										<li><i data-toggle="tooltip" title="일정삭제" class="icon-trash" style="font-size:23px" onclick="deleteItem('d0_item1')"></i></li>
									</ul>
								</div>
							</div>
						</div>
					</div> 
				</li>
			</ol>
			<ol class="bs-glyphicons">	
				<li style="width:100%; height:100%; padding:0px; border: 0px; text-align: center"><span data-toggle="tooltip" title="일정 추가" class="glyphicon glyphicon-plus-sign" onclick="addItem('d0_item1')"></span></li>
			</ol>
			</div>
		</div>
	</div>
	<!-- 동적 입력창을 위한 HTML 값 finish -->
	
	<!--=== Footer Version 1 ===-->
	<div class="footer-v1">
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	</div>
	<!--=== End Footer Version 1 ===-->

	<!-- JS Page Level -->
	<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<script type="text/javascript">
	jQuery(document).ready(function() {
		App.initScrollBar();
	});
	</script>
</body>
</html>