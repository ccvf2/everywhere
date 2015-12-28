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
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
//검색조건 변경
	function changeSearchValue(){
		var form = document.getElementById("plannerListForm");
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
				<c:import url="/WEB-INF/views/user/planner/plannerListLeft.jsp">
				</c:import>
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
					                        <li style="border-top: 1px solid;"><i class="fa fa-clock-o" title="여행기간"></i>&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${planner.start_date}"/>&nbsp;~&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${planner.end_date}"/></li>
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
			<form name="test" id="plannerListForm" method="post" >
				totalCount:<input type="text" name="totalCount" value="${plannerDto.totalCount}">
				<br/>
				startRow:<input type="text" name="startRow" value="${plannerDto.startRow}">
				<br/>
				endRow:<input type="text" name="endRow" value="${plannerDto.endRow}">
				<br/>
				currentPage:<input type="text" name="currentPage" value="${plannerDto.currentPage}">
				<br/>
				pageBlock:<input type="text" name="pageBlock" value="${plannerDto.pageBlock}">
				<br/>
				startPage:<input type="text" name="startPage" value="${plannerDto.startPage}">
				<br/>
				endPage:<input type="text" name="endPage" value="${plannerDto.endPage}">
				<br/>
				SearchCondition1:<input type="text" name="searchCondition1" value="${plannerDto.searchCondition1}">
				<br/>
				SearchCondition2:<input type="text" name="searchCondition2" value="${plannerDto.searchCondition2}">
				<br/>
				setSearchWord1:<input type="text" name="searchWord1" value="${plannerDto.searchWord1}">
				<br/>
				<input type="submit" value="전송">
			</form>
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