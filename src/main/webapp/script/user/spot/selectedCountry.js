/**
 * 
 */
function readCityToServer(){
	var countrycode = document.getElementById("selectCountry").value;
	var url = "/user/spot/selectCountry.do";
	var params = "country_code=" + countrycode;
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			alert(data);
			var result = data.split(",");
			var bunho = result[0];
			var reply = result[1];
			
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
		
	})
}