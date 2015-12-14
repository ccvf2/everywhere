<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<script type="text/javascript" src="/script/user/spot/selectedCountry.js"></script>
<script type="text/javascript" src="/script/user/spot/googleMap.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
<style type="text/css">
#map {
   height: 500px;
   width: 500px;
}
</style>
</head>
<body  leftmargin="0" marginwidth="0" topmargin="0" marginheight="0"
   onload="markInitialize('${spotDto.spot_lat}','${spotDto.spot_long }', '${spotDto.spot_name }');">
	<div id="map"></div>
	<div>
		<c:set var="mem_no" value="1"/>
		<input type="hidden" name="mem_no" value="1">
		<input type="hidden" name="mem_level_code" value="M0002">
		${countryName } ${cityName } ${spot_type } <br/>
		명소명 : ${spotDto.spot_name } <br/>
		한줄설명 : ${spotDto.spot_note } <br/>
		<c:if test="${spotDto.spot_photoes != null}">		
			<c:forEach var="photo" items="${spotDto.spot_photoes}">
				<img alt="" src="/attatchFile/spot/${photo.save_name}.${photo.extension}">
			</c:forEach>
		</c:if>
		주소 : ${spotDto.spot_addr } <br/>
		위도 : ${spotDto.spot_lat } <br/>
		경도 : ${spotDto.spot_long } <br/> 
		<c:if test="${spotDto.mem_no == mem_no }">
			<input type="button" value="수정" onclick="updateSpot('${spotDto.spot_no}')">
		</c:if>
		<c:if test="${spotDto.mem_level_code == 'M0002' }">
			<input type="button" value="삭제" onclick="deleteSpot('${spotDto.spot_no}')">
		</c:if>
		
	</div>
</body>
</html>