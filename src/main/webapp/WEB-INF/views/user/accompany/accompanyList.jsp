<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>동행구하기 게시판</title>
	<link href="/script/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
	<!-- CSS Theme-->
	<link rel="stylesheet" href="/assets/css/theme-colors/default.css">
	<!-- JS Page Level -->
	<script src="/assets/js/app.js"></script>

	<script type="text/javascript" src="/script/common/commonReply.js"></script>
	<!-- 제이쿼리 라이브러리.(필수) : commonReplyInit() 함수호출 전 선언  -->
	<script src="/assets/plugins/jquery/jquery.min.js"></script>
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  
	<script type="text/javascript" src="/script/common/commonReply.js"></script>
	<!-- 제이쿼리 라이브러리.(필수) : commonReplyInit() 함수호출 전 선언  -->
	<script src="/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript">
		function searchFun() {
			var search=document.getElementById("search").value;
			var status=document.getElementById("accompany_status_code").value;
			location.href="/user/accompany/accompanyList.do?search="+search+"&accompany_status_code="+status;
		}
		
		function statusFunc() {
			var status = document.getElementById("accompany_status_code").value;
			location.href="/user/accompany/accompanyList.do?accompany_status_code="+status;
		}
		
		$(document).ready(function(){
		    $(".nav-tabs a").click(function(){
		        $(this).tab('show');
		        alert();
		    });
		});
	</script>
  </head>
  <body>
	<div class="wrapper">
	    <!--=== Header ===-->
	    <!-- Header가 꼭 imprt 되어 있어야 한다.(안그러면화면이깨짐) -->
	    <div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	    </div>
	    
	    <!--=== End Header ===-->
	   
	   
	   <div class="breadcrumbs-v1">
        <div class="container">
            <span>사람들과 함께 더 재미있는 여행을 즐기세요</span>
            <h1><a href="/user/accompany/accompanyList.do" style="color:inherit; text-decoration: none;">동행구하기 게시판</a></h1>
	        </div>
	    </div>
	   <div class="bg-color-light">
        <div class="container content-sm">
            <div class="row">
                <!-- Blog Sidebar -->
                <div class="col-md-3">
                
               	   <div class="headline-v2"><h2>검색</h2></div>
                    <!-- Blog Newsletter -->
                    <div class="blog-newsletter">
                        <p>원하는 동행을 검색을 통해 찾아보세요.</p>
                       	<div class="input-group">
                            <input type="text" class="form-control" id="search" placeholder="Search">
                            <span class="input-group-btn">
                                <button class="btn-u" type="button" onclick="searchFun()">검색</button>
                            </span>
                    	 	</div>
                        <br/><br/>
                    </div>
                    <!-- End Blog Newsletter -->
                    
                    <div class="headline-v2"><h2>최근 글</h2></div>
                    <!-- Latest Links -->
                    <ul class="list-unstyled blog-latest-posts margin-bottom-50">
                    	<c:forEach var="recentAccompanyDto" items="${recentAccompanyList}">
                    		<li>
                    			<h3><a href="/user/accompany/accompanyRead.do?accompany_no=${recentAccompanyDto.accompany_no}&currentPage=${currentPage}">${recentAccompanyDto.title}</a></h3>
                    			<small><fmt:formatDate pattern="MM-dd" value="${recentAccompanyDto.write_date}"/> / <a href="#">${recentAccompanyDto.mem_name}</a></small>
                    			<p>${fn:substring(recentAccompanyDto.content, 0, 70)}
						        <c:if test="${fn:length(albumDto.content) >70}">
						        	…
						        </c:if></p>
                    		</li>
                    	</c:forEach>
                    </ul>
                    <!-- End Latest Links -->
                 
                </div>
                <!-- End Blog Sidebar -->

                <!-- 게시글 시작 -->
                <div class="col-md-9">
                	<div class="news-v3 bg-color-white margin-bottom-30">
                        <div class="news-v3-in">
                        
                        	<div class="tab-v2">
			                    <ul class="nav nav-tabs">
			                    	<li class="active"><a href="#" data-toggle="tab">전체</a></li>
			                    	<c:forEach var="postType" items="${postTypeList}">
			                    		 <li class=""><a href="#" data-toggle="tab">${postType.code_name}</a></li>
			                    	</c:forEach>
			                    </ul>                
			                    
			                </div>
                        
		                	<!-- 게시판 리스트 시작 -->
		                	<select id="accompany_status_code" onchange="statusFunc()">
		                		<option value=""  disabled selected style="display:none;">모두</option>
								<c:forEach var="postType" items="${postTypeList}">
									<option value="${postType.code}">${postType.code_name}</option>
								</c:forEach>
							</select>
		
		                	<c:if test="${searchValue != '' || searchValue ne null}">
		                		<span class="results-number">${seachValue} Total: ${count} results</span><br/><br/>
		                	</c:if>
		                	
		                	
		                	<!-- 게시글이 없을 경우 -->
							<c:if test="${count == 0}">
								<h2>게시판에 저장된 글이 없습니다.</h2>
							</c:if>
							<!-- 게시글이 있을 경우 -->
							<c:if test="${count > 0 }">
								<table class="table">
									<tr>
										<td width="50">번호</td>
										<td width="80">종류</td>
										<td width="300">제목</td>
										<td width="120">글쓴이</td>
										<td width="100">날짜</td>
										<td width="60">조회</td>			
									</tr>
									<c:forEach var="accompanyDto" items="${accompanyList}">
										<tr>
											<td>${accompanyDto.accompany_no}</td>
											<!-- 게시글 종류  -->
											<td>
												<c:forEach var="postType" items="${postTypeList}">
													<c:if test="${accompanyDto.accompany_status_code==postType.code}">
														<a href="#" style="color:inherit;">${postType.code_name}</a>
													</c:if>
												</c:forEach>
											</td>
											<td><a href ="/user/accompany/accompanyRead.do?accompany_no=${accompanyDto.accompany_no}&currentPage=${currentPage}" style="color:inherit;">${accompanyDto.title}</a>&nbsp;<span class="badge badge-u">${accompanyDto.reply_count}</span></td>
											<td>${accompanyDto.mem_name}</td>
											<td><fmt:formatDate pattern="MM-dd" value="${accompanyDto.write_date}"/></td>
											<td>${accompanyDto.hits}</td>
										</tr>
								   </c:forEach>
								</table>
							</c:if>
							
							<div class="row">
								<div class="col-md-2 col-md-push-10">
									<!-- 글쓰기 버튼 -->
									<button type="button" class="btn-u" onclick="location.href='/user/accompany/accompanyWrite.do'">글쓰기</button>
								</div>
								<div class="col-md-10 col-md-pull-2">
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
													  	<a href="/user/accompany/accompanyList.do?pageNumber=${currentPage-pageBlock}" aria-label="Previous">
													        <span aria-hidden="true">&laquo;</span>
												     	</a>
													</c:if>
												    <c:forEach var="i" begin="${startPage}" end="${endPage}">
														 <c:if test="${i!=currentPage}">
														 	<li><a href="/user/accompany/accompanyList.do?pageNumber=${i}" role="button" class="btn btn-default">${i}</a></li>
														 </c:if>
														 <c:if test="${i==currentPage}">
														 	<li class="active"><a href="/user/accompany/accompanyList.do?pageNumber=${i}" role="button" class="btn btn-default">${i}</a></li>
														 </c:if>
													</c:forEach>
													
											  		<c:if test="${endPage < pageCount }">
											  			<li>
													      <a href="/user/accompany/accompanyList.do?pageNumber=${currentPage+pageBlock}" aria-label="Next">
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
		                	<!-- 게시판 리스트 끝 -->
		                </div>
	                </div>
	                </div>
	                <!-- 게시판 종료 -->
	            </div>
	        </div><!--/end container-->
	        <!-- End Content Part -->
				
                 
		    <!--=== Footer Version 1 ===-->
		    <div class="footer-v1">
				<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		    </div>
		    <!--=== End Footer Version 1 ===-->
		    
		    <!-- 쪽지함에서 충돌로 인하 주석처리! -->
			<script type="text/javascript" src="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
			<!-- 쪽지함에서 충돌로 인하 주석처리! -->
			<script type="text/javascript" src="/assets/js/plugins/owl-carousel.js"></script>
	    </div>
    </div>
  </body>
</html>