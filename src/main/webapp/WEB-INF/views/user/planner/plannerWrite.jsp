<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<style>
#div1 {width:350px;height:30px;padding:5px;border:1px solid #aaaaaa;}
</style>
<script type="text/javascript">
var moneyno = 1;
function addMoney(){
	var money = document.getElementById("money");
	var div = document.createElement("div");
	div.id="money"+moneyno;
	div.style.marginTop="3px";
	var noteInput = document.createElement("input");
	noteInput.type="text";
	noteInput.placeholder="예) 기념품";
	div.appendChild(noteInput);
	money.appendChild(div);
	
	var priceInput = document.createElement("input");
	priceInput.style.marginLeft="10px";
	priceInput.type="text";
	priceInput.placeholder="3000";
	div.appendChild(priceInput);
	money.appendChild(div);
}

function writePlanner(form){
	
}

</script>
</head>
<body>
	<c:import url="/user/spot/spotListPage.do"/>
	<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
  	<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${plannerDto.end_date}"/>
	
	<form action="/user/planner/updatePlanner.do" name="plannerForm"  method="post" onsubmit="writePlanner(this)">
		<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
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
		<div id="item">
			<div id="div1" ondrop="drop(event)"  ondragover="allowDrop(event)"></div>
			<textarea rows="10" cols="50" name="item_note" placeholder="메모"></textarea><br/>
			<div id="money">
			
			</div>
			<input type="button" value="가게부추가" onclick="addMoney()"><br/>
		</div>
		<input type="submit" value="저장">
		<input type="button" value="취소">
	</form>
</body>
</html>