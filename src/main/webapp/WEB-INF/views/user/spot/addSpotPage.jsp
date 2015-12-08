<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${root}/script/user/spot/selectedCountry.js"></script>
</head>
<body>
	<div>
		<div>		
			<select id="selectCountry" onchange="readCityToServer()">
				<c:forEach var="country" items="${countryList}" >
					  <option value="${country}">${country}</option>
				</c:forEach>
			</select>
				
			<select id="selectCity">
				<option> select </option>
			</select>
			<select>
				  <option value="volvo">숙박</option>
				  <option value="saab">교통</option>
				  <option value="mercedes">관광지</option>
				  <option value="audi">공연</option>
				  <option value="audi">쇼핑</option>
				  <option value="audi">액티비티</option>
				  <option value="audi">교통</option>
			</select> <br/>
			명소명 : <input type="text" name="placename" value="장소명"> <br/>
			한줄설명 : <input type="text" name="placememo" value="명소를 한마디로 설명한다면?"> <br/>
			Image : <input type="file">
		</div>
	</div>
</body>
</html>