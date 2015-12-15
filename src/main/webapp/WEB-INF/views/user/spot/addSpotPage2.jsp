<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>명소 추가</title>

    <!-- Bootstrap -->
    <link href="/script/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
     <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/assets/plugins/animate.css">
    <link rel="stylesheet" href="/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">    

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/assets/css/custom.css">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- 구글 맵 & 셀렉트 박스 -->
	<script type="text/javascript" src="/script/user/spot/selectedCountry.js"></script>
	<script type="text/javascript" src="/script/user/spot/addSpotPage.js"></script>
	<script type="text/javascript" src="/script/user/spot/xhr.js"></script>
	<script type="text/javascript" src="/script/user/spot/googleMap.js"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
    
    <style type="text/css">
	#map {
	   height: 350px;
	   width: 350px;
	}
	</style>	  
  </head>
  <body onload="initialize();">
  <c:choose>
	<c:when test="${mem_object==null}">
		<form action="/user/login/login.do" name="memberLogin" method="post">
		<label>아이디<input type="text" name="mem_email" value="admin@everywhere.com"></label>
		<label>비밀번호<input type="text" name="mem_pwd" value="1234"></label>
		<input type="submit" value="로그인">
		</form>
	</c:when>
  </c:choose>

	<div class="wrapper">
		<!--=== Header ===-->	
	    <div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	    </div>   
		<!--=== End Header ===-->	    
	    <!--=== Content Part ===-->
	    <div class="container content">     
	        <div class="row">
	            <!-- Begin Content -->
	            <div class="col-md-12">
	            	<div class="heading heading-v1 margin-bottom-40">
	                    <h2>명소 추가</h2>
	                    <p>나만 알고 있는<strong> 멋진 명소 </strong>를 추가해주세요. </p>
	                    <p>Unify uses <strong>gmaps.js</strong> plugin for Google Maps. The gmaps.js allows you to use the potential of Google Maps in a simple way. No more extensive documentation or large amount of codes. You can find more detailed information here <a target="_blank" href="http://hpneo.github.io/gmaps">http://hpneo.github.io/gmaps</a></p>
	                </div>
	            </div>
	        </div>
	        
	        <form action="/user/spot/addSpotWrite.do" id="sky-form" class="sky-form rounded" onsubmit="return addSpotForm(this)" enctype="multipart/form-data">
                <input type="hidden" name="mem_no" value="${mem_object.mem_no}">			
				<input type="hidden" name="mem_level_code" value="${mem_object.mem_level_code}">
				<fieldset>
                  	<div class="row">
                  		<!-- 주소 & 구글맵 -->
                   		<div class="col col-5">
                      	 	<div class="input-group">
                                <input type="text" class="form-control" id="address" name="spot_addr" placeholder="address">
                                <input type="hidden" id="lat" name="spot_lat"/>
								<input type="hidden" id="lng" name="spot_long"/> <br/>
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button" onclick="toServer()" >search!</button>
                                </span>
                            </div>
                            <div id="map" style="margin-top:5px;"></div> 
                        </div>
                       
                        <!-- 사진 -->
                        <div class="col col-5" style="float: right">
                      		<section>
                            	<label for="file" class="input input-file">
                               		<div class="button"><input type="file" id="spot_image" name="spot_image" onchange="readURL(this)" accept="image/*">Add</div><input type="text" readonly>
                           		</label>
                          		<img id="preview" style="border:1px solid #D7D7D7; width : 350px; height:350px;" alt="image"/>
                           </section>		                             
                       </div>
                     </div>
                  </fieldset>
	                  
                  <!-- 명소 종류 선택 -->
                  <fieldset>
                      <div class="row">
                      	 <!-- 나라 -->
                          <section class="col col-5">	                           
                              <label class="select">
                                  <select name="country_code" id="selectCountry" onchange="readCityList()">                                    	
                                  	<option value="0" selected disabled>Country</option>
                                  	<c:forEach var="country" items="${countryList}" >
  	                                    <option value="${country.code}">${country.code_name}</option>
                                   </c:forEach>                                       
                                  </select>
                                  <i></i>
                              </label>
                          </section>
                          
                           <!-- 도시 -->
                          <section class="col col-4">
                              <label class="select">
                                <select name="city_code" id="selectCity">
									<option value="0" selected disabled>City</option>
								</select>
                                  <i></i>
                              </label>
                          </section>
                          
                          <!-- 명소타입 -->
                          <section class="col col-3">
                              <label class="select">
                                  <select name="spot_type_code">
                                  <option value="0" selected disabled>명소타입</option>
								 <c:forEach var="spotType" items="${spotTypeList}" >
									  <option value="${spotType.code}">${spotType.code_name}</option>
								</c:forEach>         
							</select>
                                  <i></i>
                              </label>
                          </section>
                      </div>
                      
                      <div class="row">
                          <section class="col col-3">
                              <label class="input">
                              	<i class="icon-prepend fa  fa-angle-double-down"></i>
                                  <input type="text" name="spot_name" placeholder="명소명">
                              </label>
                          </section>
                          <section class="col col-9">
                              <label class="input">
                              	<i class="icon-prepend fa fa-info"></i>
                                  <input type="text" name="spot_note" placeholder="명소 한줄 설명">
                              </label>
                          </section>
                      </div>
                  </fieldset>
                  <footer>
                      <button type="submit" class="button">Continue</button>
                  </footer>
	           </form>  
	           <!-- End Content -->
	    </div>          
	</div><!--/container-->     
    <!--=== End Content Part ===-->

    <!--=== Footer Version 1 ===-->
    <div class="footer-v1">
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
    </div>
    <!--=== End Footer Version 1 ===-->
  </body>
</html>