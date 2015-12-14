<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
	<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
  	<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${plannerDto.end_date}"/>  		
		
	<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
	<input type="hidden" name="mem_no" value="64" />
	
	여행제목 : ${plannerDto.title } <br/> 
	공개여부 : <c:if test="${plannerDto.use_yn == 'Y'}">공개</c:if>
			<c:if test="${plannerDto.use_yn == 'N'}">비공개</c:if> <br/>
	스케줄타입 : <c:if test="${plannerDto.planner_ba_code == 'P0002'}">여행스케줄</c:if>
	         <c:if test="${plannerDto.planner_ba_code == 'P0001'}">여행리뷰</c:if> <br/>
	여행시작날짜 : ${plannerDto.start_date} <br/> 
	여행끝날짜 : ${plannerDto.end_date} <br/>
	간단설명 : ${plannerDto.memo } <br/>
	
	<c:forEach var="item" items="${itemList}">
		Day 
		<c:set var="day" value="${item.item_order / 10100}" />
		<fmt:formatNumber value="${day}" type="number" maxFractionDigits="0"/> /		
		<c:set var="order" value="${item.item_order%100}"/> ${order} <br/>
		명소 이름 : ${item.spot.spot_name} <br/>
		명소 설명 : ${item.spot.spot_note } <br/>
		내 메모 : ${item.note} <br/>
		내별점 : ${item.item_star_score} <br/>
		<c:if test="${!empty item.start_time}">
			시작시간 : ${item.start_time} <br/>
		</c:if>
		<c:if test="${!empty item.end_time}">
			끝시간 : ${item.end_time} <br/>
		</c:if>
		가계부 : <br/>
		<c:forEach var="money" items="${item.moneyList}">			
			${money.money_title} : ${money.price } <br/>
		</c:forEach>
		<br/>
	</c:forEach>
	<br/><br/>
<input type="button" value="modify" onclick="location.href='/user/planner/writePlanner.do?planner_no=${plannerDto.planner_no}'">
<input type="button" value="delete" onclick="location.href='/user/planner/deletePlanner.do?planner_no=${plannerDto.planner_no}'">
</body>
</html>