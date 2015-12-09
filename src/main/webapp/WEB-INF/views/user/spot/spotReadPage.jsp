<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<script type="text/javascript">
	function updateSpot(spot_no){
		var urlName="/user/spot/updateSpot.do?spot_no="+spot_no;
		location.href=urlName;
	}
	function deleteSpot(spot_no){
		var urlName="/user/spot/delete.do?spot_no="+spot_no;
		var check = confirm("삭제하시겠습니까?");
		if (check == true) {
			location.href=urlName;
		} else {
		   	alert("취소하셨습니다");
		}
		
	}
</script>
</head>
<body>
	<div>
		<c:set var="mem_no" value="1"/>
		<input type="hidden" name="mem_no" value="1">
		<input type="hidden" name="mem_level_code" value="M0002">
		${countryName } ${cityName } ${spot_type } <br/>
		명소명 : ${spotDto.spot_name } <br/>
		한줄설명 : ${spotDto.spot_note } <br/>
		Image : <input type="file"> <br/>
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