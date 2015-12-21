<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
	<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

	<!-- 도시&국가 셀렉트박스 -->
	<script type="text/javascript" src="/script/user/planner/selectedCountry.js"></script>	
	<script type="text/javascript" src="/script/user/planner/addPlannerPage.js"></script>	
</head>
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
			<div class="col-md-3 md-margin-bottom-40">
				<img class="img-responsive profile-img margin-bottom-20" src="/assets/img/team/img32-md.jpg" alt="">

				<ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
					<li class="list-group-item">
						<a href="page_profile.html"><i class="fa fa-bar-chart-o"></i> Overall</a>
					</li>
					<li class="list-group-item">
						<a href="page_profile_me.html"><i class="fa fa-user"></i> Profile</a>
					</li>
				</ul>

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
											<small><c:out value="${spot.spot_note}"/></small>
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
			<!--End Left Sidebar-->

		<!--Tag Box v4-->
		<div class="col-md-9">
			<div class="profile-body margin-bottom-20">
				<form action="/user/planner/writePlanner.do" id="sky-form" class="sky-form" style="border:none;" onsubmit="" method="post" enctype="multipart/form-data">
					<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
					<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
					<input type="hidden" name="mem_no" value="${mem_object.mem_no}">
					<input type="hidden" name="planner_title" value="${plannerDto.title}">
						<div class="tag-box tag-box-v4 rounded-2x margin-bottom-30">
							<label class="textarea">
								<i class="icon-append fa fa-question-circle"></i>
								<textarea name="planner_memo" rows="5" placeholder="부산으로 떠나는 즐거운 여행"></textarea>
								<b class="tooltip tooltip-top-right">여행에 대한 짧은 메모를 입력해주세요</b>
							</label>
							<div class="row" style="margin-bottom:5px;">   
								<div class="col col-4">
									<label class="input">
										<i class="icon-append fa fa-calendar"></i>
										<input type="text" name="start_date" id="start" placeholder="Start date" value="${start_date}">
									</label>
									</div>
									<div class="col col-2" style="padding-left: 0px;">
										<label class="input">
										<input type="number" min="1" value="${day_count}" name="day_count" id="day_count" onchange="addDay(this)" style="padding:5px;width:55px;">
										<input type="hidden" value="${day_count}" id="before_day_count">
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
									<ol class="list-unstyled" id="d${i}_item_ol">
										<li>
										<div class="panel-group">
											<input type="hidden" name="${id_value}_no"/>
											<div class="panel panel-default">
												<div class="panel-heading ui-widget-header dropItem">
												<a data-toggle="collapse" href="#collapse_${id_value}">
													<i class="icon-note pull-right"></i>
												</a>
													<h4 class="panel-title">
														<span>Add Spot</span>
													</h4>
													<input type="hidden" id="${id_value}_spot_no" name="${id_value}_spot_no" value="0"/>
												</div>
												<div id="collapse_${id_value}" class="panel-collapse collapse">
													<div id="${id_value}_note"class="panel-body" style="padding:0px">
														<label class="textarea" style="margin:0">
															<textarea style="border:0px" rows="3" name="${id_value}_note" placeholder="Write some notes.."></textarea>
														</label>
													</div>
													<input type="hidden" id="${id_value}_money_count" name="${id_value}_money_count" value="0"/>
													<div class="project-share">
														<ul class="list-inline comment-list-v2 pull-right">
															<li><i class="icon-hourglass" style="font-size:23px" onclick="addTime('${id_value}')"></i></li>
															<li><i class="icon-picture input input-file" style="font-size:23px" onclick="addPhoto(this,'${id_value}')">
															<div class="button" style="background-color:rgba(255, 255, 255, 0);"><input type="file" name="${id_value}_attach_photoes" onchange="addPhoto(this,'${id_value}')" accept="image/*"/></div>
																</i></li>
															<li><i class="icon-credit-card" style="font-size:23px" onclick="addMoney('${id_value}')"></i></li>
														</ul>
													</div>
												</div>
											</div>
										</div> 
									</li>
								</ol>
								<ul class="bs-glyphicons">	 
									<li style="width:50%; height:100%; padding:0px; border: 0px; text-align: right"><span class="glyphicon glyphicon-plus-sign" onclick="addItem('d${i}_item')"></span></li> 					 
								</ul>
							</div>
						</c:forEach>
						<button type="submit" class="btn-u" id="submit_btn">Submit</button>
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
				<li>
					<div class="panel-group ">
						<input type="hidden" name="d0_item1_no"/>
						<div class="panel panel-default">
							<div class="panel-heading ui-widget-header dropItem">
								<a data-toggle="collapse" href="#collapse_d0_item1">
									<i class="icon-note pull-right"></i>
								</a>
								<h4 class="panel-title">
									<span>Add Spot</span>
								</h4>
								<input type="hidden" id="d0_item1_spot_no" name="d0_item1_spot_no" value="0"/>
							</div>
							<div id="collapse_d0_item1" class="panel-collapse collapse">
								<div id="d0_item1_note"class="panel-body" style="padding:0px">
									<label class="textarea" style="margin:0">
										<textarea style="border:0px" rows="3" name="d0_item1_note" placeholder="Write some notes.."></textarea>
									</label>
								</div>
								<input type="hidden" id="d0_item1_money_count" name="d0_item1_money_count" value="0"/>
								<div class="project-share">
									<ul class="list-inline comment-list-v2 pull-right">
										<li><i class="icon-hourglass" style="font-size:23px" onclick="addTime('d0_item1')"></i></li>
										<li><i class="icon-picture input input-file" style="font-size:23px" onclick="addPhoto(this,'d0_item1')">
										<div class="button" style="background-color:rgba(255, 255, 255, 0);"><input type="file" name="d0_item1_attach_photoes" onchange="addPhoto(this,'d0_item1')" accept="image/*"/></div>
										</i></li>
										<li><i class="icon-credit-card" style="font-size:23px" onclick="addMoney('d0_item1')"></i></li>
									</ul>
								</div>
							</div>
						</div>
					</div> 
				</li>
			</ol>
			<ul class="bs-glyphicons">	 
				<li style="width:50%; height:100%; padding:0px; border: 0px; text-align: right"><span class="glyphicon glyphicon-plus-sign" onclick="addItem('d0_item')"></span></li>
			</ul>
		</div>
	</div>
	<!-- 동적 입력창을 위한 HTML 값 finish -->

	<!-- JS Implementing Plugins -->
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>

	<script type="text/javascript" src="/assets/js/plugins/style-switcher.js"></script>
	<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/masking.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/datepicker2.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/validation.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/style-switcher.js"></script>

	<script type="text/javascript">
	jQuery(document).ready(function() {
		App.initScrollBar();
		Masking.initMasking();
		Datepicker.initDatepicker();
		Validation.initValidation();
	});
	</script>
</body>
</html>