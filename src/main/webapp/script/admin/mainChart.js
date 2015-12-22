				 $(function(){
			 		var option = {
				      title: {
				         text: "검색 결과 없음(검색해주세요)"
				      },
				                animationEnabled: true,
				      data: [
				      {
				         type: "column", //column, line, area, bar, pie, etc
				         dataPoints: []
				      }]
				   	};
				   	$("#chartContainer").CanvasJSChart(option);
					 
					 
					$("#date1,#date2").datepicker({
			          dateFormat:"yy-mm-dd",
			          monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			          dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토"]
			      	});
					
					$("#date1").change(function(){
						var date1=$("#date1").val();
						var todayData=$.datepicker.formatDate($.datepicker.ATOM, new Date());
						
						if(date1>=todayData){
							$("#date1").val("");
						}
						
						if($("#date2").val()!=""){
							if($("#date1").val() > $("#date2").val()){
								$("#date1").val("");
							}
						}
						
						
						var selectOption=$("#selectOption").val();
						var date2=$("#date2").val();
						if(selectOption!="Year" && date1!="" && date2!=""){
							if(date1.substring(0, 4)!=date2.substring(0, 4)){
								$("#date1").val("");
								$("#date2").val("");
							}
						}
						
						
					});
					
					$("#date2").change(function(){
						var date2=$("#date2").val();
						var todayData=$.datepicker.formatDate($.datepicker.ATOM, new Date());
						
						if(date2>todayData){
							$("#date2").val("");
						}
						
						if($("#date1").val()!=""){
							if($("#date1").val() > $("#date2").val()){
								$("#date2").val("");
							}
						}
						
						var selectOption=$("#selectOption").val();
						var date1=$("#date1").val();
						
						
						 if(selectOption!="Year" && date1!="" && date2!=""){
							if(date1.substring(0, 4)!=date2.substring(0, 4)){
								$("#date1").val("");
								$("#date2").val("");
							}
						}
						
					});
					
					$("#selectOption").change(function(){
						$("#date1").val("");
						$("#date2").val("");
						$("#btn").val("");
						var selectOption=$("#selectOption").val();
						$("#btn").val(selectOption +" 조회");
					});
					
					$("#btn").click(function(){
						var date1=$("#date1").val();
						var date2=$("#date2").val();
						var selectOption=$("#selectOption").val();
						
						if(date1=="" || date2==""){
							return;
						}
						
						
						var reUrl="/admin/chart/chartList.do";
						var sendData="?date1="+date1+"&date2="+date2+"&selectOption="+selectOption;
						
						$.ajax({
							url: reUrl+sendData,
							type:"get",
							dataType:"text",
							success:function(data){
								var jsonObjectList=JSON.parse(data);
								var arrayData=[];
								
								
								var title="";
								var selectOption=$("#selectOption").val();
								
								for(var i=0; i < jsonObjectList.length; i++){ 
									if(selectOption=="Year"){
										arrayData.push({ x: i+1, y: jsonObjectList[i].stats_count, label: jsonObjectList[i].stats_year+"년"});
									}else if(selectOption=="Month"){
										arrayData.push({ x: i+1, y: jsonObjectList[i].stats_count, label: jsonObjectList[i].stats_month+"월"});
									}else{
										arrayData.push({ x: i+1, y: jsonObjectList[i].stats_count, label: jsonObjectList[i].stats_day+"일"});
									}
								}	
								
								if(selectOption=="Year"){
									title="연도별 총 접속자";
								}else if(selectOption=="Month"){
									title="월별 총 접속자";
								}else{
									title="일별 총 접속자";
								} 
								
								
								
								var options = {
							      title: {
							         text: title
							      },
							                animationEnabled: true,
							      data: [
							      {
							         type: "column", //column, line, area, bar, pie, etc
							         dataPoints: arrayData
							      }]
							   	};
							   	$("#chartContainer").CanvasJSChart(options);
								
							},
							error:function(xhr, status, errorMsg){
								//alert(xhr+","+status+","+errorMsg);
							}
						});
					});
				});