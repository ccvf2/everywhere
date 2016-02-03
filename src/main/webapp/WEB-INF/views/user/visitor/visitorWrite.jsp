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
<script type="text/javascript">
	function upViewDisplay(visitor_no){
		var e=document.getElementById(visitor_no+"_upView");
		var upbtn=document.getElementById("upbtn_"+visitor_no);
		
		if(e.style.display == 'block'){
			e.style.display = 'none';
          	upbtn.value="수정";
		}else{
          	e.style.display = 'block';
			upbtn.value="취소";
        }
	}
</script>
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
            <div class="col-md-9">
            	<c:if test="${memberDto.mem_no==mem_object.mem_no}">
	                <c:if test="${count==0}">
						<div class="shadow-wrapper">
		                    <div class="tag-box tag-box-v1 box-shadow shadow-effect-2">
		                        <h2>아직 작성된 방명록이 없군요.</h2>
		                        <p>
		                         더 많은 친구를 추가하여, 회원들과 다양한 소식을 함께 즐기세요.<br/>
		                        </p>
		                    </div>
		                </div>
					</c:if>
					<c:if test="${count>0}">
						<div class="shadow-wrapper">
			                <div class="tag-box tag-box-v1 box-shadow shadow-effect-2">
			                    <h2><c:out value="${memberDto.mem_name}님의 방명록"/></h2>
			                </div>
		                </div>
					</c:if>
				</c:if>
				
            	<c:if test="${memberDto.mem_no!=mem_object.mem_no}">
	                <div class="clearfix margin-bottom-30"></div>
	                <div class="shadow-wrapper">
	                    <blockquote class="hero box-shadow shadow-effect-2">
		                    <form action="/user/visitor/visitorWrite.do" method="post" onsubmit="return visitorForm(this)">
		                    	<input type="hidden" name="mem_no" value="${mem_object.mem_no}">	<!-- 보내는사람 no -->
		                    	<input type="hidden" name="mate_mem_no" value="${memberDto.mem_no}"> <!-- 받는 사람 no -->
		                    	<input type="hidden" name="uandMe" value="S0002">
		                    	
		                    	<p><em><c:out value="from.${memberDto.mem_name} (${memberDto.mem_email})"/></em></p>
		                        <p><em>
									<textarea class="form-control" rows="4" cols="65" name="visitor_content" style="resize:none;"></textarea>
		                        </em></p> 
		                        <small><em><c:out value="to.${mem_object.mem_name} (${memberDto.mem_email})"/></em></small>
		                        <div align="right">
									<input type="submit" value="작성"/>
								</div>
							</form>
	                    </blockquote>
	                </div>
                </c:if>
                
                <c:if test="${count>0}">
					<c:forEach var="visitor" items="${visitorList}">
						<div class="clearfix margin-bottom-30"></div>
		                <div class="shadow-wrapper">
		                    <blockquote class="hero box-shadow shadow-effect-2">
		                    		<c:choose>
		                    			<c:when test="${visitor.mem_no==mem_object.mem_no}">
		                    				<c:set var="url" value="/user/myPage/myPage.do?uandMe=S0001"/>
		                    			</c:when>
		                    			<c:when test="${visitor.mem_no!=mem_object.mem_no}">
		                    				<c:set var="url" value="/user/myPage/myPage.do?uandMe=S0002"/>
		                    			</c:when>
		                    		</c:choose>
			                    	
			                        <p align="left"><em>
											<c:out value="${visitor.visitor_content}"/>
			                        </em></p>
			                        
				                        <div align="right">
				                        	<c:if test="${visitor.mem_no==mem_object.mem_no}">
					                        	<input type="button" class="btn btn-default" id="upbtn_${visitor.visitor_no}" value="수정" onclick="javascript:upViewDisplay(${visitor.visitor_no})"/>
					                        </c:if>
					                        <c:if test="${(visitor.mem_no==mem_object.mem_no) || uandMe=='S0001'}">
							                	<input type="button" class="btn btn-default" value="삭제" onclick="javascript:location.href='/user/visitor/visitorDelete.do?visitor_no=${visitor.visitor_no}&mem_no=${memberDto.mem_no}&uandMe=${uandMe}'"/>
					                        </c:if>
				                        </div> 
			                        <p align="left" style="float: left;"><em>
			                        <a href="${url}&mem_no=${visitor.mem_no}&SCHEDULE_TYPE=E0002&MYPAGE_SEARCH_CODE=M1029">
				                    	&gt;<c:out value="${visitor.mem_name}(${visitor.mem_email})"/>
				                    </a>
				                    </em></p> 
				                    <div align="right" style="float: right; font-size:0.8em;"><fmt:formatDate value="${visitor.visitor_write_date}" type="both"/></div><br/>
		                    </blockquote>
		                    
		                    <div class="shadow-wrapper" id="${visitor.visitor_no}_upView" style="display:none;">
			                    <blockquote class="hero box-shadow shadow-effect-2">
				                    <form action="/user/visitor/visitorUpdate.do" method="get" onsubmit="return visitorForm(this)">
				                    	<input type="hidden" name="visitor_no" value="${visitor.visitor_no}">	<!-- 글번호 -->
				                    	<input type="hidden" name="mate_mem_no" value="${memberDto.mem_no}"> <!-- 받는 사람 no -->
				                    	<input type="hidden" name="uandMe" value="S0002">
				                    	
				                    	<p><em><c:out value="from.${memberDto.mem_name} (${memberDto.mem_email})"/></em></p>
				                        <p><em>
											<textarea class="form-control" rows="4" cols="65" name="visitor_content" style="resize:none;"><c:out value="${visitor.visitor_content}"/></textarea>
				                        </em></p> 
				                        <small><em><c:out value="to.${mem_object.mem_name} (${memberDto.mem_email})"/></em></small>
				                        <div align="right">
											<input type="submit" value="수정완료"/>
										</div>
									</form>
			                    </blockquote>
			                </div>
		                </div>
						
					</c:forEach>
				</c:if>
				
				<div align="center">
					<c:if test="${count>0}">
						<div class="btn-group" role="group" aria-label="First group" align="center">
							<c:set var="pageBlock" value="3" />
							<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1)}"/>
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
									  	<a href="/user/visitor/visitorWrite.do?${uandMe}&mem_no=${memberDto.mem_no}&pageNumber=${currentPage-pageBlock}" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
								     	</a>
							     	</li>
								</c:if>
							    <c:forEach var="i" begin="${startPage}" end="${endPage}">
									 <c:if test="${i!=currentPage}">
									 	<li><a href="/user/visitor/visitorWrite.do?${uandMe}&mem_no=${memberDto.mem_no}&pageNumber=${i}" role="button" class="btn btn-default">${i}</a></li>
									 </c:if>
									 <c:if test="${i==currentPage}">
									 	<li class="active"><a href="#" role="button" class="btn btn-default">${i}</a></li>
									 </c:if>
								</c:forEach>
								
						  		<c:if test="${endPage < pageCount }">
						  			<li>
								      <a href="/user/visitor/visitorWrite.do?${uandMe}&mem_no=${memberDto.mem_no}&pageNumber=${startPage+pageBlock}" aria-label="Next">
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