/**
* 
*/
$(function() {
	setDraggable()
	setDroppable();
});

function setDraggable(){
	$( "#spotItem > div" ).draggable({
		appendTo: "body",
		containment: "document",
		revert: "invalid",
		helper: "clone"
	});
}

function setDroppable(){
	$( ".dropItem" ).droppable({
		accept: "#spotItem > div",
		activeClass: "ui-state-active",
		hoverClass: "ui-state-highlight",
		drop: function( event, ui ) {
			$(event['target']).droppable('disable');
			$( this ).find("input").val(ui.draggable.attr('id').replace("_item",""));
			$( this ).find( "span" ).remove();
			$( "<div></div>" ).html( ui.draggable.html() ).appendTo( $( this ));
		}
	});
}

function selectDate(date){
	var selectedDate = date.value;
	if(selectedDate != '' && !/^\d{4}\-\d{1,2}\-\d{1,2}$/.test(selectedDate)){
		alert("날짜 형식이 잘못 되었습니다.");
		$('#start_date').val(date.defaultValue);
		return;
	}
}

function checkPlanner(){
	var start_day = $("#start_date").val();
	if( start_day == "") {
		alert("정확한 날짜를 선택해 주십시요. ");
		document.getElementById("start_date").focus();
		return false;
	}
	
	var dateNum = start_day.split("-");
	var date = new Date(parseInt(dateNum[0]),parseInt(dateNum[1])-1,parseInt(dateNum[2]));
	var minDate = new Date("1900-01-01");
	var maxDate = new Date("2099-12-31");
	
	if(minDate.getTime() > date.getTime() || maxDate.getTime() < date.getTime) {
		alert("여행 시작 날짜는 '1900-01-01' ~ '2099-12-31' 사이여야 합니다.");
		document.getElementById("start_date").focus();
		return false;
	}

	var day = $("#day_count").val();
	for(var i= 1; i <= Number(day); i++){
		var item_count = $("#d"+i+"_item_count").val();
		for(var j = 1; j <= Number(item_count); j++){
			var money_count = $("#d"+i+"_item"+j+"_money_count").val();
			for(k = 1; k <= Number(money_count); k++){
				if($("#d"+i+"_item"+j+"_money"+k+"_title").val()== ''){
					alert("가계부항목에는 공백값이 들어갈수 없습니다.");
					document.getElementById("d"+i+"_item"+j+"_money"+k+"_title").focus();
					return false;
				}
			}
		}
	}
	
	document.getElementById("plannerform").submit();
}

var extensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"]; 
function checkExt(fileName){
	var ext = fileName.substring(fileName.lastIndexOf('.'));
	ext = ext.toLowerCase();
	for(var i = 0; i < extensions.length; i++){
		if(extensions[i] == ext)
			return true;
	}
	alert("이미지 파일만 등록해주세요");
	return false;
}

function addPlannerPhoto(input){	
	if (input.files && input.files[0]) {
		var isImg = checkExt(input.value);
		
		if(isImg == true){
			var reader = new FileReader();
			reader.readAsDataURL(input.files[0]);
			reader.onloadend = function (e) {
				$('.breadcrumbs-v1').css('background-image', 'url('+e.target.result +')');
			}
		}
	}
}
function renamePlanner(planner_no){
	var title = prompt("수정할 제목을 입력해주세요");
	if (title != null && title != '') {
		document.getElementById("title").innerHTML = title  + ' <a href="javascript:renamePlanner()"><i class="fa fa-pencil"></i></a>';
		$('#planner_title').val(title);
	}else if(title == ''){
		alert('빈 공백값은 사용할 수 없습니다');
	}
}

function addDay(day_count){
	var before_day_count = Number($("#before_day_count").val());
	var after_day_count = Number(day_count.value);
	if(after_day_count < 1){
		alert('1일 이상이어야 합니다');
		day_count.value = before_day_count;
		return;
	}
	
	if(after_day_count > 99){
		alert('99일 이하이어야 합니다');
		day_count.value = before_day_count;
		return;
	}
		
	if(before_day_count < after_day_count){
		var select = confirm("일정 추가 하시겠습니까?");
		if(select == true){
			//Item 용 레퍼런스 복사 후 name값 변경
			for(var i = before_day_count+1; i <= after_day_count; i++){
				var html = $('#dayDiv').html();
				var copy = "d"+i+"_item";
				var newHtml = html.replace(/d0_item/g, copy);

				$("#submit_btn").before(newHtml);
				$("#d"+i+"_items_date").text("Day " + i)
			}

			setDroppable();

			$("#before_day_count").val(day_count.value);
		}else{
			day_count.value = before_day_count;
			return;
		}
	}else{
		var select = confirm("마지막 일정을 삭제 하시겠습니까?");
		if(select == true){
			for(var i = before_day_count; i > after_day_count; i--){
				$("#d"+i+"_items_div").remove();
				$("#before_day_count").val(after_day_count);
			}
			
		}else{
			day_count.value = before_day_count;
			return;
		}
	}
}
function calcDigit(digit){
	var num = 1;
	for(var i = 0; i < digit; i++){
		num *= 10;
	}
	return num;
}
function addItem(input_name){
	//예) input_name = d1_item1
	var day_label = input_name; 
	var label_num = 0;
	var roof = 0;
	while(day_label.slice(-1) >= 0 && day_label.slice(-1) <= 9){
		label_num += (day_label.slice(-1)* calcDigit(roof++));
		day_label = day_label.slice(0,-1);
	}//d1_item
	
	var day_item_count = document.getElementById(day_label+"_count");
	if(Number(day_item_count.value) == 99){
		alert('하루 일정은 최대 99개 까지 입니다.');
		return 0;
	}
	
	for(var i = Number(day_item_count.value); i > label_num; i--){
		var oldExp = new RegExp(day_label+i, 'g');
		var newExp = day_label+(i+1);
		$("[name*='"+day_label+i+"']").each(function(){
			$(this).attr('name', $(this).attr('name').replace(oldExp, newExp));
		})
		
		$("[id*='"+day_label+i+"']").each(function(){
			$(this).attr('id', $(this).attr('id').replace(oldExp, newExp));
		})
		
		$("[href*='"+day_label+i+"']").each(function(){
			$(this).attr('href', $(this).attr('href').replace(oldExp, newExp));
		})
		
		$("[onclick*='"+day_label+i+"']").each(function(){
			$(this).attr('onclick', $(this).attr('onclick').replace(oldExp, newExp));
		})
	}
	
	var copy = day_label+(label_num+1); //d1_item2

	//Item 용 레퍼런스 복사 후 name값 변경
	var html = $('#d0_item1_div').html();
	var newHtml = '<div id="'+copy+'_div">' + html.replace(/d0_item1/g, copy) + '</div>';

	$("#"+input_name+"_div").after(newHtml);
	
	day_item_count.value = Number(day_item_count.value)+1;
	setDroppable();
}

function deleteItem(input_name){
	//input_name = d1_item1
	var day_label = input_name; 
	var label_num = 0;
	var roof = 0;
	while(day_label.slice(-1) >= 0 && day_label.slice(-1) <= 9){
		label_num += (day_label.slice(-1)* calcDigit(roof++));
		day_label = day_label.slice(0,-1);
	}//d1_item

	var day_item_count = document.getElementById(day_label+"_count");
	if(day_item_count.value == '1'){
		alert('Day 일정은 최소 한개는 필요합니다.');
		return;
	}
	$("#"+input_name+"_div").remove()
	for(var i = label_num+1; i <= Number(day_item_count.value); i++){
		var oldExp = new RegExp(day_label+i, 'g');
		var newExp = day_label+(i-1);
		$("[name*='"+day_label+i+"']").each(function(){
			//alert($(this).attr('name'));
			$(this).attr('name', $(this).attr('name').replace(oldExp, newExp));
			//alert($(this).attr('name'));
		})
		
		$("[id*='"+day_label+i+"']").each(function(){
			$(this).attr('id', $(this).attr('id').replace(oldExp, newExp));
		})
		
		$("[href*='"+day_label+i+"']").each(function(){
			$(this).attr('href', $(this).attr('href').replace(oldExp, newExp));
		})
		
		$("[onclick*='"+day_label+i+"']").each(function(){
			$(this).attr('onclick', $(this).attr('onclick').replace(oldExp, newExp));
		})
	}
	day_item_count.value = Number(day_item_count.value)-1;
}

function addMoney(input_name){
	//input_name : d1_item1

	//가계부 Div가 있는지 먼저 확인 후에 없으면 만들어준다.
	var moneyDiv = document.getElementById(input_name+"_money_div");
	if(moneyDiv == null){
		moneyDiv = document.createElement("div");
		moneyDiv.id = input_name+"_money_div";
		moneyDiv.className  = "panel-body";
		moneyDiv.style.borderTop = 'solid 1px #EEEEEE';
		$("#"+input_name+"_note_div").after(moneyDiv);
	}

	var div = document.createElement("div");
	var money_count = document.getElementById(input_name+"_money_count");
	money_count.value=Number(money_count.value)+1;
	div.id = input_name+"_money"+money_count.value+"_div";
	div.style.marginTop="3px";

	var hiddenInput = document.createElement("input");
	hiddenInput.setAttribute("type", "hidden");
	hiddenInput.name= input_name+"_money"+money_count.value+"_no";
	div.appendChild(hiddenInput);

	var hiddenInputType = document.createElement("input");
	hiddenInputType.setAttribute("type", "hidden");
	hiddenInputType.name= input_name+"_money"+money_count.value+"_currency_code";
	hiddenInputType.value= "P0001";
	div.appendChild(hiddenInputType);

	var money_type = new Array('항공', '숙박', '교통', '쇼핑', '식사', '입장료', '오락', '기타');
	var money_code = new Array('D0001', 'D0002', 'D0003', 'D0004', 'D0005', 'D0006', 'D0007', 'D0008');
	var moneySelect = document.createElement("select");
	moneySelect.name=input_name+"_money"+money_count.value +"_type_code";

	var label = document.createElement("label");
	var iTag = document.createElement("i");
	label.className = "select col col-3";
	for (i = 0; i < money_type.length; i++) {
		var moneyOption = new Option(money_type[i], money_code[i]);
		moneySelect.options.add(moneyOption);
	}
	label.appendChild(moneySelect)
	label.appendChild(iTag);
	div.appendChild(label);

	var notelabel = document.createElement("label");
	notelabel.className = "input col col-5";
	var noteInput = document.createElement("input");
	noteInput.type="text";
	noteInput.className = "col col-5";
	noteInput.id= input_name+"_money"+money_count.value+"_title";
	noteInput.name= input_name+"_money"+money_count.value+"_title";
	noteInput.placeholder="예) 기념품";
	notelabel.appendChild(noteInput);
	div.appendChild(notelabel);

	var pricelabel = document.createElement("label");
	pricelabel.className = "input col col-3";
	var priceInput = document.createElement("input");
	priceInput.style.marginLeft="10px";
	priceInput.type="number";
	priceInput.className = "col col-3";
	priceInput.name= input_name+"_money"+money_count.value+"_price";
	priceInput.placeholder="3000";
	pricelabel.appendChild(priceInput);
	div.appendChild(pricelabel);

	var deletelabel = document.createElement("label");
	deletelabel.className = "input col col-1";
	var deleteBtn = document.createElement("button");
	deleteBtn.className = "rounded-4x btn btn-default";
	deleteBtn.title = "가계부 삭제";
	deleteBtn.innerHTML="X";
	deleteBtn.setAttribute("onClick", "delMoney('"+input_name+"_money"+money_count.value+"')");
	/*deleteBtn.onclick = function () {
		delMoney(input_name+"_money"+money_count.value);
	};*/
	deletelabel.appendChild(deleteBtn);
	div.appendChild(deletelabel);

	moneyDiv.appendChild(div);
}

function delMoney(input_name){
	//input_name = d1_item10_money1
	var money_label = input_name; 
	var label_num = 0;
	var roof = 0;
	while(money_label.slice(-1) >= 0 && money_label.slice(-1) <= 9){
		label_num += (money_label.slice(-1)* calcDigit(roof++));
		money_label = money_label.slice(0,-1);
	}//d1_item10_money

	var money_count = document.getElementById(money_label+"_count");
	$("#"+input_name+"_div").remove()
	for(var i = label_num+1; i <= Number(money_count.value); i++){
		var oldExp = new RegExp(money_label+i, 'g');
		var newExp = money_label+(i-1);
		$("[name*='"+money_label+i+"']").each(function(){
			//alert($(this).attr('name'));
			$(this).attr('name', $(this).attr('name').replace(oldExp, newExp));
			//alert($(this).attr('name'));
		})
		
		$("[id*='"+money_label+i+"']").each(function(){
			$(this).attr('id', $(this).attr('id').replace(oldExp, newExp));
		})
		
		$("[href*='"+money_label+i+"']").each(function(){
			$(this).attr('href', $(this).attr('href').replace(oldExp, newExp));
		})
		
		$("[onclick*='"+money_label+i+"']").each(function(){
			$(this).attr('onclick', $(this).attr('onclick').replace(oldExp, newExp));
		})
	}
	money_count.value = Number(money_count.value)-1;
	if(money_count.value == '0'){
		$("#"+money_label+"_div").remove()
	}
}
function addPhoto(input, input_name){
	//input_name : d1_item1
	if (input.files && input.files[0]) {
		var isImg = checkExt(input.value);
		if(isImg == true){
			var photoDiv = document.getElementById(input_name+"_photo");
			if(photoDiv == null){
				photoDiv = document.createElement("div");
				photoDiv.id = input_name + "_photo";
				photoDiv.className  = "panel-body";
				$("#"+input_name+"_note_div").prepend(photoDiv);

				var preview = document.createElement("img");
				preview.id = input_name+"_preview";

				photoDiv.appendChild(preview);
			}

			var reader = new FileReader();

			reader.onload = function (e) {
				var preview = input_name+"_preview";
				$('#'+preview).attr('src', e.target.result);
				$('#'+preview).attr('width', 400);
				$('#'+preview).attr('height', 300);
				input.parentNode.nextSibling.value = input.value;
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
}