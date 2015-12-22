<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>여행 동행구하기</title>
	
	<!-- Bootstrap -->
	<link href="/script/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	   
	
	<!-- CSS Global Compulsory -->
	<link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/css/style.css">
	
	<!-- CSS Header and Footer -->
	<link rel="stylesheet" href="/assets/css/headers/header-default.css">
	<link rel="stylesheet" href="/assets/css/footers/footer-v1.css">
	
	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="/assets/plugins/animate.css">
	<link rel="stylesheet" href="/assets/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
	<link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
	<!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->
	
	<!-- CSS Customization -->
	<link rel="stylesheet" href="/assets/css/custom.css">   
	   
	<style type="text/css">
		.sky-form {
		  box-shadow: none;
		  border: 0px solid #eee;
		}
		
	</style>
	<script type="text/javascript">
		//유효성 검사 함수
		function writeCheck() {
			//성별 체크 확인
			if ($("input[name='gender_code']:checked").length > 0){
				  // one ore more checkboxes are checked
			}
			else{
				// no checkboxes are checked
				alert("구할 동행의 성별을 체크해주세요");
				return false;
			}
			
			var title = document.forms["accompanyForm"]["title"].value;
		    if (title == null || x == "") {
		        alert("제목을 입력하세요");
		        document.forms["accompanyForm"]["title"].focus();
		        return false;
		    }
		    
		    var content = document.forms["accompanyForm"]["content"].value;
		    if (content == null || x == "") {
		        alert("제목을 입력하세요");
		        document.forms["accompanyForm"]["title"].focus();
		        return false;
		    }
		}
		
		// 검색하는 함수
		function searchFun() {
			var search=document.getElementById("search").value;
			location.href="/user/accompany/accompanyList.do?search="+search;
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

                <!-- Blog All Posts -->
                <div class="col-md-9">
                	<div class="news-v3 bg-color-white margin-bottom-30">
                        <div class="news-v3-in">
                        
                        <!-- 폼 태그 시작 -->
                        	<form name="accompanyForm" class="sky-form" action="/user/accompany/accompanyUpdateOk.do" method="post" onsubmit="return writeCheck()" enctype="multipart/form-data">
                        		<input type="hidden" name="accompany_no" value="${accompanyDto.accompany_no}"/>
			                    <header>동행구하기 글 수정하기</header>
			                    <fieldset>
			                    <!-- 글 종류와 구하는 성별 시작 -->
			                    <div class="row">
	                               	<section class="col col-6">
	                               		<!-- 동행구함 여부 -->
	                               		<label class="label">글 종류</label>
	                               		<label class="select">
		                                    <select name="accompany_status_code">
												<c:forEach var="postType" items="${postTypeList}">
													<c:if test="${postType.code==accompanyDto.accompany_status_code}">
													<option value="${postType.code}" selected="selected">${postType.code_name}</option>
												</c:if>
												<c:if test="${postType.code!=accompanyDto.accompany_status_code}">
													<option value="${postType.code}">${postType.code_name}</option>
												</c:if>
												</c:forEach>
											</select>
		                                    <i></i>
		                                </label>
		                            </section>
	                                <label class="label">구하는 성별</label>
	                              	<c:forEach var="gender_code" items="${genderList}">
										<!-- 성별코드 일치시 -->
										<div class="col col-2">
	                                           <label class="radio state-success"><input type="radio" name="gender_code" value="${gender_code.code}"><i class="rounded-x"></i>${gender_code.code_name}</label>
	                                     </div>
									</c:forEach>
									<script type="text/javascript">
										for(var i=0;i<accompanyForm.gender_code.length;i++){
											if(accompanyForm.gender_code[i].value=="${accompanyDto.gender_code}") {
												accompanyForm.gender_code[i].checked=true;
											}
										}
									</script>
	                            </div>
	                            <!-- 글 종류와 구하는 성별 끝 -->
	                            <!-- 제목 시작 -->
	                           <section>
		                            <label class="label">제목</label>
		                            <label class="input">
		                                <i class="icon-append fa fa-tag"></i>
		                                <input type="text" name="title" id="subject" value="${accompanyDto.title}">
		                            </label>
		                        </section>
		                        <!-- 제목 종료 -->     
		                        
			                    <!-- DatePicker 시작 -->
			                    <fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${accompanyDto.start_date}"/>
  								<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${accompanyDto.end_date}"/>
                                <div class="row">
                                    <section class="col col-6">
                                        <label class="input">
                                            <i class="icon-append fa fa-calendar"></i>
                                            <input type="text" name="start_date" id="start" placeholder="시작일" value="${start_date}">
                                        </label>
                                    </section>
                                    <section class="col col-6">
                                        <label class="input">
                                            <i class="icon-append fa fa-calendar"></i>
                                            <input type="text" name="end_date" id="finish" placeholder="종료일" value="${end_date}">
                                        </label>
                                    </section>
		                        </div>
		                        <!-- DatePicker 끝 -->
		                        <!-- 글 내용 시작 -->
		                        <section>
		                            <label class="textarea">
		                                <i class="icon-append fa fa-comment"></i>
		                                <textarea rows="5" name="content" placeholder="내용을 써주세요">${accompanyDto.content}</textarea>
		                            </label>
		                        </section>    
		                        <!-- 글 내용 끝 -->
		                        <!-- 파일 시작 -->
	                        	<section>
		                            <label for="file" class="input input-file">
		                                <div class="button"><input type="file" name="accompany_file" multiple="" onchange="this.parentNode.nextSibling.value = this.value">Browse</div><input type="text" placeholder="${accompanyDto.attach_file}" readonly="">
		                            </label>
		                        </section>
		                        <!-- 파일 끝 -->
		                        <footer>
			                        <button type="submit" class="btn-u">글 수정</button>
			                        <input class="btn-u btn-u-default" type="button" value="취소" onclick="location.href='/user/accompany/accompanyList.do'" />
			                        <div class="progress"></div>
			                    </footer>  
			                    <div class="message">
		                        <i class="rounded-x fa fa-check"></i>
		                        <p>Thanks for your order!<br>We'll contact you very soon.</p>
		                    </div>
		                    </fieldset>
		                    </form>
		                    
		                </div>
	                </div>
	                </div>
	                <!-- End Blog All Posts -->
	            </div>
	        </div><!--/end container-->
	        <!-- End Content Part -->
				
                 
		    <!--=== Footer Version 1 ===-->
		    <div class="footer-v1">
				<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		    </div>
		    <!--=== End Footer Version 1 ===-->
	    </div>
	</div>
	
	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/assets/plugins/smoothScroll.js"></script>
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script src="/assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/assets/js/app.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/masking.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/datepicker.js"></script>
	<script type="text/javascript" src="/assets/js/plugins/validation.js"></script>
	<script type="text/javascript">
	    jQuery(document).ready(function() {
	        App.init();
	        Masking.initMasking();
	        Datepicker.initDatepicker();
	        Validation.initValidation();
	    });
	</script>
  </body>
</html>