<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 Left</title>
<script type="text/javascript" src="/assets/plugins/line-icons/icons-lte-ie7.js"></script>
<c:import url="/WEB-INF/views/common/jquery.jsp"/>

</head>
<body>
	<script type="text/javascript">
		$(function() {
			var profileNum=0;
			$("#profileP").click(function(){
				$("#profileP").text("취소");
				$("#updatePhoto").show();
			});
			
			$("#mem_profile").change(function() {
				readImg('mem_profile', 'imgout');
			});
		});
		
		function readImg(inputId, outputId) {
			var file = document.getElementById(inputId).files[0];
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function() {
				var output = document.getElementById(outputId);
				output.src = reader.result;
			}
			reader.onerror = function(e) {
				alert("읽기 오류:" + e.target.error.code);
				return;
			}
		}
	</script>
	<c:choose>
		<c:when test="${memberDto==null}">
			<c:set var="memberDto" value="${mem_object}"/>		
		</c:when>
		<c:otherwise>
			<c:set var="memberDto" value="${memberDto}"/>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${memberDto.mem_profile_photo==null}">
			<c:set var="profile" value="/assets/img/team/img32-md.jpg"/>		
		</c:when>
		<c:otherwise>
			<c:set var="profile" value="/attatchFile/member/${commonFileIODto.save_name}.${commonFileIODto.extension}"/>
		</c:otherwise>
	</c:choose>
	 
	<a id="profileP">프로필사진변경</a>
	<img id="imgout" class="img-responsive profile-img margin-bottom-20" src="${profile}" alt="">
	<div id="updatePhoto" style="display: none;">
		<form action="/user/myPage/updateProfilePhoto.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="mem_no" value="${mem_object.mem_no}">			
			<input type="hidden" name="mem_level_code" value="${mem_object.mem_level_code}">
	        <input type="file" id="mem_profile" name="mem_profile" style="width: 200px; float: left;"/>
	        <button type="submit" class="btn btn-xs btn-default" style="width: 50px;">변경</button>
		</form>
	</div>
	
	<c:out value="${memberDto.mem_name}"/><c:out value="(${memberDto.mem_email})"/>
	<c:if test="${mateCheck==0}">
		<a href="/user/myPage/mateInsert.do?mem_no=${memberDto.mem_no}">친구추가</a>
	</c:if>
	<c:if test="${mateCheck==1}">
		<a href="/user/myPage/mateDelete.do?mem_no=${memberDto.mem_no}">친구삭제</a>
	</c:if>

    <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
        <li class="list-group-item">
            <a href="/user/myPage/friends.do?mem_no=${memberDto.mem_no}"><i class="fa fa-group"></i> 친구</a>
        </li>
        <li class="list-group-item">
            <a href="#"><i class="fa fa-cubes"></i> 나의 여행</a>
        </li>
        <li class="list-group-item">
            <a href="/user/visitor/visitorWrite.do?mem_no=${memberDto.mem_no}"><i class="fa fa-pencil-square-o"></i> 방명록</a>
        </li>
        <li class="list-group-item">
            <a href="#"><i class="fa fa-history"></i> 내 활동</a>
        </li>
        <li class="list-group-item">
            <a href="#"><i class="fa fa-star-o"></i> 즐겨찾기</a>
        </li>
        <c:if test="${mateCheck==2}">
	        <li class="list-group-item">
	            <a href="#"><i class="fa fa-comments"></i> 쪽지함</a>
	        </li>
	        <li class="list-group-item">
	            <a href="#"><i class="fa fa-cog"></i> 정보수정</a>
	        </li>
        </c:if>
    </ul>

    <!--Notification-->
   <!--  <div class="panel-heading-v2 overflow-h">
        <h2 class="heading-xs pull-left"><i class="fa fa-bell-o"></i> 알림</h2>
        <a href="#"><i class="fa fa-cog pull-right"></i></a>
    </div>
    <ul class="list-unstyled mCustomScrollbar margin-bottom-20" data-mcs-theme="minimal-dark">
        <li class="notification">
            <i class="icon-custom icon-sm rounded-x icon-bg-red icon-line icon-envelope"></i>
            <div class="overflow-h">
                <span><strong>Albert Heller</strong> has sent you email.</span>
                <small>Two minutes ago</small>
            </div>
        </li>
        <li class="notification">
            <img class="rounded-x" src="/assets/img/testimonials/img6.jpg" alt="">
            <div class="overflow-h">
                <span><strong>Taylor Lee</strong> started following you.</span>
                <small>Today 18:25 pm</small>
            </div>
        </li>
        <li class="notification">
            <i class="icon-custom icon-sm rounded-x icon-bg-yellow icon-line fa fa-bolt"></i>
            <div class="overflow-h">
                <span><strong>Natasha Kolnikova</strong> accepted your invitation.</span>
                <small>Yesterday 1:07 pm</small>
            </div>
        </li>
        <li class="notification">
            <img class="rounded-x" src="/assets/img/testimonials/img1.jpg" alt="">
            <div class="overflow-h">
                <span><strong>Mikel Andrews</strong> commented on your Timeline.</span>
                <small>23/12 11:01 am</small>
            </div>
        </li>
        <li class="notification">
            <i class="icon-custom icon-sm rounded-x icon-bg-blue icon-line fa fa-comments"></i>
            <div class="overflow-h">
                <span><strong>Bruno Js.</strong> added you to group chating.</span>
                <small>Yesterday 1:07 pm</small>
            </div>
        </li>
        <li class="notification">
            <img class="rounded-x" src="/assets/img/testimonials/img6.jpg" alt="">
            <div class="overflow-h">
                <span><strong>Taylor Lee</strong> changed profile picture.</span>
                <small>23/12 15:15 pm</small>
            </div>
        </li>
    </ul> -->
    <!-- <button type="button" class="btn-u btn-u-default btn-u-sm btn-block">Load More</button> -->
    <!--End Notification-->

    <div class="margin-bottom-50"></div>

    <!--Datepicker-->
   <!--  <form action="#" id="sky-form2" class="sky-form">
        <div id="inline-start"></div>
    </form> -->
    <!--End Datepicker-->
</body>
</html>