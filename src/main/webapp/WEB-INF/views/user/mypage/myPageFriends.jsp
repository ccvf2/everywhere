<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page-Friends List</title>
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
    
    <!-- brand button css -->
    <link rel="stylesheet" href="/assets/plugins/brand-buttons/brand-buttons.css">
</head>
<body>
<div class="wrapper">
    <!--=== Header ===-->
    <div class="header">
    		<c:import url="/WEB-INF/views/common/jquery.jsp"/>
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
            <!-- Profile Content -->
            <div class="col-md-9">
                <div class="profile-body margin-bottom-20">
                    <!--Profile Blog-->
                    <div class="row margin-bottom-20">
                    	<c:if test="${friendsList.size()==0}">
	                        <div class="alert alert-info alert-dismissable">
	                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                            <i class="fa fa-info-circle"></i>  <strong><c:out value="${memberDto.mem_name}"/>님의 친구들</strong>&nbsp;&nbsp;&nbsp; <c:out value="${count}"/>명. 친구를 추가하세요!
	                        </div>
                    	</c:if>
                    	<c:if test="${friendsList.size()>0}">
	                   		<div class="alert alert-info alert-dismissable">
	                   			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                            <i class="fa fa-info-circle"></i>  <strong><c:out value="${memberDto.mem_name}"/>님의 친구들</strong>&nbsp;&nbsp;&nbsp; <c:out value="${count}"/>명.
	                       	</div>
	                    </c:if>
                    	<form method="get" id="sky-form3" class="sky-form">
		                    <header>새로운 친구를 찾아보세요</header>
		                    <fieldset>      
								<section>
		                            <label class="label">친구검색</label>
		                            <div class="input-group">
		                            <input type="text" class="form-control" id="search" placeholder="친구이름 or 이메일">
		                            <span class="input-group-btn">
		                                <button class="btn-u btn-block" type="button" onclick="javascript:location.href='/user/myPage/searchFriends.do?mem_no=${memberDto.mem_no}&search='+search.value">검색</button>
		                            </span>
		                    	 	</div>
		                        </section>
							</fieldset>
						</form>
                    	<c:if test="${friendsList.size()>0}">
                       		<hr/>
	                       	<div>
		            			<c:forEach var="friendsList" items="${friendsList}">
		            				<c:choose>
										<c:when test="${friendsList.mem_profile_photo==null}">
											<c:set var="friendProfile" value="/assets/img/testimonials/user.jpg"/>
										</c:when>
										<c:otherwise>
											<c:set var="friendProfile" value="/attatchFile/member/${friendsList.mem_profile_photo}"/>
										</c:otherwise>
									</c:choose>
			                        <div class="col-sm-6 sm-margin-bottom-20">
			                            <div class="profile-blog">
			                                <img class="rounded-x" src="${friendProfile}" alt="">
			                                <div class="name-location">
			                                    <strong><a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${friendsList.mem_no}&SCHEDULE_TYPE=E0002&MYPAGE_SEARCH_CODE=M1029"><c:out value="${friendsList.mem_name}"/></a></strong>
			                                    <span><i class="fa fa-map-marker"></i><a href="/user/message/messageTalkList.do?recv_mem_no=${friendsList.mem_no}"><c:out value="${friendsList.mem_email}"/></a></span>
			                                </div>
			                                <div class="clearfix margin-bottom-20"></div>
			                                <hr>
			                            </div>
			                        </div>
				                </c:forEach>
			                </div>
		                </c:if>
	                </div><!--/end row-->
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
										  	<a href="/user/myPage/friends.do?mem_no=${memberDto.mem_no}&pageNumber=${currentPage-pageBlock}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
									     	</a>
								     	</li>
									</c:if>
								    <c:forEach var="i" begin="${startPage}" end="${endPage}">
										 <c:if test="${i!=currentPage}">
										 	<li><a href="/user/myPage/friends.do?mem_no=${memberDto.mem_no}&pageNumber=${i}" role="button" class="btn btn-default">${i}</a></li>
										 </c:if>
										 <c:if test="${i==currentPage}">
										 	<li class="active"><a href="#" role="button" class="btn btn-default">${i}</a></li>
										 </c:if>
									</c:forEach>
									
							  		<c:if test="${endPage < pageCount }">
							  			<li>
									      <a href="/user/myPage/friends.do?mem_no=${memberDto.mem_no}&pageNumber=${startPage+pageBlock}" aria-label="Next">
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
	                <!--End Profile Blog-->
                </div>
            </div>
            <!-- End Profile Content -->
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