<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/common/jquery.jsp"/>
<meta charset="UTF-8">
<title>타이틀 입력</title>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/script/common/jquery-ui/jquery-ui.theme.css"></script>
    <script src="/script/common/jquery-ui/jquery-ui.js"></script>
    <script>
    $(function() {
        $( "#spotLists li > div" ).draggable({
          appendTo: "body",
          revert: "invalid",
          helper: "clone",
          start: function() {
              $(this).find("img").css({ height: 35, width: 35 });
          }
        });
        
        $( ".droppable" ).droppable({
        	accept: "#draggable",
        	activeClass: "ui-state-highlight",
            hoverClass: "ui-state-active",
            accept: ":not(.ui-sortable-helper)",
            drop: function( event, ui ) {
            	$(event['target']).droppable('disable');
              $( this).addClass( "ui-state-highlight" );
              $( this ).find( "span" ).remove();
              $( "<li></li>" ).text( ui.draggable.text() ).appendTo( $( this ).find( "a" ) );
              
            }
          }).sortable({
            items: "li:not(.placeholder)",
            sort: function() {
              $( this ).removeClass( "ui-state-default" );
            }
          });
        
      });
    </script>
    
    <script type="text/javascript">
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
		
		var money_type = new Array('항공', '숙박', '교통', '쇼핑', '식사', '입장료', '오락', '기타');
		var money_code = new Array('D0001', 'D0002', 'D0003', 'D0004', 'D0005', 'D0006', 'D0007', 'D0008');
		var moneySelect = document.createElement("select");
		
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
		noteInput.name= input_name+"_money"+money_count.value+"_note";
		noteInput.placeholder="예) 기념품";
		div.appendChild(noteInput);
		
		var priceInput = document.createElement("input");
		priceInput.style.marginLeft="10px";
		priceInput.type="text";
		noteInput.name= input_name+"_money"+money_count.value+"_price";
		priceInput.placeholder="3000";
		div.appendChild(priceInput);
		
		moneyDiv.appendChild(div);
	}
</script>
    
    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/assets/css/pages/profile.css">
    
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    
    <!-- 도시&국가 셀렉트박스 -->
    <script type="text/javascript" src="/script/user/spot/selectedCountry.js"></script>
	
</head>
<body>  
	<div class="wrapper">
		<!--=== Header ===-->	
	    <div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	    </div>
		<!--=== End Header ===-->
	
		<!--=== Breadcrumbs ===-->    
	    <div class="breadcrumbs-v1">
	        <div class="container" style="height: 50px;">
	            <span></span>
	            <h1>${plannerDto.title}</h1>
	        </div>
	    </div>
    <!--=== End Breadcrumbs ===-->
	</div>

	 <!--=== Content Part ===-->
    <div class="container content profile" >     
        <div class="row">
            <!--Left Sidebar-->
            <div class="col-md-3 md-margin-bottom-40">
                <img class="img-responsive profile-img margin-bottom-20" src="/assets/img/team/img32-md.jpg" alt="">

                <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                    <li class="list-group-item">
                        <a href="page_profile.html"><i class="fa fa-bar-chart-o"></i> Overall</a>
                    </li>
                    <li class="list-group-item">
                        <a href="page_profile_me.html"><i class="fa fa-user"></i> Profile</a>
                    </li>
                </ul>   

                <div class="panel-heading-v2 overflow-h">
                    <h2 class="heading-xs pull-left"><i class="fa fa-bar-chart-o"></i> Task Progress</h2>
                    <a href="#"><i class="fa fa-cog pull-right"></i></a>
                </div>
                <h3 class="heading-xs">Web Design <span class="pull-right">92%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: 92%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="92" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
                <h3 class="heading-xs">Unify Project <span class="pull-right">85%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: 85%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="85" role="progressbar" class="progress-bar progress-bar-blue">
                    </div>
                </div>
                <h3 class="heading-xs">Sony Corporation <span class="pull-right">64%</span></h3>
                <div class="progress progress-u progress-xxs margin-bottom-40">
                    <div style="width: 64%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="64" role="progressbar" class="progress-bar progress-bar-dark">
                    </div>
                </div>
                

                <!--Notification-->
                <div class="tag-box tag-box-v4 rounded-2x margin-bottom-20">
                <div class="panel-heading-v2 overflow-h">
                    <h2 class="heading-xs pull-left"><i class="fa fa-bell-o"></i> Notification</h2>
                </div>
                
                <div class="panel-heading-v2 overflow-h">
                <form class="sky-form">
                	 <!-- 나라 -->
                    <label class="select">
                        <select name="country_code" id="selectCountry" onchange="selectSpotList('true')">                                    	
                        	<option value=""> Country </option>
                        	<c:forEach var="country" items="${countryList}" >
                            	 <option value="${country.code}">${country.code_name}</option>
                         	</c:forEach>                                       
                        </select>
                        <i></i>
                    </label>
                    
                     <!-- 도시 -->
                    <label class="select">
                    	<select name="city_code" id="selectCity" onchange="selectSpotList('false')">
							<option value="">City</option>
						</select>
                        <i></i>
                    </label>
                    
                    <!-- 명소타입 -->
	               <label class="select">
	                          <select name="spot_type_code" id="selectType" onchange="selectSpotList(false)">
	                          <option value=""> SpotType </option>
	                          <c:forEach var="spotType" items="${spotTypeList}" >
	                          	  <option value="${spotType.code}">${spotType.code_name}</option>
	                          </c:forEach>
	                          </select>
                            <i></i>
                        </label>
                    </form>
                </div>
                  
                      
                      
                      
                <div>
                <ul class="list-unstyled mCustomScrollbar margin-bottom-20" data-mcs-theme="minimal-dark" id="spotLists">
                <c:forEach var="spot" items="${spotList}">
                    <li class="notification" style="border:1px">
                    	<div id="${spot.spot_no}_item" class="rounded">
                        <i style="margin:0;"><img alt="" src="/attatchFile/spot/${spot.spot_photoes[0].save_name}.${spot.spot_photoes[0].extension}" style="width:35px;height:35px;margin-right:5px;"></i>
                        <div class="overflow-h">
                            <span><strong><a href="#">${spot.spot_name}</a></strong></span>
                            <small><c:out value="${spot.spot_note}"/></small>
                        </div>
                        </div>    
                    </li>
                </c:forEach>
                </ul>
                </div>
                <button type="button" class="btn-u btn-u-default btn-u-sm btn-block">Load More</button>
                <!--End Notification-->
                </div>
                
                

                <div class="margin-bottom-50"></div>

                <!--Datepicker-->
                <form action="#" id="sky-form2" class="sky-form">
                    <div id="inline-start"></div>
                </form> 
                <!--End Datepicker-->
            </div>
            <!--End Left Sidebar-->
            
            <!--Tag Box v4-->
            <div class="col-md-9">
            	<div class="profile-body margin-bottom-20">
            	<form action="/user/spot/addSpotWrite.do" id="sky-form" class="sky-form" style="border:none;" onsubmit="return addSpotForm(this)" method="post" enctype="multipart/form-data">
                <fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${plannerDto.start_date}"/>
				<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${plannerDto.end_date}"/>
				<input type="hidden" name="planner_no" value="${plannerDto.planner_no}"/>
                <input type="hidden" name="mem_no" value="${mem_object.mem_no}">
                <input type="hidden" name="planner_title" value="${plannerDto.title}">
                <div class="tag-box tag-box-v4 rounded-2x margin-bottom-30">
	               <label class="textarea">
                       <i class="icon-append fa fa-question-circle"></i>
                       <textarea rows="5" placeholder="부산으로 떠나는 즐거운 여행"></textarea>
                       <b class="tooltip tooltip-top-right">여행에 대한 짧은 메모를 입력해주세요</b>
                   </label>
                   <div class="row" style="margin-bottom:5px;">   
                      <div class="col col-6">
                          <label class="input">
                              <i class="icon-append fa fa-calendar"></i>
                              <input type="text" name="start_date" id="start" placeholder="Start date" value="${start_date}">
                          </label>
                      </div>
                      <div class="col col-6">
                          <label class="input">
                              <i class="icon-append fa fa-calendar"></i>
                              <input type="text" name="finish" id="finish" placeholder="Expected finish date" value="${end_date}">
                          </label>
                      </div>
                  </div> 
                </div>

				<!-- Day Schedule -->
                <input type="hidden" name="day_count" value="${day_count}"/>
                <c:forEach var="i" begin="1" end="${day_count}">
                <div class="tag-box tag-box-v4 rounded-2x margin-bottom-30">
                	<input type="hidden" name="d${i}_item_count" value="1">
                	<h2 class="heading-xs">Day ${i}</h2>
                	<c:set var="id_value" value="d${i}_item1"/>
                	<ol class="list-unstyled" >
	                	<li>
	                	<div class="panel-group">
	                		<input type="hidden" name="${id_value}_no"/>
	                		<input type="hidden" name="${id_value}_spot_no"/>
						    <div class="panel panel-default">
						      <div class="panel-heading ui-widget-header droppable">
						        <h4 class="panel-title">
						          <a data-toggle="collapse" href="#collapse_${id_value}"><span>Add Spot</span></a>
						        </h4>
						      </div>
						      <div id="collapse_${id_value}" class="panel-collapse collapse">
						        <div class="panel-body">Panel Body</div>
						        <div id="${id_value}_note"class="panel-body" style="padding:0px">
		                            <label class="textarea" style="margin:0">
		                                <textarea style="border:0px" rows="3" name="${id_value}_note" placeholder="Write some notes.."></textarea>
		                            </label>        
						        </div>
						        <input type="hidden" id="${id_value}_money_count" name="${id_value}_money_count" value="0"/>
						        <div class="project-share">
	                                <ul class="list-inline comment-list-v2 pull-right">
	                                    <li><i class="expand-list rounded-x fa  fa-plus-square"></i> <a href="#">25</a></li>
	                                    <li><i class="fa fa-comments"></i> <a href="#">32</a></li>
	                                    <li><i class="fa fa-retweet" onclick="addMoney('${id_value}')"></i> <a href="#">77</a></li>
	                                </ul>
	                           	 </div>
						      </div>
						    </div>
						    </div>
	 					 </li>
 					 </ol>
 					 
 					 
                </div>
                </c:forEach>
                </form>
                </div>
            </div>
            <!--End Tag Box v4-->
		</div>
	</div>
	
	<!-- JS Implementing Plugins -->
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	
	<script type="text/javascript" src="/assets/js/plugins/style-switcher.js"></script>
	<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/masking.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/datepicker2.js"></script>	
	<script type="text/javascript" src="/assets/js/plugins/validation.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/style-switcher.js"></script>
	
	<script type="text/javascript">
	    jQuery(document).ready(function() {
	        App.initScrollBar();
	        Masking.initMasking();
	        Datepicker.initDatepicker();
	        Validation.initValidation();
	    });
	    
	</script>
</body>
</html>