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
				<div class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="307">
					<!--Notification-->
					<div class="tag-box tag-box-v4 rounded-2x margin-bottom-20" style="padding : 7px;">
						<div class="panel-heading-v2 overflow-h">
							<h2 class="heading-xs pull-left"><i class="fa fa-map-marker"></i> 명소</h2>
							<div style="float: right">
							<button type="button" class="btn-u btn-u-red" id="spotAdd_btn" onclick="addSpot()">명소추가</button>
							</div>
						</div>
	
						<div class="panel-heading-v2 overflow-h">
							<form class="sky-form">
							<input type="hidden" id="spot_page" value="1"/>
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
			</nav>
			<!--End Left Sidebar-->

		<!--Tag Box v4-->
		<div class="col-md-9">
			<div class="profile-body margin-bottom-20">
				<form action="/user/planner/updatePlanner.do" id="plannerform" name="updateForm" class="sky-form" style="border:none;" onsubmit="return false;" method="post" enctype="multipart/form-data">
					<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
					<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
					<input type="hidden" name="mem_no" value="${mem_object.mem_no}">
					<input type="hidden" name="planner_title" value="${plannerDto.title}">
						<div class="tag-box tag-box-v4 rounded-2x margin-bottom-30">
							<label class="textarea">
								<i class="icon-append fa fa-question-circle"></i>
								<textarea name="planner_memo" rows="5" placeholder="부산으로 떠나는 즐거운 여행">${fn:replace(plannerDto.memo, '<br/>', '&#0013;')}</textarea>
								<b class="tooltip tooltip-top-right">여행에 대한 짧은 메모를 입력해주세요</b>
							</label>
							<div class="row">
								<div class="col col-4">
									<span>여행시작날짜</span> 
									<label class="input">
										<i class="icon-append fa fa-calendar"></i>
										<input type="date" name="start_date" placeholder="Start Date" value="${start_date }">
									</label>
								</div>
								<div class="col col-2" style="padding-left: 0px;">
									<span>여행기간</span> 
									<label class="input">
										<input type="number" min="1" value="${dayCount}" name="day_count" id="day_count" onchange="addDay(this)" style="padding:5px;width:55px;">
										<input type="hidden" value="${dayCount}" id="before_day_count">
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
						<fmt:formatNumber var="count" value="0"/>
						<c:forEach var="i" begin="1" end="${dayCount}">
							<div class="tag-box tag-box-v4 rounded-2x margin-bottom-30" id="d${i}_items_div">
								<input type="hidden" id="d${i}_item_count" name="d${i}_item_count" value="${dayItemCount[i-1]}">
								<h2 class="heading-xs" id="d${i}_items_date">Day ${i}</h2>
								<c:forEach var="j" begin="1" end="${dayItemCount[i-1]}" step="1">
								<c:set var="item" value="${itemList[count]}"/>
								<c:set var="id_value" value="d${i}_item${j}"/>
									<div id="d${i}_item${j}_div">
									<ol class="list-unstyled">
										<li>
										<div class="panel-group">
											<input type="hidden" name="${id_value}_no" value="${item.item_no}"/>
											<div class="panel panel-default">
												<c:if test="${item.spot_no != 0 }">
													<div class="ui-widget-header" style="height:52px;">
														<a data-toggle="collapse" href="#collapse_${id_value}">
															<i class="icon-note pull-right"></i>
														</a>
														<div>
															<i style="margin:0;"><img alt="" src="/attatchFile/spot/${item.spot.spot_photoes[0].save_name}.${item.spot.spot_photoes[0].extension}" style="width:35px;height:35px;margin-right:5px;"></i>
															<div class="overflow-h">
																<span>
																	<strong><a href="javascript:spotReadPage('${item.spot.spot_no}')">${item.spot.spot_name}</a></strong>
																</span>
																<span><small><c:out value="${item.spot.spot_note}"/></small></span>
															</div>
														</div>
														<input type="hidden" id="${id_value}_spot_no" name="${id_value}_spot_no" value="${item.spot.spot_no}"/>
													</div>
												</c:if>
												<c:if test="${item.spot_no == 0 }">
													<div class="ui-widget-header dropItem" style="height:52px;">
														<a data-toggle="collapse" href="#collapse_${id_value}">
															<i class="icon-note pull-right"></i>
														</a>
															<h4 class="panel-title">
																<span> 명소를 여기로 끌어와 주세요 </span>
															</h4>
														<input type="hidden" id="${id_value}_spot_no" name="${id_value}_spot_no" value="0"/>
													</div>
												</c:if>
												<div id="collapse_${id_value}" class="panel-collapse collapse in">
													<div id="${id_value}_note_div" class="panel-body" style="padding:0px">
														<c:if test="${item.attach_photoes != null }">
															<div id="${id_value}_photo" class="panel-body">
																<img id="${id_value}_preview" src="/attatchFile/item/${item.item_photoes[0].save_name}.${item.item_photoes[0].extension}" width="400" height="300">
															</div>
														</c:if>
														<label class="textarea" style="margin:0">
															<textarea style="border:0px" rows="3" id="${id_value}_note" name="${id_value}_note" placeholder="Write some notes..">${fn:replace(item.note, '<br/>', '&#0013;')}</textarea>
														</label>
													</div>
													<c:if test="${item.moneyList.size() != 0 }">
														<div id="${id_value}_money_div" class="panel-body" style="border-top-style: solid; border-top-width: 1px; border-top-color: rgb(238, 238, 238);">
															<c:forEach var="money" items="${item.moneyList}">
																<div style="margin-top: 3px;">
																	<input type="hidden" name="${id_value}_money1_no" value="${money.money_no}">
																	<input type="hidden" name="${id_value}_money1_currency_code" value="P0001">
																	<label class="select col col-3">
																		<select name="${id_value}_money1_type_code">
																			<option value="D0001">항공</option>
																			<option value="D0002">숙박</option>
																			<option value="D0003">교통</option>
																			<option value="D0004">쇼핑</option>
																			<option value="D0005">식사</option>
																			<option value="D0006">입장료</option>
																			<option value="D0007">오락</option>
																			<option value="D0008">기타</option>
																		</select>
																		<script type="text/javascript">
																			updateForm.${id_value}_money1_type_code.value="${money.money_type_code}";
																		</script>
																		<i></i>
																	</label>
																	<label class="input col col-5">
																		<input type="text" class="col col-5" name="${id_value}_money1_title" placeholder="예) 기념품" value="${money.money_title}">
																	</label>
																	<label class="input col col-4">
																		<input type="number" class="col col-4" name="${id_value}_money1_price" placeholder="3000" style="margin-left: 10px;" value="${money.price}">
																	</label>
																</div>
															</c:forEach>
														</div>
													</c:if>
													<input type="hidden" id="${id_value}_money_count" name="${id_value}_money_count" value="${item.moneyList.size()}"/>
													<div class="project-share">
														<ul class="list-inline comment-list-v2" style="float: left">
															<li>시간 : </li>
															<li><input type="text" name="${id_value}_time" maxlength="20" placeholder="예) 8시 ~ 10시 사이"/ value="${item.item_time}"> </li>
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
								<fmt:formatNumber var="count" value="${count+1}"/>
								</c:forEach>
							</div>
						</c:forEach>
						<button type="button" class="btn-u" id="submit_btn" onclick="checkPlanner()">Submit</button>
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

	<!-- JS Page Level -->
	<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<script type="text/javascript">
	jQuery(document).ready(function() {
		App.initScrollBar();
	});
	</script>
</body>
</html>