<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
	<!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/assets/css/pages/profile.css">
    <link rel="stylesheet" href="/assets/css/pages/shortcode_timeline1.css">
    <link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/assets/plugins/animate.css">
    
    <!-- item 3개씩 나오게 -->
	<link href="/assets/css/pages/blog_masonry_3col.css" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <!--=== Header ===-->
    <div class="header">
			<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	</div>
    <!--=== End Header ===-->

    <!--=== Profile ===-->
    <div class="container content profile">
    	<div class="row">
            <!--Left Sidebar-->
            <div class="col-md-3 md-margin-bottom-40">
                <c:import url="/WEB-INF/views/user/mypage/myPageLeft.jsp"/>
            </div>
            <!--End Left Sidebar-->

			<!-- 메인------------------------------------------------------------------------------------------------------------------------------ -->
			<!--=== News Block ===-->
	        	<div class="col-md-9">
					<div class="blog_masonry_3col">
		        	<c:if test="${count==0}">
	                     <div class="shadow-wrapper">
		                    <div class="tag-box tag-box-v1 box-shadow shadow-effect-2">
		                        <h2>아직 여행계획이 없으시군요.</h2>
		                        <p>새로운 여행계획.<br/>
		                         당신만의 여행계획을 만들어보세요.<br/>
		                         </p>
		                    </div>
		                </div>
					</c:if>
					<c:if test="${count>0}">
						<div class="shadow-wrapper">
		                    <div class="tag-box tag-box-v1 box-shadow shadow-effect-2">
		                        <h2><c:out value="${memberDto.mem_name}님의 여행"></c:out></h2>
		                    </div>
		                </div>
						<c:forEach var="planner" items="${plannerList}">
				            <div class="col-md-4">
				            <div class="grid-boxes-in" style="height: 360px;">
				                <img class="img-responsive" src="/attatchFile/planner/${planner.attach_file}" alt="${planner.title}" onError="this.src='/attatchFile/spot/no_image.jpg'" height="80%" width="100%" style="min-height: 170px;">
				                <div class="grid-boxes-caption">
										<h3><a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> 
												<c:out value="${fn:substring(planner.memo, 0,10)}" escapeXml="false"/>
						                    	<c:if test="${fn:length(planner.memo) >10}">
										        	…
										        </c:if>
										</a></h3>
										 <span style="font-weight: bolder;"><c:out value="${memberDto.mem_name}"/></span>
										 <span style="color: #777;float: right;"><i class="fa fa-pencil" title="등록일"><fmt:formatDate pattern="yy-MM-dd" value="${planner.reg_date}"/></i></span>
										<ul class="list-inline grid-boxes-news">
											<li><i class="fa fa-comments-o" title="댓글">&nbsp;<c:out value="${planner.reply_Count}" escapeXml="false"/></i></li>
											<li>|</li>
											<li><i class="fa fa-heart" title="좋아요">&nbsp;<c:out value="${planner.sweet_count}"/></i></li>
											<li>|</li>
											<li><i class="fa fa-tags" title="북마크">&nbsp;<c:out value="${planner.bookmark_Count}"/></i></li>
											<li>|</li>
											<li></li>
											<li>
												<c:out value="${fn:substring(planner.memo, 0,19)}" escapeXml="false"/>
						                    	<c:if test="${fn:length(planner.memo) >19}">
										        	…
										        </c:if>
												<br />
											</li>
											<li style="border-top: 1px solid;"><div style="margin: 1px auto;"><i class="fa fa-clock-o" title="여행기간"></i>&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${planner.start_date}"/>&nbsp;~&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${planner.end_date}"/></div></li>
										</ul>
									</div>
				            </div>
				            </div>
						</c:forEach>
					</c:if>
					</div>
		        </div>
		        
		        <div align="center">
					<c:if test="${count>0}">
						<div class="btn-group" role="group" aria-label="First group" align="center">
							<c:set var="pageBlock" value="3" />
							<fmt:parseNumber var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1)}" integerOnly="true"/>
							<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
							<c:set var="startPage" value="${result*pageBlock+1}"/>
							<c:set var="endPage" value="${startPage+pageBlock-1}"/>
							
							<!-- 마지막 페이지가 페이지 수보다 작으면 -->
							<c:if test="${endPage > pageCount }">
								<c:set var="endPage" value="${pageCount}"/>
							</c:if>
							
							<!-- 페이징 -->
							<c:choose>
								<c:when test="${memberDto.mem_no==mem_object.mem_no}">
									<c:set var="uandMe" value="uandMe=S0001"/>		
								</c:when>
								<c:otherwise>
									<c:set var="uandMe" value="uandMe=S0002"/>
								</c:otherwise>
							</c:choose>
							
							<nav>
							  <ul class="pagination">
							  	<c:if test="${startPage > pageBlock}">
								  	<li>
									  	<a href="/user/myPage/myPage.do?${uandMe}&mem_no=${memberDto.mem_no}&pageNumber=${currentPage-pageBlock}" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
								     	</a>
							     	</li>
								</c:if>
							    <c:forEach var="i" begin="${startPage}" end="${endPage}">
									 <c:if test="${i!=currentPage}">
									 	<li><a href="/user/myPage/myPage.do?${uandMe}&mem_no=${memberDto.mem_no}&pageNumber=${i}" role="button" class="btn btn-default">${i}</a></li>
									 </c:if>
									 <c:if test="${i==currentPage}">
									 	<li class="active"><a href="#" role="button" class="btn btn-default">${i}</a></li>
									 </c:if>
								</c:forEach>
								
						  		<c:if test="${endPage < pageCount }">
						  			<li>
								      <a href="/user/myPage/myPage.do?${uandMe}&mem_no=${memberDto.mem_no}&pageNumber=${startPage+pageBlock}" aria-label="Next">
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

                <div class="margin-bottom-40"></div>
		        
            <!-- 메인------------------------------------------------------------------------------------------------------------------------------ -->
        </div>
    </div><!--/container-->
    <!--=== End Profile ===-->

    <!--=== Footer Version 1 ===-->
    <div class="footer-v1">
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	</div>
    <!--=== End Footer Version 1 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->
<!-- <script type="text/javascript" src="/assets/plugins/jquery/jquery.min.js"></script> -->
<script type="text/javascript" src="/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="/assets/plugins/counter/waypoints.min.js"></script>
<script type="text/javascript" src="/assets/plugins/counter/jquery.counterup.min.js"></script>
<script type="text/javascript" src="/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/assets/js/app.js"></script>
<script type="text/javascript" src="/assets/js/plugins/datepicker.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        App.initCounter();
        App.initScrollBar();
        Datepicker.initDatepicker();
    });
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>