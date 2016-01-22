<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/script/user/spot/googleMap.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js"></script>
<link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">
<script type="text/javascript" src="/script/user/spot/selectedCountry.js"></script>

<style type="text/css">
#map {
	height: 500px;
	width: 100%;
}

#spotInfo dd{
	display: block;
	float: left;
	width : 70%;
}
#spotInfo dt{
	display: block;
	float: left;
	width : 30%;
}
</style>
</head>
<body  leftmargin="0" marginwidth="0" topmargin="0" marginheight="0">
	<div class="modal fade" id="spotModalPage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div style="width: 1300px; margin-left: 10%;">
			<div class="modal-dialog modal-lg" style="float: left;">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title" id="myModalLabel1"><c:out value="${spotDto.spot_name}"/></h1>
					</div>

					<div class="modal-body">
						<div class="row">
							<div class="col-md-12">
								<!-- Tab panes -->
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="spot_pic">
										<c:if test="${spotDto.spot_photoes != null}">
											<c:forEach var="photo" items="${spotDto.spot_photoes}">
												<img alt="" src="/attatchFile/spot/${photo.save_name}.${photo.extension}" style="width: 100%; height: 70%;">
											</c:forEach>
										</c:if>
									</div>
									<div role="tabpanel" class="tab-pane" id="spot_maps">
										<div id="map"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#spot_pic" aria-controls="spot_pic" role="tab" data-toggle="tab">사진</a></li>
								<li role="presentation"><a href="#spot_maps" aria-controls="spot_maps" role="tab" data-toggle="tab" id="spot_maps1">위치</a></li>
							</ul>
						</div>
					</div>

					<div class="modal-footer">
						<form action="#" class="sky-form" name="rating-score" style="border: 0px;">
							<span class="pull-left">
								<b>명소 평점 : &nbsp;</b>
							</span>
							<span id="spot-score" class="pull-left">
								(${spotScore} / ${spotDto.count_star_score} 명이 평가하셨습니다.)
							</span>
							<div class="rating">
								<button class="btn-u btn-brd btn-brd-hover rounded-4x btn-u-xs pull-right" type="button" onclick="ratingSpot('${spotDto.spot_no}')"><i class="fa fa-star"></i> 평가하기</button>
								<input type="radio" name="stars-rating" id="stars-rating-5" value="5">
								<label for="stars-rating-5"><i class="fa fa-star"></i></label>
								<input type="radio" name="stars-rating" id="stars-rating-4" value="4">
								<label for="stars-rating-4"><i class="fa fa-star"></i></label>
								<input type="radio" name="stars-rating" id="stars-rating-3" value="3">
								<label for="stars-rating-3"><i class="fa fa-star"></i></label>
								<input type="radio" name="stars-rating" id="stars-rating-2" value="2">
								<label for="stars-rating-2"><i class="fa fa-star"></i></label>
								<input type="radio" name="stars-rating" id="stars-rating-1" value="1">
								<label for="stars-rating-1"><i class="fa fa-star"></i></label>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="modal-dialog modal-sm" style="float: left;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h2 class="modal-title" id="myModalLabel2">기본정보</h2>
					</div>

					<div class="modal-body">
						<div class="row">
							<div class="col-md-12">
								<div>
									<dl id="spotInfo">
									<dt> 카테고리  </dt>
									<dd> ${countryName } ${cityName } ${spot_type } </dd>
									<dt> 명소명  </dt>
									<dd> ${spotDto.spot_name } </dd>
									<dt> 주소  </dt>
									<dd> ${spotDto.spot_addr } </dd>
									<dt> 한줄설명  </dt>
									<dd> ${spotDto.spot_note } </dd>
									</dl>
									<%-- 위도 : ${spotDto.spot_lat } <br/>
									경도 : ${spotDto.spot_long } <br/>  --%>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/script/admin/bootstrap.min.js"></script>
	<script type="text/javascript">
	var spot_no=${spotDto.spot_no};
	var spot_lat = ${spotDto.spot_lat};
	var spot_long = ${spotDto.spot_long };
		$(function() { 
			$('#spotModalPage').modal('show'); // 현재 페이지로 오면, modal 호출

			$('#spotModalPage').on('hide.bs.modal', function() {	// modal close 되면 -> back
				$("#showModal"+spot_no).remove();
			});

			$("#spot_maps1").click(function(){
				markInitialize(spot_lat, spot_long, spot_long);
				resizeMap();
			});
		});
</script> 
</body>
</html>