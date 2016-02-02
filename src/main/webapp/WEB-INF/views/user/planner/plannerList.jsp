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
	<script type="text/javascript">
		//페이징버튼을 눌렀을때.
		function movePage(pageNum){
			var form = document.getElementById("plannerListForm");
			form.currentPage.value=pageNum;
			form.action="/user/planner/plannerList.do";
			form.method="POST";
			form.submit(); 
		}
		//글갯수변경을눌렀을때
		function changeShowRow(showRow){
			var form = document.getElementById("plannerListForm");
			form.currentPage.value=1;
			form.showRow.value=showRow;
			form.action="/user/planner/plannerList.do";
			form.method="POST";
			form.submit(); 
		}
	
	
		//폼 서브밋
		function goSearchForm(){
			var form = document.getElementById("plannerListForm");
			form.currentPage.value=1;
			form.action="/user/planner/plannerList.do";
			form.method="POST";
			form.submit();
		}
		
		function menuControll1(str){
			$(document).ready(function() {
				$('#menu1_sub'+str).css("display","");
				$('#menu1_sub'+str).css("position","absolute");
			})
		}

		function menuClose(){
			$(document).ready(function() {
				$('div[id^=menu1_sub]').css("display","none");
				$('div[id^=menu2_sub]').css("display","none");
			})
		}
		
	</script>
	<c:import url="/WEB-INF/views/common/jquery.jsp"/>
	<c:import url="/WEB-INF/views/user/common/utilImport.jsp"/>
</head>
<body onclick="menuClose()">

	<div class="wrapper">
		<!--=== Header ===-->
		<div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		</div>
		<!--=== End Header ===-->

		<div class="container">
			<div class="row">
				<!-- 사이드 메뉴  시작-->
				<div class="col-md-3" id="leftCol">
					<!-- Blog Newsletter -->
					<div class="blog-newsletter" id="sidebar">
						<form class="sky-form" id="plannerListForm">
							<!-- 페이징처리 정보 -->
							<input type="hidden" name="totalCount" id="totalCount" value="${plannerDto.totalCount}">
							<input type="hidden" name="startRow" id="startRow" value="${plannerDto.startRow}">
							<input type="hidden" name="endRow" id="endRow" value="${plannerDto.endRow}">
							<input type="hidden" name="currentPage" id="currentPage" value="${plannerDto.currentPage}">
							<input type="hidden" name="pageBlock" id="pageBlock" value="${plannerDto.pageBlock}">
							<input type="hidden" name="pageCount" id="pageCount" value="${plannerDto.pageCount}">
							<input type="hidden" name="startPage" id="startPage" value="${plannerDto.startPage}">
							<input type="hidden" name="endPage" id="endPage" value="${plannerDto.endPage}">
							<input type="hidden" name="pageBlockGroupCount" id="pageBlockGroupCount" value="${plannerDto.startRow}">
							<input type="hidden" name="showRow" id="showRow" value="${showRow}">
							<header>리뷰 검색</header>
							
							<fieldset style="padding: 15px 15px 5px;">
								<!-- 겁색어 입력부분 -->
								<section>
									<label class="input">
										<!-- 자동완성 input : works in Chrome, Firefox, Opera and IE10. -->
										<input type="text" list="list" name="searchWord1" id="searchPlace" placeholder="검색어를 입력해 주세요" value="${plannerDto.searchWord1}">
										<datalist id="list">
											<c:forEach var="place" items="${placeList}">
												<option value="${place.code_name}"></option>
											</c:forEach>
										</datalist>
									</label>
								</section>
							</fieldset>
							<!-- 글종류 : 전체|리뷰|일정 -->
							<fieldset style="padding: 15px 15px 5px;">
								<section>
									<label class="label">글종류</label>
									<div class="">
										<label class="radio"><input type="radio" name="searchCondition1" value="" checked="checked" onchange="goSearchForm()"><i class="rounded-x"></i>전체</label>
										<c:forEach var="typeCode" items="${selectCode}">
											<c:choose>
												<c:when test="${plannerDto.searchCondition1==typeCode.code}">
													<label class="radio"><input type="radio" name="searchCondition1" value="${typeCode.code}" checked="checked" onchange="goSearchForm()"><i class="rounded-x"></i>${typeCode.code_name}</label>
												</c:when>
												<c:otherwise>
													<label class="radio"><input type="radio" name="searchCondition1" value="${typeCode.code}" onchange="goSearchForm()"><i class="rounded-x"></i>${typeCode.code_name}</label>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
									</div>
								</section>
							</fieldset>
							<!-- 정렬순서 -->
							<fieldset style="padding: 15px 15px 5px;">
								<section>
									<label class="label">정렬</label>
											<label class="select">
												<select name="searchCondition2" onchange="goSearchForm()">
													<option value="">선택하세요.</option>
													<c:forEach var="sortCode" items="${sortCode}">
														<c:choose>
															<c:when test="${plannerDto.searchCondition2==sortCode.code}">
																<option value="${sortCode.code}" selected="selected">${sortCode.code_name}</option>
															</c:when>
															<c:otherwise>
																<option value="${sortCode.code}">${sortCode.code_name}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
												<i></i>
											</label>
								</section>
							</fieldset>
							<!-- 글갯수 선택 -->
							<fieldset style="padding: 15px 15px 5px;">
								<section>
									<label class="label">글갯수 선택</label>
									<label class="select">
										<select onchange="changeShowRow(this.value)">
											<c:forEach var="showRowCode" items="${showRowCode}">
												<c:choose>
													<c:when test="${showRow==showRowCode.code_name}">
														<option value="${showRowCode.code_name}" selected="selected">${showRowCode.code_name}개 씩</option>
													</c:when>
													<c:otherwise>
														<option value="${showRowCode.code_name}">${showRowCode.code_name}개 씩</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</label>
								</section>
							</fieldset>
							<!-- 명소 검색 버튼 시작 -->
							<footer>
							<div class="text-center">
								<button class="btn-u" onclick="goSearchForm()">검색</button>
							</div>
							</footer>
						</form>
						<!-- End Blog Newsletter -->
					</div>
				</div>
				<!-- 사이드 메뉴  끝 -->
				<!-- 리뷰 뷰 시작 -->
				<div class="col-md-9">
					<div class="blog_masonry_3col">
						<div class="alert alert-info alert-dismissable">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							<i class="fa fa-info-circle"></i> 검색된 갯수 : <strong><c:out value="${plannerDto.totalCount}"/></strong>&nbsp;개 
							<span style="float: right;"><i class="fa fa fa-sort-amount-desc"></i>총페이징 : ${plannerDto.pageCount} / <i class="fa fa-sign-in"></i>현재 페이지 : <strong>${plannerDto.currentPage}</strong></span>
						</div>
						<div class="container-fluid content grid-boxes masonry" style="position: relative; height: 2250px; overflow: hidden;">
							<c:forEach var="planner" items="${plannerList}">
								<div class="grid-boxes-in masonry-brick" style="position: absolute; width: 300px; top: 40px; left: 15px;">
									<a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}">
										<c:choose>
											<c:when test="${planner.planner_ba_code eq 'E0001'}">
												<i class="fa fa-calendar-o" title="일정" style="position: absolute; margin: 7px; font-size: 1.5em; text-shadow: #ffffff 2px 2px 2px;"></i>
											</c:when>
											<c:when test="${planner.planner_ba_code eq 'E0002'}">
												<i class="fa fa-check-circle" title="리뷰" style="position: absolute; margin: 7px; font-size: 1.5em; text-shadow: #ffffff 2px 2px 2px;"></i>
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
										<img class="img-responsive" src="/attatchFile/planner/${planner.attach_file}" onError="this.src='/attatchFile/spot/no_image.jpg'" alt="${planner.title}" style="min-height: 170px;">
									</a>
									<div class="grid-boxes-caption">
										<h3><a href="/user/planner/readPlanner.do?planner_no=${planner.planner_no}"> ${planner.title}</a></h3>
										<span style="font-weight: bolder;">
											<%-- <a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${planner.mem_no}">${planner.mem_name}</a> --%>
											<a href="javascript:menuControll1('${planner.planner_no}')">${planner.mem_name}</a>
												<!-- 서브메뉴 -->
												<div class="col-md-3" id="menu1_sub${planner.planner_no}" style="display: none;">
													<ul class="dropdown-menu dropdown-show" role="menu">
														<li><a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=${planner.mem_no}"><i class="fa fa-home"></i>${planner.mem_name}님 페이지 보기</a></li>
														<li class="divider"></li>
														<li><a href="/user/message/messageTalkList.do?recv_mem_no=${planner.mem_no}"><i class="fa  fa-comments-o"></i>${planner.mem_name}님께 쪽지보내기</a></li>
													</ul>
												</div>
										
										</span>
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
												${planner.memo}
												<br />
											</li>
											<li style="border-top: 1px solid;"><div style="margin: 1px auto;"><i class="fa fa-clock-o" title="여행기간"></i>&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${planner.start_date}"/>&nbsp;~&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${planner.end_date}"/></div></li>
										</ul>
									</div>
								</div>
							</c:forEach>
						</div><!--/container-->

						<!-- 페이징처리 부분 Start -->
						<div class="text-center">
								<nav>
									<ul class="pagination">
									<c:if test="${plannerDto.startPage > plannerDto.pageBlock}">
										<li>
											<a href="javascript:movePage('1')" aria-label="Previous">
												<span aria-hidden="true">&laquo;&laquo;</span>
											</a>
										</li>
										<li>
											<a href="javascript:movePage(${plannerDto.currentPage-1})" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
									</c:if>

									<c:forEach var="pageNum" begin="${plannerDto.startPage}" end="${plannerDto.endPage}">
									<c:choose>
										<c:when test="${plannerDto.currentPage==pageNum}">
										<li class="active"><a href="javascript:movePage('${pageNum}')">${pageNum}</a></li>
										</c:when>
										<c:otherwise>
										<li><a href="javascript:movePage('${pageNum}')">${pageNum}</a></li>
										</c:otherwise>
									</c:choose>
									</c:forEach>

									<c:if test="${plannerDto.endPage < plannerDto.pageCount}">
										<li>
											<a href="javascript:movePage(${plannerDto.currentPage+1})" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
											</li>
										<li>
											<a href="javascript:movePage(${plannerDto.pageCount})" aria-label="Next">
												<span aria-hidden="true">&raquo;&raquo;</span>
											</a>
										</li>
									</c:if>
									</ul>
								</nav>
						</div>
						<!-- 페이징처리 부분 End -->
					</div>
				</div>
				<!-- 리뷰 뷰 끝 -->
			</div>
			<!-- row END -->
		</div>
		<!-- End Container -->

		<div class="footer-v1">
			<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		</div>
	</div>
	<!-- End wrapper -->
	
	<!-- JS Page Level -->
	<script src="/assets/js/app.js"></script>
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