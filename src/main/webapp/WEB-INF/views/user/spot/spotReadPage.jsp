<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/script/user/spot/googleMap.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js"></script>

<style type="text/css">
#map {
   height: 500px;
   width: 100%;
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
										<c:set var="mem_no" value="1"/>
										<input type="hidden" name="mem_no" value="1">
										<input type="hidden" name="mem_level_code" value="M0002">
										카테고리 : ${countryName } ${cityName } ${spot_type } <br/>
										명소명 : ${spotDto.spot_name } <br/>
										주소 : ${spotDto.spot_addr } <br/>
										한줄설명 : ${spotDto.spot_note } <br/>
										<%-- 위도 : ${spotDto.spot_lat } <br/>
										경도 : ${spotDto.spot_long } <br/>  --%>
										<c:if test="${spotDto.mem_no == mem_no }">
											<input type="button" value="수정" onclick="updateSpot('${spotDto.spot_no}')">
										</c:if>
										<c:if test="${spotDto.mem_level_code == 'M0002' }">
											<input type="button" value="삭제" onclick="deleteSpot('${spotDto.spot_no}')">
										</c:if>
									</div>
								</div>
							</div>
						</div>

						<div class="modal-footer">
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