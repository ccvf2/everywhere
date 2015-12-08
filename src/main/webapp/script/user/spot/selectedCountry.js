/**
 * 
 */
var values = [];
function readCityToServer(){
	var countrycode = document.getElementById("selectCountry").value;
	var params = "country_code=" + countrycode;
	var url = "/user/spot/selectCountry.do?" + params;
	$.ajax({
		url:url,
		type:"post",
		dataType:"text",
		success:function(data){
			var result = data.split("|");
			var str = "";
			for(i = 0; i < result.length-1; i++){
				var code = result[i].split(",");
				str+="<option value='"+code[0]+"'>" + code[1] + "</option>";				
			}
			$("#selectCity").empty(); 
			$("#selectCity").prepend(str);
			
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
		
	})
}