/**
* 
*/
function startSelect(){
	var selectedDate = $('#start').val();
	if(!/^\d{4}\-\d{1,2}\-\d{1,2}$/.test(selectedDate)){
		alert("날짜 형식이 잘못 되었습니다.");
		$('#start').val(0);
		return;
	}
	if(getDays() > 99)
	{
		alert("여행 기간은 99일 이상일 수 없습니다.");
		$('#start').val(0);
		return;
	}
	$('#finish').attr('min', selectedDate);
}
function endSelect(){
	var selectedDate = $('#finish').val();
	if(!/^\d{4}\-\d{1,2}\-\d{1,2}$/.test(selectedDate)){
		alert("날짜 형식이 잘못 되었습니다.");
		$('#finish').val(0);
		return
	}
	if(getDays() > 99)
	{
		alert("여행 기간은 99일 이상일 수 없습니다.");
		$('#finish').val(0);
		return;
	}
	$('#start').attr( 'max', selectedDate);
}
function getDays(){
	var startDate = $('#start').val();
	var finishDate = $('#finish').val();
	
	if(startDate != '' && finishDate != ''){
		var arrDate1 = startDate.split("-");
		var getDate1 = new Date(parseInt(arrDate1[0]),parseInt(arrDate1[1])-1,parseInt(arrDate1[2]));
		
		var arrDate2 = finishDate.split("-");
		var getDate2 = new Date(parseInt(arrDate2[0]),parseInt(arrDate2[1])-1,parseInt(arrDate2[2]));
		
		var getDiffTime = getDate2.getTime() - getDate1.getTime();
		var days = Math.floor(getDiffTime / (1000 * 60 * 60 * 24)) + 1;
		
		return days;
	}
}