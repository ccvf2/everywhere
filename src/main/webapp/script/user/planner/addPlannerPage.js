/**
* 
*/
$(function() {
	$( "#spotItem > div" ).draggable({
		appendTo: "body",
		containment: "document",
		revert: "invalid",
		helper: "clone"
	});

	$( ".dropItem" ).droppable({
		accept: "#spotLists > div",
		activeClass: "ui-state-hover",
		hoverClass: "ui-state-active",
		drop: function( event, ui ) {
			$(event['target']).droppable('disable');
			$( this ).find("input").val(ui.draggable.attr('id').replace("_item",""));
			$( this ).find( "span" ).remove();
			$( "<div></div>" ).html( ui.draggable.html() ).appendTo( $( this ));
		}
	});
});

function addDay(day_count){
	var before_day_count = $("#before_day_count").val();

	if(before_day_count < day_count.value){
		var select = confirm("일정 추가 하시겠습니까?");
		if(select == true){
			//Item 용 레퍼런스 복사 후 name값 변경
			var html = $('#dayDiv').html();
			var copy = "d"+day_count.value+"_item";
			var newHtml = html.replace(/d0_item/g, copy);

			$("#submit_btn").before(newHtml);
			$("#d"+day_count.value+"_items_date").text("Day " + day_count.value)

			$( ".dropItem" ).droppable({
				accept: "#spotLists > div",
				activeClass: "ui-state-hover",
				hoverClass: "ui-state-active",
				drop: function( event, ui ) {
					$(event['target']).droppable('disable');
					$( this ).find("input").val(ui.draggable.attr('id').replace("_item",""));
					$( this ).find( "span" ).remove();
					$( "<div></div>" ).html( ui.draggable.html() ).appendTo( $( this ));
				}
			});
			
			$("#before_day_count").val(day_count.value);
		}else{
			day_count.value = before_day_count;
			return;
		}
	}else{
		var select = confirm("마지막 일정을 삭제 하시겠습니까?");
		if(select == true){
			$("#d"+before_day_count+"_items_div").remove();
			$("#before_day_count").val(day_count.value);
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

	$( ".dropItem" ).droppable({
		accept: "#spotLists > div",
		activeClass: "ui-state-hover",
		hoverClass: "ui-state-active",
		drop: function( event, ui ) {
			$(event['target']).droppable('disable');
			$( this ).find("input").val(ui.draggable.attr('id').replace("_item",""));
			$( this ).find( "span" ).remove();
			$( "<div></div>" ).html( ui.draggable.html() ).appendTo( $( this ));
		}
	});
}

function addMoney(input_name){
	//input_name : d1_item1

	//가계부 Div가 있는지 먼저 확인 후에 없으면 만들어준다.
	var moneyDiv = document.getElementById("money"+input_name);
	if(moneyDiv == null){
		moneyDiv = document.createElement("div");
		moneyDiv.id = "money"+input_name;
		moneyDiv.className  = "panel-body";
		$("#"+input_name+"_note").after(moneyDiv);
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
	label.className = "select";
	for (i = 0; i < money_type.length; i++) {
		var moneyOption = new Option(money_type[i], money_code[i]);
		moneySelect.options.add(moneyOption);
	}
	label.appendChild(moneySelect)
	div.appendChild(label);

	var noteInput = document.createElement("input");
	noteInput.type="text";
	noteInput.name= input_name+"_money"+money_count.value+"_title";
	noteInput.placeholder="예) 기념품";
	div.appendChild(noteInput);

	var priceInput = document.createElement("input");
	priceInput.style.marginLeft="10px";
	priceInput.type="text";
	priceInput.name= input_name+"_money"+money_count.value+"_price";
	priceInput.placeholder="3000";
	div.appendChild(priceInput);

	moneyDiv.appendChild(div);
}

function addPhoto(input, input_name){
	//input_name : d1_item1

	if (input.files && input.files[0]) {
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