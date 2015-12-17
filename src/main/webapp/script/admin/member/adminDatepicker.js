/**
 * admin member 관리 date picker
 * 
 */

//datepicker 관련 초기화
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
