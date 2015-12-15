<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="/script/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
#spot-list {
	width : 270px;
	border : 1px solid #ddd; 
}

ul li {
	list-style : none;
	border : 1px solid #ddd;
}
</style>    
    
<script type="text/javascript" src="/script/user/spot/selectedCountry.js"></script>
<script type="text/javascript" src="/script/user/spot/dragAndDrop.js"></script>
  </head>
  <body>
   <div>
		<input type="hidden" name="mem_no" value="1">			
			<input type="hidden" name="mem_level_code" value="M0002">
			<select name="country_code" id="selectCountry" onchange="selectSpotList(true)">
				<option value=""> ---- </option>
				<c:forEach var="country" items="${countryList}" >
					  <option value="${country.code}">${country.code_name}</option>
				</c:forEach>                                                                     
			</select>
				
			<select name="city_code" id="selectCity" onchange="selectSpotList(false)">
				<option value=""> ---- </option>
			</select>
			
			<select name="spot_type_code" id="selectType" onchange="selectSpotList(false)">
				<option value=""> ---- </option>
				<c:forEach var="spotType" items="${spotTypeList}" >
					  <option value="${spotType.code}">${spotType.code_name}</option>
				</c:forEach>
			</select>
	</div>
	<div id="spot-list">
		<ul id="spotList">
		<c:forEach var="spot" items="${spotList}">
			<li>
				<div id="${spot.spot_no}item" draggable="true" ondragstart="drag(event)">
					<a href="/user/spot/spotReadPage.do?spot_no=${spot.spot_no }">${spot.spot_name } </a> ${spot.spot_note }
				</div>
			</li>
		</c:forEach>
		</ul>
	</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/script/common/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>