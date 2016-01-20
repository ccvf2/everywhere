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
    <title>명소 찾기</title>
    
    <!-- item 3개씩 나오게 -->
    <link href="/assets/css/pages/blog_masonry_3col.css" rel="stylesheet">
    <!-- 사이드바 검색 결과 -->
    <link rel="stylesheet" href="/assets/css/pages/profile.css">
    <link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
	<!-- CSS Theme-->
	<link rel="stylesheet" href="/assets/css/theme-colors/default.css">
	
	<!-- 사이드바 고정 -->
	<style type="text/css">
		<!-- 사이드 바 고정 -->
		.affix-top, .affix {
			position: static;
		}
		
		@media ( min-width : 979px) {
			#sidebar.affix-top {
				position: static;
				width: 228px;
			}
			#sidebar.affix {
				position: fixed;
				top: 70px;
				width: 228px;
			}
		}
		
		#sidebar li.active {
			border: 0 #eee solid;
			border-right-width: 5px;
		}
		<!--사이드바 고정 끝-->
	</style>
	
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
  	<c:import url="/WEB-INF/views/common/jquery.jsp"/>
	<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
  </head>
  <body>
	
   	<div class="wrapper">
	    <!--=== Header ===-->
	    <!-- Header가 꼭 imprt 되어 있어야 한다.(안그러면화면이깨짐) -->
	    <div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	    </div>
	    <!--=== End Header ===-->

	 	<div class="container">
        	<div class="row">
			<!-- Blog Sidebar -->
			<!-- id값으로 사이드 메뉴 고정 -->
	            <div class="col-md-3" id="leftCol">
		            <!-- Blog Newsletter -->
		            <div class="blog-newsletter" id="sidebar">
		               <div class="headline-v2"></div>
	            	 	<form action="#" class="sky-form" onsubmit="searchSpotList('${currentPage}')">
		                    <header>명소 검색</header>
		                    
		                    <fieldset style="padding: 15px 15px 5px;">
		                    	<!-- 지역 찾기 -->
		                    	  <section>
		                            <label class="input">
		                            	<!-- 자동완성 input : works in Chrome, Firefox, Opera and IE10. -->
		                                <input type="text" list="list" name="searchPlace" id="searchPlace" placeholder="지역 검색" value="${searchPlace}">
		                                <datalist id="list">
		                                	<c:forEach var="place" items="${placeList}">
		                                		<option value="${place.code_name}"></option>
		                                	</c:forEach>
		                                </datalist>
		                            </label>
		                        </section>
		                    	<!-- 명소 검색 -->
		                        <section>
		                            <label class="input">
		                                <input type="text" name="searchSpot" id="searchSpot" placeholder="명소 검색" value="${searchSpot}">
		                            </label>
		                        </section>
		                    </fieldset>
		                    <!-- 명소 종류 선택 시작 -->
		                    <fieldset style="padding: 15px 15px 5px;">
		                        <section>
		                            <label class="label">명소 종류</label>
		                            <div class="select_spot_type">
		                            	<label class="checkbox"><input type="checkbox" name="spot_type_code" id="check_all" checked="checked" value="T0000"><i></i>전체</label>
		                            	<c:forEach var="spotType" items="${spotTypeList}">
		                            		<label class="checkbox"><input type="checkbox" name="spot_type_code" id="${spotType.code}" value="${spotType.code}"><i></i>${spotType.code_name}</label>
		                            	</c:forEach>
		                            </div>
		                        </section>
		                    </fieldset>
		                    <!-- 명소 종류 선택 끝 -->
		                    <!-- 명소 검색 버튼 시작 -->
		                    <footer>
		                    	<div class="text-center">
		                        	<button type="submit" class="btn-u">검색</button>
		                        	<button type="button" class="btn-u btn-u-default" onclick="window.history.back();">뒤로</button>
	                        	</div>
		                    </footer>
		                </form>
		                <!-- 하단 명소 리스트 삭제 -->
		             <%--  <div class="tag-box tag-box-v4 margin-bottom-20 hidden-xs" style="padding : 0px; border: 1px #bbb;">
							<ul class="list-unstyled mCustomScrollbar margin-bottom-20 _mCS_1 mCS-autoHide" data-mcs-theme="minimal-dark" id="spotLists" style="position: relative; overflow: visible;">
								<c:forEach var="spot" items="${searchSpotList}">
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
										<div id="${spot.spot_no}_item" class="ui-widget-content" style="border:0px;">
											<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/${spot.spot_photoes[0].save_name}.${spot.spot_photoes[0].extension}" style="width:35px;height:35px;margin-right:5px;"></i>
											<div class="overflow-h">
												<span>
													<strong><a href="javascript:spotReadPage('${spot.spot_no}')">${spot.spot_name}</a></strong>
												</span><br/>
												<small><c:out value="${spot.spot_note}"/></small>
											</div>
										</div>
									</li>
								</c:forEach>
								<div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;">
									<div class="mCSB_draggerContainer">
										<div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; display: block; height: 247px; max-height: 286px; top: 0px;" oncontextmenu="return false;">
											<div class="mCSB_dragger_bar" style="line-height: 50px;">
											</div>
										</div>
										<div class="mCSB_draggerRail">
										</div>
									</div>
								</div>
							</ul>
							<button type="button" class="btn-u btn-u-default btn-u-sm btn-block" onclick="selectMoreSpotList()">Load More</button>
							<!--End Notification-->
			            </div>
			            <!-- End Blog Newsletter --> --%>
		            </div>
		         </div>
	         <!-- End sideBar -->
	         
	         <!-- 명소 검색 뷰 시작 -->
               <div class="col-md-9">
               		<div class="blog_masonry_3col">
				        <div class="container-fluid content grid-boxes masonry" style="position: relative; height: 2250px; overflow: hidden;">
				        	<c:forEach var="spot" items="${searchSpotList}">
				        		<div class="grid-boxes-in masonry-brick" style="position: absolute; width: 300px; top: 40px; left: 15px;">
					                <a href="javascript:spotReadPage('${spot.spot_no}')"><img class="img-responsive" src="/attatchFile/spot/${spot.spot_photoes[0].save_name}.${spot.spot_photoes[0].extension}" onError="this.src='/attatchFile/spot/no_image.jpg'" alt=""></a>
					                <div class="grid-boxes-caption">
					                    <h3><a href="javascript:spotReadPage('${spot.spot_no}')">${spot.spot_name}</a></h3>
					                    <ul class="list-inline grid-boxes-news">
					                    	<li>
					                    		<c:forEach var="country" items="${countryList}">
					                    			<c:if test="${country.code==spot.country_code}">
					                    				${country.code_name}
					                    			</c:if>
					                    		</c:forEach>
					                    		${spot.city_name}
					                    	</li>
					                        <li>|</li>
					                        <li><span>By </span><a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${spot.mem_no}">${spot.mem_name}</a></li>
					                    </ul>                    
					                    <p>${spot.spot_note}</p>
					                    
					                    <!-- 별점 출력 -->
					                    <!--<c:if test=" ${spot.count_star_score}==0">
					                    </c:if>
					                    ${spot.total_star_score}
					                    ${spot.count_star_score}
					                    <i class="fa fa-star"></i>
					                    <i class="fa fa-star"></i>
					                    <i class="fa fa-star"></i>
					                    <i class="fa fa-star-half-o"></i>
					                    <i class="fa fa-star-o"></i>
					                    3.5-->
					                </div>
					            </div>
				        	</c:forEach>
				        </div><!--/container-->
				    </div>
				    
				    <!-- 페이징 시작 -->
				    <div class="text-center">
					    <c:if test="${count>0 }">
							<div class="btn-group" role="group" aria-label="First group">
								<c:set var="pageBlock" value="${5}" />
								<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1)}"/>
								
								<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
								
								<c:set var="startPage" value="${result*pageBlock+1}"/>
								<c:set var="endPage" value="${startPage+pageBlock-1}"/>
								
								<!-- 마지막 페이지가 페이지 수보다 작으면 -->
								<c:if test="${endPage > pageCount }">
									<c:set var="endPage" value="${pageCount }"/>
								</c:if>
								
								<!-- 페이징 -->
								<nav>
								  <ul class="pagination">
								  	<c:if test="${startPage > pageBlock}">
									  	<li>
										  	<a href="javascript:searchSpotList('${currentPage-pageBlock}')" aria-label="Previous">
										        <span aria-hidden="true">«</span>
									     	</a>
								     	</li>
									</c:if>
								    <c:forEach var="i" begin="${startPage}" end="${endPage}">
										 <c:if test="${i!=currentPage}">
										 	<li><a href="javascript:searchSpotList('${i}')" role="button" class="btn btn-default">${i}</a></li>
										 </c:if>
										 <c:if test="${i==currentPage}">
										 	<li class="active"><a href="javascript:searchSpotList('${i})" role="button" class="btn btn-default">${i}</a></li>
										 </c:if>
									</c:forEach>
							  		<c:if test="${endPage < pageCount }">
							  			<li>
									      <a href="javascript:searchSpotList('${currentPage+pageBlock}')" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									</c:if>
								  </ul>
								</nav>
								<!-- 페이징 끝 -->
							</div>
						</c:if>
				    </div>
               </div>
	         	<!-- 명소 아이템 리스트 끝 -->
          	</div>
          	<!-- End Container -->
    	</div>
     <!--=== Footer Version 1 ===-->
	    <div class="footer-v1">
			<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	    </div>
	    <!--=== End Footer Version 1 ===-->
    </div>
    <!-- JS Page Level -->
	<script src="/assets/js/app.js"></script>
	<script src="/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/script/user/search/searchSpot.js"></script>
	<script type="text/javascript" src="/assets/plugins/masonry/jquery.masonry.min.js"></script>
	<script type="text/javascript" src="/assets/js/pages/blog-masonry.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/style-switcher.js"></script>
	<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function() {
            App.initScrollBar();
	       	//움직이는 검색바
	       $('#sidebar').affix({
			  offset: {
			    top: 235
			  }
			});
			
			
			//전체 체크박스가 선택되었을 경우
			$("#check_all").click(function(){
				var chk = $(this).is(":checked");//.attr('checked');
				if(chk) {
					$(".select_spot_type input").attr('checked', true);
				} else {
					$(".select_spot_type input").attr('checked', false);
				}
			});
	    });
	    
	    
	    function spotReadPage(no) {
			//alert(no);
			var makeDiv ="<div id='showModal"+no+"'></div>";
			var requestURL="/user/spot/spotReadPage.do?spot_no="+no;
			$.ajax({
				url : requestURL,
				type : "GET",
				dataType : "html",
				success : function(data) {
					$("body").append(makeDiv);
					$("#showModal"+no).append(data)
				},
				error : function() {
					alert("목록 가져오기 실패");
				}
			})
		};
	</script>
  </body>
</html>