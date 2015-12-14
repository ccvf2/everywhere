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
    <title>여행동행구하기 >${accompanyDto.title} </title>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Bootstrap -->
    <link href="/script/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<script type="text/javascript" src="/script/common/commonReply.js"></script>
	<!-- 제이쿼리 라이브러리.(필수) : commonReplyInit() 함수호출 전 선언  -->
	<script src="/assets/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript">
		function deleteFunc(accompany_no){
			var deleteyn=confirm("정말로 삭제하시겠습니까?");
			if(deleteyn==true){
				location.href="/user/accompany/accompanyDelete.do?accompany_no="+accompany_no;
			}
		}
		$(document).ready(function() {
			
		//type_code:댓글이 있는 게시판고유코드,
		//mem_no: 회원고유번호
		//index:화면뷰를 삭제할 ID,
		//item_no:댓글이 있는 게시판 글번호
		//defaultPhotoPath:기본으로 뿌릴 이미지 선택,
		/* 	commonReplyInit(type_code,mem_no,item_no,defaultPhotoPath); */
			var accompany_no=${accompanyDto.accompany_no};
			commonReplyInit('S0010',64,accompany_no,"");
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
            <h1>동행구하기 게시판</h1>
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
                            <input type="text" class="form-control" placeholder="Email">
                            <span class="input-group-btn">
                                <button class="btn-u" type="button">검색</button>
                            </span>
                        </div>
                        <br/><br/>
                    </div>
                    <!-- End Blog Newsletter -->
                    
                  
                    <div class="headline-v2"><h2>최근 글</h2></div>
                    <!-- Latest Links -->
                    <ul class="list-unstyled blog-latest-posts margin-bottom-50">
                        <li>
                            <h3><a href="#">Wireframe for the news view...</a></h3>
                            <small>5 Jan, 2015 / <a href="#">Web,</a> <a href="#">Webdesign</a></small>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam odio leo.</p>
                        </li>
                        <li>
                            <h3><a href="#">It is a long established fact that a reader</a></h3>
                            <small>17 Jan, 2015 / <a href="#">Artificial Intelligence</a></small>                            
                            <p>Pellentesque efficitur blandit dui, porta cursus velit imperdiet sit amet.</p>
                        </li>
                        <li>
                            <h3><a href="#">The point of using Lorem Ipsum</a></h3>
                            <small>19 Jan, 2015 / <a href="#">Hi-Tech,</a> <a href="#">Technology</a></small>                            
                            <p>Phasellus ullamcorper pellentesque ex. Cras venenatis elit orci, vitae dictum elit egestas a. Nunc nec auctor mauris, semper scelerisque nibh.</p>
                        </li>
                        <li>
                            <h3><a href="#">Many desktop publishing packages...</a></h3>
                            <small>23 Jan, 2015 / <a href="#">Art,</a> <a href="#">Lifestyles</a></small>                            
                            <p>Integer vehicula sed justo ac dapibus. In sodales nunc non varius accumsan.</p>
                        </li>
                    </ul>
                    <!-- End Latest Links -->
                </div>
                <!-- End Blog Sidebar -->

                <!-- Blog All Posts -->
                <div class="col-md-9">
                    <!-- News v3 -->
                    <div class="news-v3 bg-color-white margin-bottom-30">
                        <div class="news-v3-in">
                            <ul class="list-inline posted-info">
                                <li>By <a href="#">${accompanyDto.mem_name}</a></li>
                                <li>In <a href="/user/accompany/accompanyList.do?pageNumber=${currentPage}">동행구하기 게시판</a></li>
                                <li>Hits ${accompanyDto.hits}</li>
                                <li>Posted <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${accompanyDto.write_date}"/></li>
                            </ul>
                            <h2><a href="/user/accompany/accompanyRead.do?accompany_no=${accompanyDto.accompany_no}&currentPage=${currentPage}">
                            	${accompanyDto.title}</a></h2>
                            
                           	<i class="fa fa-flag"></i>&nbsp;게시글 종류&nbsp;
							<c:forEach var="postType" items="${postTypeList}">
								<c:if test="${accompanyDto.accompany_status_code==postType.code}">
									${postType.code_name}
								</c:if>
							</c:forEach>
							<br/>
							
                        	 <i class="fa fa-calendar"></i>&nbsp;여행기간&nbsp;
						  	<fmt:formatDate pattern="yyyy-MM-dd" value="${accompanyDto.start_date}"/>&nbsp;~
						  	<fmt:formatDate pattern="yyyy-MM-dd" value="${accompanyDto.end_date}"/>
						  	&nbsp;&nbsp;&nbsp;
						  	<i class="fa fa-user-plus"></i>&nbsp;구하는 성별&nbsp;
						  	<c:forEach var="gender_code" items="${genderList}">
								<c:if test="${accompanyDto.gender_code==gender_code.code}">
						  			${gender_code.code_name}
						  		</c:if>
							</c:forEach>
						  	<br/><hr/>
                            
                            ${accompanyDto.content}
                            
                            <ul class="post-shares post-shares-lg">
                                <!-- 글쓴이만 삭제 및 수정이 보이도록 -->
							  	<c:if test="${ownerCheck>0}">
							  		<li>
	                                    <a href="/user/accompany/accompanyUpdate.do?accompany_no=${accompanyDto.accompany_no}&pageNumber=${currentPage}">
	                                        <i class="rounded-x fa fa-pencil" title="수정"></i>
	                                    </a>
	                                </li>
	                                <li>
	                                	<a href="#" onclick="deleteFunc('${accompanyDto.accompany_no}'); return false;"><i class="rounded-x fa fa-trash-o" title="삭제"></i></a>
	                                </li>
							  	</c:if>
                            </ul>
                        </div>
                    </div>                        
                    <!-- End News v3 -->

                    <!-- Blog Post Author
                    <div class="blog-author margin-bottom-30">
                        <img src="assets/img/team/img1-md.jpg" alt="">
                        <div class="blog-author-desc">
                            <div class="overflow-h">
                                <h4>Alexander Jenni</h4>
                            </div>
                            <p>In auctor fringilla turpis eu rhoncus. Vivamus quis nisi vel dui ultrices lacinia ac eu massa. Quis que vitae consequat sapien. Vivamus sit amet tincidunt ipsum, nec blandit ipsum. Lorem ipsu m dolor sit amet, consectetur adipiscing elit...</p>
                        </div>
                    </div>
                    <!-- End Blog Post Author -->

                    <hr>
                   <!-- 댓글을 뿌릴 영역 START-->
					<div id="replyArea">
						<div id="replywrap">
							<div id="replyListArea">
							</div>
							<div id="replyWriteArea">
							</div>
						</div>
					</div>
					<!-- 댓글을 뿌릴 영역 END-->
					<hr/>
					<!-- News v2 -->
                    <div class="row news-v2 margin-bottom-50">
                        <div class="col-sm-6 sm-margin-bottom-30">
                            <div class="news-v2-badge">
                                <p>
                                    <span>23</span>
                                    <small>Jan</small>
                                </p>
                            </div>
                            <div class="news-v2-desc">
                                <h3><a href="#">Reading Some Books</a></h3>
                                <small>By Admin | California, US | In <a href="#">Art</a></small>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae, gravida pellentesque urna varius vitae.</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="news-v2-badge">
                                <p>
                                    <span>22</span>
                                    <small>Jan</small>
                                </p>
                            </div>
                            <div class="news-v2-desc">
                                <h3><a href="#">Interior Design</a></h3>
                                <small>By Admin | California, US | In <a href="#">Art</a></small>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae, gravida pellentesque urna varius vitae.</p>
                            </div>
                        </div>
                    </div>
                    <!-- End News v2 -->
					
	                </div>
	                <!-- End Blog All Posts -->
	            </div>
	        </div><!--/end container-->
	        <!-- End Content Part -->
				
                  
			    <!--=== Footer Version 1 ===-->
			    <div class="footer-v1">
					발바닥
					<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
			    </div>
			    <!--=== End Footer Version 1 ===-->
		    </div>
				    
    </div>
  </body>
</html>