<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/script/user/spot/selectedCountry.js"></script>
<script type="text/javascript" src="/script/user/spot/xhr.js"></script>
<script type="text/javascript" src="/script/user/spot/googleMap.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
<style type="text/css">
#map {
   height: 350px;
   width: 350px;
}
</style>
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function (e) {
            $('#preview').attr('src', e.target.result);
        }
        
        reader.readAsDataURL(input.files[0]);
    }
}

$(document).ready(function(){
	$("#spot_image").change(function(){
	    readURL(this);
	});
});
</script>
</head>
<!-- <body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" onload="initialize();"> -->
<body leftmargin="20" topmargin="20" onload="initialize();">
<form class="addSpotStyle" action="/user/spot/addSpotWrite.do" method="post" onsubmit="return guestForm(this)" enctype="multipart/form-data">
	<input type="text" id="address"  name="spot_addr" placeholder="주소를 입력해주세요" size="38"/> 
	<input type="button" value="클릭" onclick="toServer()" />
	<div id="map"></div>
	<div>	
		<input type="hidden" name="mem_no" value="1">			
		<input type="hidden" name="mem_level_code" value="M0002">
		<select name="country_code" id="selectCountry" onchange="readCityList()">
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
		<div>
			<img id="preview"/>
		</div>
		Image : <input type="file" id="spot_image" name="spot_image">
		<br/>
		// 테스트용 위도경도; 수정금지. 나중에 hidden 으로 바꾸자
		<input type="text" id="lat" name="spot_lat"/>
		<input type="text" id="lng" name="spot_long"/> <br/>
		<input type="submit" value="추가"/>
	</div>		
</form>
</body>
</html>