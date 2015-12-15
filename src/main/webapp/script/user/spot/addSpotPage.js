/**
 * 
 */
function readURL(input) {
    if (input.files && input.files[0]) {
    	
        var reader = new FileReader();
        
        reader.onload = function (e) {
            $('#preview').attr('src', e.target.result);
            input.parentNode.nextSibling.value = input.value;
        }
        
        reader.readAsDataURL(input.files[0]);
    }
}

function addSpotForm(form){
	if(form.lat.value == null || form.lat.value=="" || form.lng.value == null || form.lng.value==""){
		alert("주소를 입력후 Search 버튼을 혹은 클릭해주세요");
		return false;
	}
	
	if(form.address.value == null || form.address.value==""){
		alert("주소창에 값이 없습니다.");
		form.address.focus();
		return false;
	}
	
	if(form.spot_image.value == null || form.spot_image.value==""){
		alert("사진은 꼭 등록해주세요 합니다.");
		form.spot_image.focus();
		return false;
	}
	
	if(form.country_code.value == null || form.country_code.value=="0"){
		alert("나라를 선택해주세요.");
		form.country_code.focus();
		return false;
	}
	
	if(form.city_code.value == null || form.city_code.value=="0"){
		alert("도시를 선택해주세요.");
		form.country_code.focus();
		return false;
	}
	
	if(form.spot_type_code.value == null || form.spot_type_code.value=="0"){
		alert("명소타입을 선택해주세요.");
		form.country_code.focus();
		return false;
	}
	
	if(form.spot_name.value == null || form.spot_name.value=="0"){
		alert("명소명을 입력해주세요.");
		form.spot_name.focus();
		return false;
	}
	
	if(form.spot_note.value == null || form.spot_note.value=="0"){
		alert("명소에 대한 간단한 설명을 입력해주세요.");
		form.spot_note.focus();
		return false;
	}
}