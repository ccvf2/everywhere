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
		<form class="addSpotStyle" action="/user/spot/addSpotWrite.do" method="post" onsubmit="return guestForm(this)" enctype="multipart/form-data">
			<input type="hidden" name="mem_no" value="1">			
			<input type="hidden" name="mem_level_code" value="M0002">
			<select name="country_code" id="selectCountry" onchange="readCityToServer()">
				<c:forEach var="country" items="${countryList}" >
					  <option value="${country.code}">${country.code_name}</option>
				</c:forEach>                                                                     
			</select>
				
			<select name="city_code" id="selectCity">
				<option> select </option>
			</select>
			<select name="spot_type_code">
				 <c:forEach var="spotType" items="${spotTypeList}" >
					  <option value="${spotType.code}">${spotType.code_name}</option>
				</c:forEach>         
			</select> <br/>
			명소명 : <input type="text" name="spot_name"/> <br/>
			한줄설명 : <input type="text" name="spot_note"/> <br/>
			Image : <input type="file">
			주소 : <input type="text" name="spot_addr"/> <br/>
			위도 : <input type="text" name="spot_lat"/>
			경도 : <input type="text" name="spot_long"/> <br/>
			<input type="submit" value="추가"/>
		</form>
	</div>	
</body>
</html>