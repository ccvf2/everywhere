<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 Left</title>
</head>
<body>
	<img class="img-responsive profile-img margin-bottom-20" src="/assets/img/team/img32-md.jpg" alt="">
	<c:out value="${dto.mem_name}"/>(<c:out value="${dto.mem_email}"/>)
	
    <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
        <li class="list-group-item">
        </li>
        <li class="list-group-item">
            <a href="#"><i class="fa fa-group"></i> 친구</a>
        </li>
        <li class="list-group-item">
            <a href="#"><i class="fa fa-cubes"></i> 나의 여행</a>
        </li>
        <li class="list-group-item">
            <a href="/user/visitor/visitorWrite.do?mem_no=10"><i class="fa fa-comments"></i> 방명록</a>
        </li>
        <li class="list-group-item">
            <a href="#"><i class="fa fa-comments"></i> 쪽지함</a>
        </li>
        <li class="list-group-item">
            <a href="#"><i class="fa fa-history"></i> 내 활동</a>
        </li>
        <li class="list-group-item">
            <a href="#"><i class="fa fa-cog"></i> 즐겨찾기</a>
        </li>
        <li class="list-group-item">
            <a href="#"><i class="fa fa-cog"></i> 설정</a>
        </li>
        <c:if test=""></c:if>
    </ul>

    <!--Notification-->
    <div class="panel-heading-v2 overflow-h">
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
            <img class="rounded-x" src="assets/img/testimonials/img6.jpg" alt="">
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
            <img class="rounded-x" src="assets/img/testimonials/img1.jpg" alt="">
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
            <img class="rounded-x" src="assets/img/testimonials/img6.jpg" alt="">
            <div class="overflow-h">
                <span><strong>Taylor Lee</strong> changed profile picture.</span>
                <small>23/12 15:15 pm</small>
            </div>
        </li>
    </ul>
    <!-- <button type="button" class="btn-u btn-u-default btn-u-sm btn-block">Load More</button> -->
    <!--End Notification-->

    <div class="margin-bottom-50"></div>

    <!--Datepicker-->
    <form action="#" id="sky-form2" class="sky-form">
        <div id="inline-start"></div>
    </form>
    <!--End Datepicker-->
</body>
</html>