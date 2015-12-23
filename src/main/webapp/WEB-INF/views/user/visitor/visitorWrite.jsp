<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/style.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="/assets/plugins/animate.css">
<link rel="stylesheet" href="/assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="/assets/css/pages/profile.css">
<link rel="stylesheet" href="/assets/css/pages/shortcode_timeline1.css">

<!-- CSS Customization -->
<link rel="stylesheet" href="/assets/css/custom.css">

<c:import url="/WEB-INF/views/common/jquery.jsp" />
<c:import url="/WEB-INF/views/user/common/utilImport.jsp" />
</head>
<body>
<div class="wrapper">
    <!--=== Header ===-->
    <div class="header">
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
            <!-- Profile Content -->
            <div class="col-md-9">
				<div class="panel panel-u margin-bottom-40">
	            	<div class="panel-heading" style="height:30px;" align="left">
	                	<h3 class="panel-title" style="margin-top:0px;">No.${visitorDto.visitor_no}</h3>
	               	</div>
	                <div class="panel-body">
	                    <form class="margin-bottom-40" role="form" action="/user/visitor/visitorWrite.do" method="post" onsubmit="return visitorForm(this)">
							<div class="form-group" align="left">
								<span>아이디:${visitorDto.mem_no}</span>
							</div>
							<div class="form-group">
								<textarea class="form-control" rows="5" cols="65" name="visitor_content" style="resize:none;"></textarea>
							</div>
							<div class="form-group" align="right">
								<input type="submit" class="btn-u" value="작성"/>
							</div>
						</form>
					</div>
	        	</div>
	        	
	        	<c:if test="${count>0}">
					<c:forEach var="visitor" items="${visitorList}">
						<div class="panel panel-u margin-bottom-40">
		            		<div class="panel-heading" style="height:30px;" align="left">
		                		<h3 class="panel-title" style="float:left; margin-top:0px; margin-right:620px;">No.${visitor.visitor_no}</h3>
								<fmt:formatDate value="${visitor.visitor_write_date}" type="both"/>
		                	</div>
		                	<div class="panel-body">
		                    	<div class="form-group" align="left">
									<a href="/user/mypage/myPage.do?mem_no=${visitor.mem_no}">아이디:${visitor.mem_no}</a>
								</div>
								<div class="form-group" style="height:110px;">
									<div align="left">${visitor.visitor_content}</div>
								</div>
								<div class="form-group" align="right"> 
									<a class="btn-u" href="/user/visitor/visitorUpdate.do?mem_no=${memberDto.mem_no}&visitor_no=${visitor.visitor_no}&pageNumber=${currentPage}">수정</a> 
									<a class="btn-u" href="/user/visitor/visitorDelete.do?mem_no=${memberDto.mem_no}&visitor_no=${visitor.visitor_no}&pageNumber=${currentPage}">삭제</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			
			
				<div align="center">
				<c:if test="${count>0}">
					<div class="btn-group" role="group" aria-label="First group" align="center">
						<c:set var="pageBlock" value="3" />
															<!-- 1-->
						<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1)}"/>
							
						<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
						<c:set var="startPage" value="${result*pageBlock+1}"/>
						<c:set var="endPage" value="${startPage+pageBlock-1}"/>
						count : ${count} <br/>
						startPage : ${startPage}<br/>
						endPage : ${endPage}<br/>
						currentPage : ${currentPage}<br/>
						pageCount : ${pageCount}<br/>
						count/boardSize+(count%boardSize==0?0:1) : ${count/boardSize+(count%boardSize==0?0:1)}<br/>
						result : ${result}, ${(currentPage-1)/pageBlock}
						<!-- 마지막 페이지가 페이지 수보다 작으면 -->
						<c:if test="${endPage > pageCount }">
							<c:set var="endPage" value="${pageCount}"/>
						</c:if>
						
						<!-- 페이징 -->
						<nav>
						  <ul class="pagination">
						  	<c:if test="${startPage > pageBlock}">
							  	<li>
								  	<a href="/user/visitor/visitorWrite.do?uandMe=S0001&mem_no=${memberDto.mem_no}&pageNumber=${currentPage-pageBlock}" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
							     	</a>
						     	</li>
							</c:if>
						    <c:forEach var="i" begin="${startPage}" end="${endPage}">
								 <c:if test="${i!=currentPage}">
								 	<li><a href="/user/visitor/visitorWrite.do?uandMe=S0001&mem_no=${memberDto.mem_no}&pageNumber=${i}" role="button" class="btn btn-default">${i}</a></li>
								 </c:if>
								 <c:if test="${i==currentPage}">
								 	<li class="active"><a href="#" role="button" class="btn btn-default">${i}</a></li>
								 </c:if>
							</c:forEach>
							
					  		<c:if test="${endPage < pageCount }">
					  			<li>
							      <a href="/user/visitor/visitorWrite.do?uandMe=S0001&mem_no=${memberDto.mem_no}&pageNumber=${startPage+pageBlock}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							</c:if>
						  </ul>
						  
						  <%-- <c:if test="${memberDto.mem_no==mem_object.mem_no}">
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
								 	<li class="active"><a href="/user/visitor/visitorWrite.do?uandMe=S0001&mem_no=${memberDto.mem_no}&pageNumber=${i}" role="button" class="btn btn-default">${i}</a></li>
								</c:forEach>
							</c:if> --%>
						</nav>
						<!-- 페이징 끝 -->
					</div>
				</c:if>
				</div>
			</div>
			
			
	            <!-- End Profile Content -->
	            <!-- 메인------------------------------------------------------------------------------------------------------------------------------ -->
	        <!--  -->
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
<script type="text/javascript" src="/assets/plugins/jquery/jquery.min.js"></script>
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