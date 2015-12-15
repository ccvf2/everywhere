<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/script/common/jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/script/common/jquery-ui/jquery-ui.css" />

<script type="text/javascript" src="/script/common/datepicker.js"></script>
<script type="text/javascript">
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
                    </ul>
                    <!-- End Latest Links -->
                 
                </div>
                <!-- End Blog Sidebar -->

                <!-- Blog All Posts -->
                <div class="col-md-9">
                	<div class="news-v3 bg-color-white margin-bottom-30">
                        <div class="news-v3-in">
							<form name="accompanyForm" action="/user/accompany/accompanyWriteOk.do" method="post" onsubmit="return writeCheck()" enctype="multipart/form-data">
								<input type="hidden" name="accompany_no" value="" />
								<input type="hidden" name="mem_no" value="" />
								
								<label>종류</label>
								<!-- 동행구함 여부 -->
								<select name="accompany_status_code">
									<c:forEach var="postType" items="${postTypeList}">
										<option value="${postType.code}">${postType.code_name}</option>
									</c:forEach>
								</select>
								
								<br/>
								<label>제목</label>
								<input type="text" name="title"><br/>
								<br/>
								<label>시작일</label>
								<input type="text" name="start_date" id="start_date" />
								
								<label>종료일</label>
								<input type="text" name="end_date" id="end_date" /><br/>
								
								<c:forEach var="gender_code" items="${genderList}">
									<input type="radio"	name="gender_code" value="${gender_code.code}">${gender_code.code_name}
								</c:forEach>
								<br/><br />
								
								<label>내용</label>
								<textarea rows="14" cols="67" name="content"></textarea>
								<br/>
								<br/>
								<label class="title">파일명</label>
								<input type="file" name="file"/>
									
								<br/>
								<br/>
								<input type="submit" value="글쓰기" />
								<input type="button" value="취소" onclick="location.href='/user/accompany/accompanyList.do'" />
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













	
	
</body>
</html>