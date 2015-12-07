<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/script/common/jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/script/common/jquery-ui/jquery-ui.css" />

<script type="text/javascript">
	$(function() {
		$("#start_date").datepicker({
			dateFormat : "yy-mm-dd",
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3,
			prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
			onClose : function(selectedDate) {
				$("#end_date").datepicker("option", "minDate", selectedDate);
			}
		});
		$("#end_date").datepicker({
			dateFormat : "yy-mm-dd",
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3,
			prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
			onClose : function(selectedDate) {
				$("#start_date").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
</script>
</head>
<body>
	<form action="/user/accompany/accompanyWriteOk.do" method="post"
		onsubmit="">
		<input type="hidden" name="accompany_no" value="" />
		<input type="hidden" name="mem_no" value="" />
		<label>제목</label>
		<input type="text" name="title"><br/>
		<br/>
		<label>시작일</label>
		<input type="text" name="start_date" id="start_date" />
		
		<label>종료일</label>
		<input type="text" name="end_date" id="end_date" />
		<input type="radio"	name="gender_code" value="1">남 
		<input type="radio"	name="gender_code" value="2">여 
		<input type="radio"	name="gender_code" value="3" checked="checked">둘 다 
		<br/><br />
		<label>내용</label>
		<textarea rows="14" cols="67" name="content"></textarea>

		<br/>
		<br/>
		<input type="submit" value="글쓰기" />
		<input type="button" value="취소" onclick="location.href='/user/accompany/accompanyList.do'" />
	</form>
</body>
</html>