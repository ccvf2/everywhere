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
    <title>리뷰목록</title>
    
    <!-- item 3개씩 나오게 -->
    <link href="/assets/css/pages/blog_masonry_3col.css" rel="stylesheet">
    <!-- 사이드바 검색 결과 -->
    <link rel="stylesheet" href="/assets/css/pages/profile.css">
    <link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
	<!-- CSS Theme-->
	<link rel="stylesheet" href="/assets/css/theme-colors/default.css">
	
	<!-- 사이드바 고정 -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
//검색조건 변경
	function changeSearchValue(){
	}

//페이지 번호 이동
	function movePage(pageNumber){
		var form = document.getElementById("plannerListForm");
		form.currentPage.value(pageNumber);
		goSearchForm()
	}


//폼 서브밋
	function goSearchForm(){
		var form = document.getElementById("plannerListForm");
		form.action="/user/planner/plannerList.do";
		form.method="POST";
		form.submit();
	}
</script>
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
				<%-- <c:import url="/WEB-INF/views/user/planner/plannerListLeft.jsp">
				</c:import> --%>
							<!-- 사이드 메뉴  시작-->
	            <div class="col-md-3" id="leftCol">
		            <!-- Blog Newsletter -->
		            <div class="blog-newsletter" id="sidebar">
		              <div class="headline-v2" style="border: 0px;"></div>
	            	 	<form class="sky-form" id="plannerListForm">
		                    <header>리뷰 검색</header>
		                    
		                    <fieldset style="padding: 15px 15px 5px;">
		                    	<!-- 지역 찾기 -->
		                    	  <section>
		                            <label class="input">
		                            	<!-- 자동완성 input : works in Chrome, Firefox, Opera and IE10. -->
		                                <input type="text" list="list" name="searchWord1" id="searchPlace" placeholder="키워드" value="${plannerDto.searchWord1}">
		                                <datalist id="list">
		                                	<c:forEach var="place" items="${placeList}">
		                                		<option value="${place.code_name}"></option>
		                                	</c:forEach>
		                                </datalist>
		                            </label>
		                        </section>
		                    </fieldset>
		                    <!-- 명소 종류 선택 시작 -->
		                    <fieldset style="padding: 15px 15px 5px;">
				                <section>
				                    <label class="label">글종류</label>
		                            <div class="">
		                                <label class="radio"><input type="radio" name="searchCondition1" value="" checked="checked"><i class="rounded-x"></i>전체</label>
		                            	<c:forEach var="typeCode" items="${selectCode}">
		                            	<c:choose>
		                            		<c:when test="${plannerDto.searchCondition1==typeCode.code}">
				                                <label class="radio"><input type="radio" name="searchCondition1" value="${typeCode.code}" checked="checked"><i class="rounded-x"></i>${typeCode.code_name}</label>
		                            		</c:when>
		                            		<c:otherwise>
				                                <label class="radio"><input type="radio" name="searchCondition1" value="${typeCode.code}"><i class="rounded-x"></i>${typeCode.code_name}</label>
		                            		</c:otherwise>
		                            	</c:choose>
		                            	</c:forEach>
		                            	
		                            </div>
		                        </section>
		                    </fieldset>
		                    <fieldset style="padding: 15px 15px 5px;">
		                        <section>
		                            <label class="label">정렬</label>
				                            <label class="select">
				                                <select name="searchCondition2">
						                                    <option value="">선택하세요.</option>
				                                	<c:forEach var="sortCode" items="${sortCode}">
				                                	<c:choose>
				                                		<c:when test="${plannerDto.searchCondition2==sortCode.code}">
						                                    <option value="${sortCode.code}" selected="selected">${sortCode.code_name}(${sortCode.code})</option>
				                                		</c:when>
				                                		<c:otherwise>
						                                    <option value="${sortCode.code}">${sortCode.code_name}(${sortCode.code})</option>
				                                		</c:otherwise>
				                                	</c:choose>
				                                	</c:forEach>
				                                </select>
				                                <i></i>
				                            </label>
		                        </section>
		                    </fieldset>
		                    <!-- 명소 종류 선택 끝 -->
		                    <!-- 명소 검색 버튼 시작 -->
		                    <footer>
		                        <button class="btn-u" onclick="goSearchForm()">검색</button>
		                        <button type="button" class="btn-u btn-u-default" onclick="window.history.back();">뒤로</button>
		                    </footer>
				totalCount:<input type="text" name="totalCount" value="${plannerDto.totalCount}">
				startRow:<input type="text" name="startRow" value="${plannerDto.startRow}">
				endRow:<input type="text" name="endRow" value="${plannerDto.endRow}">
				currentPage:<input type="text" name="currentPage" value="${plannerDto.currentPage}">
				pageBlock:<input type="text" name="pageBlock" value="${plannerDto.pageBlock}">
				startPage:<input type="text" name="startPage" value="${plannerDto.startPage}">
				endPage:<input type="text" name="endPage" value="${plannerDto.endPage}">
 				<%-- SearchCondition1:<input type="text" name="searchCondition1" value="${plannerDto.searchCondition1}"> --%>
				<%-- SearchCondition2:<input type="text" name="searchCondition2" value="${plannerDto.searchCondition2}"> --%>
				<%-- setSearchWord1:<input type="text" name="searchWord1" value="${plannerDto.searchWord1}"> --%>
		                </form>
			            <!-- End Blog Newsletter -->
		            </div>
		         </div>
			<!-- 사이드 메뉴  끝 -->
	         <!-- End sideBar -->
	         
	         <!-- 명소 검색 뷰 시작 -->
               <div class="col-md-9">
               		<div class="blog_masonry_3col">
				        <div class="container-fluid content grid-boxes masonry" style="position: relative; height: 2250px; overflow: hidden;">
				        	<c:forEach var="planner" items="${plannerList}">
				        		<div class="grid-boxes-in masonry-brick" style="position: absolute; width: 300px; top: 40px; left: 15px;">
					                <a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}">
					                	<img class="img-responsive" src="/attatchFile/planner/${planner.attach_file}" alt="">
					                </a>
					                <div class="grid-boxes-caption">
					                    <h3><a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title}</a></h3>
						                 <span><c:out value="${planner.mem_name}"/></span>
					                    <ul class="list-inline grid-boxes-news">
					                        <li><i class="fa fa-comments-o" title="댓글">&nbsp;<c:out value="${planner.reply_Count}" escapeXml="false"/></i></li>
					                        <li>|</li>
					                        <li><i class="fa fa-heart" title="좋아요">&nbsp;<c:out value="${planner.sweet_count}"/></i></li>
					                        <li>|</li>
					                        <li><i class="fa fa-tags" title="북마크">&nbsp;<c:out value="${planner.bookmark_Count}"/></i></li>
					                        <li>|</li>
					                        <li><i class="fa fa-pencil" title="등록일"></i><fmt:formatDate pattern="yy-MM-dd" value="${planner.reg_date}"/></li>
					                    	<li>
					                    		${planner.memo}
					                    	</li>
					                        <li style="border-top: 1px solid;"><div style="margin: 1px auto;"><i class="fa fa-clock-o" title="여행기간"></i>&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${planner.start_date}"/>&nbsp;~&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${planner.end_date}"/></div></li>
					                    </ul>
					                </div>
					            </div>
				        	</c:forEach>
				        </div><!--/container-->
				    </div>
               </div>
	         	<!-- 명소 아이템 리스트 끝 -->
          	</div>
          	<!-- End Container -->

	     <!--=== Footer Version 1 ===-->
	    <!--=== End Footer Version 1 ===-->
    </div>
	    <div class="footer-v1">
			<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	    </div>
    
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
	    jQuery(document).ready(function() {
	        App.initScrollBar();
	    });
	</script>
  </body>
</html>
<%-- 	<c:forEach var="planner" items="${plannerList}">
		<div>
			<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title} </a>
		</div>
	</c:forEach> --%>