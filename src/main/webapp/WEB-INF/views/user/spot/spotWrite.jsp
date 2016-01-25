<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명소 추가</title>
<script type="text/javascript" src="/script/user/spot/selectedCountry.js"></script>
<script type="text/javascript" src="/script/user/spot/addSpotPage.js"></script>
<script type="text/javascript" src="/script/user/spot/xhr.js"></script>
<script type="text/javascript" src="/script/user/spot/googleMap.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
<c:import url="/WEB-INF/views/common/jquery.jsp" />
<c:import url="/WEB-INF/views/user/common/utilImport.jsp" />
<style type="text/css">
html, body, #map  {
	margin: 0;
	padding: 0;
	height: 100%;
}
</style>
<script type="text/javascript">
$(document).ready(function () {
	$('#preview').height($('#preview').width());
	$('#map').width($('#preview').width());
	$('#map').height($('#preview').height());
});
$(document).ready(function(){
	$(window).resize(function(){
		$('#preview').height($('#preview').width());
		$('#map').width($('#preview').width());
		$('#map').height($('#preview').height());
	});
});
</script>
</head>
<body onload="initialize()">
<div class="wrapper">
	<div class="row">
		<!-- Begin Content -->
		<div class="col-md-12">
			<div class="heading heading-v1 margin-bottom-20">
				<h2>명소 추가</h2>
				<p>나만 알고 있는<strong> 멋진 명소 </strong>를 추가해주세요!! </p>
				<p>EveryWhere 친구들에게 추천하고 싶고, 알려주고 싶은 명소를 공유해보아요.</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
		<form action="/user/spot/spotWrite.do" id="sky-form" class="sky-form rounded" onsubmit="return addSpotForm(this)" method="post" enctype="multipart/form-data">
			<fieldset>
				<div class="row">
					<!-- 주소 & 구글맵 -->
					<div class="col col-5">
						<div class="input-group">
							<input type="text" class="form-control" id="address" name="spot_addr" placeholder="address">
							<input type="hidden" id="lat" name="spot_lat"/>
							<input type="hidden" id="lng" name="spot_long"/> <br/>
							<span class="input-group-btn">
								<button class="btn btn-danger" type="button" onclick="toServer()" >search!</button>
							</span>
						</div>
						<div id="map" style="margin-top:5px"></div> 
					</div>

					<!-- 사진 -->
					<div class="col col-5" style="float: right">
						<section>
							<label for="file" class="input input-file">
								<div class="button"><input type="file" id="spot_image" name="spot_image" onchange="readImage(this)" accept="image/*">Add</div><input type="text" readonly>
							</label>
							<img id="preview" style="border:1px solid #D7D7D7; width : 100%;" src="/attatchFile/spot/add_image.png" alt="image"/>
						</section>
					</div>
				</div>
			</fieldset>

			<!-- 명소 종류 선택 -->
			<fieldset>
				<div class="row">
					 <!-- 나라 -->
					<section class="col col-5">	 
						<label class="select">
							<select name="country_code" id="spotSelectCountry" onchange="spotReadCityList('false')">	
								<option value="0" selected disabled>Country</option>
								<c:forEach var="country" items="${countryList}" >
									<option value="${country.code}">${country.code_name}</option>
								</c:forEach> 
							</select>
							<i></i>
						</label>
					</section>
				
					<!-- 도시 -->
					<section class="col col-4">
						<label class="select">
							<select name="city_code" id="spotSelectCity">
								<option value="0" selected disabled>City</option>
							</select>
							<i></i>
						</label>
					</section>

					<!-- 명소타입 -->
					<section class="col col-3">
						<label class="select">
							<select name="spot_type_code">
								<option value="0" selected disabled>명소타입</option>
								<c:forEach var="spotType" items="${spotTypeList}" >
									<option value="${spotType.code}">${spotType.code_name}</option>
								</c:forEach> 
							</select>
							<i></i>
						</label>
					</section>
				</div>
			
				<div class="row">
					<section class="col col-3">
						<label class="input">
							<i class="icon-prepend fa fa-angle-double-down"></i>
							<input type="text" name="spot_name" placeholder="명소명">
						</label>
					</section>
					<section class="col col-9">
						<label class="input">
							<i class="icon-prepend fa fa-info"></i>
							<input type="text" name="spot_note" placeholder="명소 한줄 설명">
						</label>
					</section>
				</div>
			</fieldset>
			<footer>
				<button class="btn-u pull-right" type="submit">명소추가</button>
			</footer>
		</form> 
		</div>
	</div>
</div>
</body>
</html>