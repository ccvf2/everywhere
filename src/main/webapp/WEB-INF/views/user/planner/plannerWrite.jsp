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
	
	<form action="/user/planner/updatePlanner.do" name="plannerForm"  method="post" onsubmit="writePlanner(this)">
		<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
		<input type="hidden" name="mem_no" value="64" />
		
		여행제목 : <input type="text" name="planner_title" value="${plannerDto.title }"> 
		<input type="radio" name="planner_use_yn" value="Y">공개
		<input type="radio" name="planner_use_yn" value="N">비공개
		<script type="text/javascript">
			for(var i=0;i<plannerForm.planner_use_yn.length;i++){
				if(plannerForm.planner_use_yn[i].value =="${plannerDto.use_yn}"){
					plannerForm.planner_use_yn[i].checked=true;
				}
			}
		</script>
		<br/>	
		여행시작날짜 : <input type="date" class="form-control" name="start_date" value="${start_date}"> 
		여행끝 : <input type="date" class="form-control" name="end_date" value="${end_date }">	<br/>		
		<textarea rows="4" cols="50" name="planner_memo" placeholder="여행설명">${plannerDto.memo}</textarea>
		<br/>
		
		<!-- 총 일자 수는 hidden 으로 처리 -->
		<input type="hidden" name="day_count" value="2"/>
		//--------------------------------------------------<br/>
			<input type="hidden" name="d1_item_count" value="2"/>
		// 첫날 첫번째 일정 <br/>
		<input type="text" name="d1_item1_no" value=""/>
		<input type="text" name="d1_item1_spot_no" value="15"/>
		<input type="text" name="d1_item1_note" value="자금성 역시 대륙의 스케일"/>
		<input type="text" name="d1_item1_attach_photoes" value=""/>
		<input type="text" name="d1_item1_star_score" value=""/>
		<input type="time" name="d1_item1_start_time" value=""/>
		<input type="time" name="d1_item1_end_time" value=""/>
			<input type="hidden" name="d1_item1_money_count" value="1"/>
		<input type="text" name="d1_item1_money1_no" value=""/>
		<input type="text" name="d1_item1_money1_type_code" value="D0006"/>
		<input type="text" name="d1_item1_money1_currency_code" value="E0002"/>
		<input type="text" name="d1_item1_money1_title" value="입장료"/>
		<input type="text" name="d1_item1_money1_price" value="1000"/>
		<br/>
		
		//첫날 두번째 일정 <br/>
		<input type="text" name="d1_item2_no" value=""/>
		<input type="text" name="d1_item2_spot_no" value="11"/>
		<input type="text" name="d1_item2_note" value="경복궁에 한복 입고 놀러가자"/>
		<input type="text" name="d1_item2_attach_photoes" value=""/>
		<input type="text" name="d1_item2_star_score" value=""/>
		<input type="time" name="d1_item2_start_time" value=""/>
		<input type="time" name="d1_item2_end_time" value=""/>
			<input type="hidden" name="d1_item2_money_count" value="2"/>
		<input type="text" name="d1_item2_money1_no" value=""/>
		<input type="text" name="d1_item2_money1_type_code" value="D0006"/>
		<input type="text" name="d1_item2_money1_currency_code" value="E0001"/>
		<input type="text" name="d1_item2_money1_title" value="경복궁 입장료"/>
		<input type="text" name="d1_item2_money1_price" value="3000"/>
		<input type="text" name="d1_item2_money2_no" value=""/>
		<input type="text" name="d1_item2_money2_type_code" value="D0005"/>
		<input type="text" name="d1_item2_money2_currency_code" value="E0001"/>
		<input type="text" name="d1_item2_money2_title" value="경복궁 기념품"/>
		<input type="text" name="d1_item2_money2_price" value="15000"/>
		<br/>
		
		//--------------------------------------------------<br/>
			<input type="hidden" name="d2_item_count" value="3"/>
		// 둘쨋날 첫번째 일정 <br/>
		<input type="text" name="d2_item1_no" value=""/>
		<input type="text" name="d2_item1_spot_no" value="13"/>
		<input type="text" name="d2_item1_note" value="무한도전에서 하하가 길에게 잡힌 곳. 엘레베이터 값이 비싸다."/>
		<input type="text" name="d2_item1_attach_photoes" value=""/>
		<input type="text" name="d2_item1_star_score" value=""/>
		<input type="time" name="d2_item1_start_time" value=""/>
		<input type="time" name="d2_item1_end_time" value=""/>
		<input type="hidden" name="d2_item1_money_count" value="0"/>
		<br/>
		
		//둘쨋날 두번째 일정 <br/>
		<input type="text" name="d2_item2_no" value=""/>
		<input type="text" name="d2_item2_spot_no" value="14"/>
		<input type="text" name="d2_item2_note" value="롯데월드 안전한거 맞아??? 에버랜드 갈까?"/>
		<input type="text" name="d2_item2_attach_photoes" value=""/>
		<input type="text" name="d2_item2_star_score" value=""/>
		<input type="time" name="d2_item2_start_time" value=""/>
		<input type="time" name="d2_item2_end_time" value=""/>
			<input type="hidden" name="d2_item2_money_count" value="1"/>
		<input type="text" name="d2_item2_money1_no" value=""/>
		<input type="text" name="d2_item2_money1_type_code" value="D0007"/>
		<input type="text" name="d2_item2_money1_currency_code" value="E0001"/>
		<input type="text" name="d2_item2_money1_title" value="입장료 할인받음"/>
		<input type="text" name="d2_item2_money1_price" value="17000"/>
		<br/>
		
		//두쨋날 세번째 일정 <br/>
		<input type="text" name="d2_item3_no" value=""/>
		<input type="text" name="d2_item3_spot_no" value="15"/>
		<input type="text" name="d2_item3_note" value="이렇게 넓은 궁이 우리집이었으면"/>
		<input type="text" name="d2_item3_attach_photoes" value=""/>
		<input type="text" name="d2_item3_star_score" value=""/>
		<input type="time" name="d2_item3_start_time" value=""/>
		<input type="time" name="d2_item3_end_time" value=""/>
			<input type="hidden" name="d2_item3_money_count" value="3"/>
		<input type="text" name="d2_item3_money1_no" value=""/>
		<input type="text" name="d2_item3_money1_type_code" value="D0001"/>
		<input type="text" name="d2_item3_money1_currency_code" value="E0002"/>
		<input type="text" name="d2_item3_money1_title" value="비행기값 특가+_+"/>
		<input type="text" name="d2_item3_money1_price" value="15000"/>
		<input type="text" name="d2_item3_money2_no" value=""/>
		<input type="text" name="d2_item3_money2_type_code" value="E0002"/>
		<input type="text" name="d2_item3_money2_currency_code" value="D0007"/>
		<input type="text" name="d2_item3_money2_title" value="길거리공연 팁"/>
		<input type="text" name="d2_item3_money2_price" value="1000"/>		
		<input type="text" name="d2_item3_money3_no" value=""/>
		<input type="text" name="d2_item3_money3_type_code" value="D0004"/>
		<input type="text" name="d2_item3_money3_currency_code" value="E0002"/>
		<input type="text" name="d2_item3_money3_title" value="자금성의 짜장면"/>
		<input type="text" name="d2_item3_money3_price" value="5000"/>
		
		`<br/><br/>
		<input type="submit" value="저장">
		<input type="button" value="취소">
	</form>
</body>
</html>