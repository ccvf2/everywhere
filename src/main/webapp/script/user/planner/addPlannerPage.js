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

function checkPlanner(){
	var day = $("#day_count").val();
	for(var i= 1; i <= Number(day); i++){
		var item_count = $("#d"+i+"_item_count").val();
		for(var j = 1; j <= Number(item_count); j++){
			var test = $("#d"+i+"_item"+j+"_note").val().replace(/ /g, '');
			if($("#d"+i+"_item"+j+"_spot_no").val()=='0' && test == ''){
				alert("day"+i+"의"+j+"번째가 공백입니다.");
				return false;
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

function addDay(day_count){
	var before_day_count = $("#before_day_count").val();

	if(before_day_count < day_count.value){
		var select = confirm("일정 추가 하시겠습니까?");
		if(select == true){
			//Item 용 레퍼런스 복사 후 name값 변경
			for(var i = Number(before_day_count)+1; i <= Number(day_count.value); i++){
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
			for(var i = Number(before_day_count); i > Number(day_count.value); i--){
				$("#d"+i+"_items_div").remove();
				$("#before_day_count").val(day_count.value);
			}
			
		}else{
			day_count.value = before_day_count;
			return;
		}
	}
}

function addItem(input_name){
	//input_name = d1_item
	var day_item_count = document.getElementById(input_name+"_count");
	day_item_count.value = Number(day_item_count.value)+1;
	
	var copy = input_name+day_item_count.value;

	//Item 용 레퍼런스 복사 후 name값 변경
	var html = $('#d0_item_ol').html();
	var newHtml = html.replace(/d0_item1/g, copy);

	$("#"+input_name+"_ol").append(newHtml);

	setDroppable();
}

function deleteItem(input_name){
	//input_name = d1_item1
	var day_label = input_name.substr(0,7); //d1_item
	var day_item_count = document.getElementById(input_name.substr(0,7)+"_count");
	if(day_item_count.value == '1'){
		alert('Day 일정은 최소 한개는 필요합니다.');
		return;
	}
	$("#"+input_name+"_li").remove()
	for(var i = Number(input_name.substr(7,8))+1; i <= Number(day_item_count.value); i++){
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
	}
	day_item_count.value = Number(day_item_count.value)-1;
}

function addMoney(input_name){
	//input_name : d1_item1

	//가계부 Div가 있는지 먼저 확인 후에 없으면 만들어준다.
	var moneyDiv = document.getElementById("money"+input_name);
	if(moneyDiv == null){
		moneyDiv = document.createElement("div");
		moneyDiv.id = "money"+input_name;
		moneyDiv.className  = "panel-body";
		moneyDiv.style.borderTop = 'solid 1px #EEEEEE';
		$("#"+input_name+"_note_div").after(moneyDiv);
	}

	var div = document.createElement("div");
	var money_count = document.getElementById(input_name+"_money_count");
	money_count.value=Number(money_count.value)+1;
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
	noteInput.name= input_name+"_money"+money_count.value+"_title";
	noteInput.placeholder="예) 기념품";
	notelabel.appendChild(noteInput);
	div.appendChild(notelabel);

	var pricelabel = document.createElement("label");
	pricelabel.className = "input col col-4";
	var priceInput = document.createElement("input");
	priceInput.style.marginLeft="10px";
	priceInput.type="number";
	priceInput.className = "col col-4";
	priceInput.name= input_name+"_money"+money_count.value+"_price";
	priceInput.placeholder="3000";
	pricelabel.appendChild(priceInput);
	div.appendChild(pricelabel);

	moneyDiv.appendChild(div);
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
				$("#"+input_name+"_note").before(photoDiv);

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