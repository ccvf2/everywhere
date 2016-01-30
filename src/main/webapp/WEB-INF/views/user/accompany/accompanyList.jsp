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
		function activeFunction(){
			//상태값이 전달되지 않았을 경우 게시글 종류로 전체를 active하는 스크립트
			//먼저 전체 항목 id에 대해 active
			$("#0000").addClass('active');
			//H000으로 시작하는 아이디 중에서
			$("[id*=H000]").each(function() {
				// H000으로 시작하는 li태그 중에서 active가 있다면 (이전 페이지에서 탭을 선택했음)
				if($(this).hasClass('active')) {
					// '전체'탭에 대해서 active제거
					$("#0000").removeClass();
					return;
				}
			});
			//alert("전체 ");
		}
	
		function searchFun() {
			var search=document.getElementById("search").value;
			//선택된 탭의 id로부터 코드을 가져옴
			var accompany_status_code=$(".nav-tabs .active").attr('id');
			//alert(accompany_status_code);
			location.href="/user/accompany/accompanyList.do?search="+search+"&accompany_status_code="+accompany_status_code;
			//location.href="/user/accompany/accompanyList.do?search="+search;
		}
		
		$(document).ready(function(){
			$(".nav-tabs a").click(function(){
				$(this).tab('show');
				$(this).parent().addClass("active");
	
				var search=document.getElementById("search").value;
				//선택된 탭의 id로부터 코드을 가져옴
				var accompany_status_code=$(".nav-tabs .active").attr('id');
				//alert(accompany_status_code);
				location.href="/user/accompany/accompanyList.do?search="+search+"&accompany_status_code="+accompany_status_code;
			});
		});
	</script>
	<c:import url="/WEB-INF/views/common/jquery.jsp"/>
	<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
</head>
<body onload="activeFunction()">
	<!-- 글 작성일 계산을 위한 현제 날짜 -->
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate var="nowDate" value="${now}" pattern="yy-MM-dd"/>

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
						<!-- 검색 부분 -->
						<div class="headline-v2"><h2>검색</h2></div>
						<!-- Blog Newsletter -->
						<div class="blog-newsletter">
							<p>원하는 동행을 검색을 통해 찾아보세요.</p>
							<div class="input-group">
								<input type="text" class="form-control" id="search" placeholder="Search" value="${searchValue}">
								<span class="input-group-btn">
									<button class="btn-u" type="button" onclick="searchFun()">검색</button>
								</span>
							</div>
							<br/><br/>
						</div>
						<!-- End Blog Newsletter -->
						<!-- 검색 끝 -->

						<div class="headline-v2"><h2>최근 글</h2></div>
						<!-- Latest Links -->
						<ul class="list-unstyled blog-latest-posts margin-bottom-50">
							<c:forEach var="recentAccompanyDto" items="${recentAccompanyList}">
								<li>
									<h3><a href="/user/accompany/accompanyRead.do?accompany_no=${recentAccompanyDto.accompany_no}&currentPage=${currentPage}" title="${recentAccompanyDto.title}">${recentAccompanyDto.title}</a></h3>
										<small>
										<!-- 최근글 5개 목록 중에서 글쓴 날짜를 가져온다. -->
										<fmt:formatDate var="recentWriteDate" value="${recentAccompanyDto.write_date}" pattern="yy-MM-dd"/>
													
										<!-- 현재 날짜랑 비교해서 날짜가 동일한 경우 시간을 뿌려줌 -->
										<c:if test="${recentWriteDate eq nowDate}"><!-- 현재 -->
											<fmt:formatDate pattern="HH:mm" value="${recentAccompanyDto.write_date}"/>
										</c:if>
										<!-- 현재 날짜 보다 과거에 있는 경우 년월일 형태로 뿌려줌 -->
										<c:if test="${recentWriteDate lt nowDate}"><!-- 과거 -->
											<fmt:formatDate pattern="yyyy-MM-dd" value="${recentAccompanyDto.write_date}"/>
										</c:if> / <a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${recentAccompanyDto.mem_no}">${recentAccompanyDto.mem_name}</a>
									</small>
									<!-- 글 내용 미리보기의 글자가 70자가 넘어갈 경우 뒷 부분을 ... 처리한다. -->
									<p>${fn:substring(recentAccompanyDto.content, 0, 70)}
										<c:if test="${fn:length(albumDto.content) >70}">
											…
										</c:if>
									</p>
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
								<!-- 탭 시작 -->
								<input type="hidden" id="accompany_status_code" value="${accompany_status_code}">
	
								<c:set var="active" value="${accompany_status_code}"></c:set>
								<div class="tab-v2">
									<ul class="nav nav-tabs">
										<li id="0000"><a href="#">전체</a></li>
										<c:forEach var="postType" items="${postTypeList}">
											<c:set var="activeClass" value=""></c:set>
											<c:if test="${postType.code==active}">
												<c:set var="activeClass" value="active"></c:set>
											</c:if>
										<li class="${activeClass}" id="${postType.code}"><a href="#">${postType.code_name}</a></li>
										</c:forEach>
									</ul>
								</div>
								<!-- 탭 끝 -->
	
								<!-- 검색결과가 있는 경우에만 검색 결과 수를 표시한다. -->
								<c:choose>
									<c:when test="${count > 0}">
										<br/><span class="results-number">${seachValue}${count}개의 결과</span><br/><br/>
									</c:when>
									<c:otherwise>
										<br/><span>검색결과가 존재하지 않습니다.</span><br/><br/>
									</c:otherwise>
								</c:choose>
						
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
												<td>
													<a href ="/user/accompany/accompanyRead.do?accompany_no=${accompanyDto.accompany_no}&currentPage=${currentPage}" style="color:inherit;" title="${accompanyDto.title}">
														${accompanyDto.title}
														</a>&nbsp;[${accompanyDto.reply_count}]
														<c:if test="${accompanyDto.attach_file!=null}">
															<i class="fa fa-picture-o" title="이미지 있음"></i>
														</c:if>
												</td>
													
												<td><a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${accompanyDto.mem_no}" style="text-decoration: none; color: inherit;">${accompanyDto.mem_name}</a></td>
												<td>
													<fmt:formatDate var="writeDate" value="${accompanyDto.write_date}" pattern="yy-MM-dd"/>
													<c:if test="${writeDate eq nowDate}"><!-- 현재 -->
														<fmt:formatDate pattern="HH:mm" value="${accompanyDto.write_date}"/>
													</c:if>
													<c:if test="${writeDate lt nowDate}"><!-- 과거 -->
														<fmt:formatDate pattern="yyyy-MM-dd" value="${accompanyDto.write_date}"/>
													</c:if>
												</td>
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
								</div>
								<!-- 게시판 리스트 끝 -->
							</div>
						</div>
					</div>
					<!-- 게시판 종료 -->
				</div>
			</div>
			<!--/end container-->
			<!-- End Content Part -->
		</div>
			<!--=== Footer Version 1 ===-->
			<div class="footer-v1">
				<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
			</div>
			<!--=== End Footer Version 1 ===-->
		</div>
	<!-- 쪽지함에서 충돌로 인하 주석처리! -->
	<script type="text/javascript" src="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<!-- 쪽지함에서 충돌로 인하 주석처리! -->
	<script type="text/javascript" src="/assets/js/plugins/owl-carousel.js"></script>
</body>
</html>