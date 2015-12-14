<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/script/chart/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/script/chart/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/script/chart/jquery-ui.css"/>
<script type="text/javascript" src="/script/chart/jquery.canvasjs.min.js"></script> -->
</head>
<body>
	<div id="wrapper">
	        <!-- Navigation -->
	        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	            <!-- 최상단 한줄메뉴 -->
				<c:import url="/WEB-INF/views/admin/menu/topMenu.jsp"/>
	            <!-- sideMeny -->
				<c:import url="/WEB-INF/views/admin/menu/leftMenu.jsp"/>
	        </nav>
			<script type="text/javascript">
				 $(function(){
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
						alert("sendData : " +sendData);
						
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
								alert(xhr+","+status+","+errorMsg);
							}
						});
					});
				});
			</script>
	        <div id="page-wrapper" style="height: 700px;">

            <div class="container-fluid">
				<h3>통계보기</h3>
				
				
				<div>
					<input type="text" size="10" id="date1"/>
					<input type="text" size="10" id="date2"/> 
					
					<select id="selectOption">
						<option value="Year">년별 통계</option>
						<option value="Month">월별 통계</option>
						<option value="day">일별 통계</option>
					</select>
					
					<input type="button" id="btn" value="조회"/>
				</div>
				<br/><br/>
				 <div id="chartContainer" style="width: 1000px; height: 300px;"></div>
			</div>
		</div>
	</div>
</body>
</html>