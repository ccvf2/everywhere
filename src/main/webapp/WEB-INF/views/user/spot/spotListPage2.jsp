<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/script/user/spot/selectedCountry.js"></script>
</head>
<body>
	<div>
		<input type="hidden" name="mem_no" value="1">			
			<input type="hidden" name="mem_level_code" value="M0002">
			<select name="country_code" id="selectCountry" onchange="selectSpotList()">
				<option value=""> ---- </option>
				<c:forEach var="country" items="${countryList}" >
					  <option value="${country.code}">${country.code_name}</option>
				</c:forEach>                                                                     
			</select>
				
			<select name="city_code" id="selectCity" onchange="selectSpotList()">
				<option value=""> ---- </option>
			</select>
			
			<select name="spot_type_code" id="selectType" onchange="selectSpotList()">
				<option value=""> ---- </option>
				<c:forEach var="spotType" items="${spotTypeList}" >
					  <option value="${spotType.code}">${spotType.code_name}</option>
				</c:forEach>         
			</select>
	</div>
	<div>
		<ul id="spotList">
		<c:forEach var="spot" items="${spotList}">
			<li>
				<div>
					<a href="/user/spot/spotReadPage.do?spot_no=${spot.spot_no }">${spot.spot_name } </a> ${spot.spot_note }
				</div>
			</li>
		</c:forEach>
		</ul>
	</div>
</body>
</html>