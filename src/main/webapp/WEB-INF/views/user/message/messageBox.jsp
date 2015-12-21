<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
<c:import url="/WEB-INF/views/common/jquery.jsp" />
<c:import url="/WEB-INF/views/user/common/utilImport.jsp" />
</head>
<%-- <body>
메시지박스<br/>
<table border="1">
	<tr>
		<th>메세지고유번호</th>
		<th>보낸사람고유번호</th>
		<th>보낸사람이름</th>
		<th>받사람고유번호</th>
		<th>받은사람이름</th>
		<th>메세지그룹번호</th>
		<th>메세지내용</th>
		<th>보낸시간</th>
		<th>받은시간</th>
		<th>안읽은메세지</th>
		<!-- <th>보낸사람 삭제여부</th>
		<th>받은사람 삭제여부</th> -->
	</tr>
<c:forEach var="list" items="${messageBoxList}">
<c:choose>
	<c:when test="${mem_object.mem_no==list.send_mem_no}">
			<c:set value="${list.recv_mem_no}" var="recv_no"/>
	</c:when>
	<c:otherwise>
			<c:set value="${list.send_mem_no}" var="recv_no"/>
	</c:otherwise>
</c:choose>
	<tr>
		<td>
			<a href="/user/message/messageTalkList.do?recv_mem_no=${recv_no}&msg_group_no=${list.msg_group_no}">
			${list.msg_no}
			</a>
		</td>
		<td>${list.send_mem_no}</td>
		<td>${list.send_mem_name}</td>
		<td>${list.recv_mem_no}</td>
		<td>${list.recv_mem_name}</td>
		<td>${list.msg_group_no}</td>
		<td>${list.message}</td>
		<td>${list.send_time}</td>
		<td>${list.recv_time}</td>
		<td>${list.unreadCount}</td>
		<td>${list.send_remove_time}</td>
		<td>${list.recv_remove_time}</td>
	</tr>
</c:forEach>
</table>
</body> --%>
<body>
<div class="wrapper">
    <!--=== Header ===-->
    <div class="header">
			<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	</div>
    <!--=== End Header ===-->

    <!--=== Profile ===-->
    <div class="container content blog-page blog-item">
    <!-- <div class="container content profile"> -->
    	<div class="row">
            <!--Left Sidebar-->
            <div class="col-md-3 md-margin-bottom-40">
                <c:import url="/WEB-INF/views/user/mypage/myPageLeft.jsp"/>
            </div>
            <!--End Left Sidebar-->

			<!-- 메인------------------------------------------------------------------------------------------------------------------------------ -->
            <!-- Profile Content -->
            <%-- <div style="overflow:auto; overflow-x:hidden; max-height:700px; border:1px solid #e5e5e5;">
				<table border="1">
					<tr>
						<th>메세지고유번호</th>
						<th>보낸사람고유번호</th>
						<th>보낸사람이름</th>
						<th>받사람고유번호</th>
						<th>받은사람이름</th>
						<th>메세지그룹번호</th>
						<th>메세지내용</th>
						<th>보낸시간</th>
						<th>받은시간</th>
						<th>안읽은메세지</th>
						<!-- <th>보낸사람 삭제여부</th>
						<th>받은사람 삭제여부</th> -->
					</tr>
				<c:forEach var="list" items="${messageBoxList}">
				<c:choose>
					<c:when test="${mem_object.mem_no==list.send_mem_no}">
							<c:set value="${list.recv_mem_no}" var="recv_no"/>
					</c:when>
					<c:otherwise>
							<c:set value="${list.send_mem_no}" var="recv_no"/>
					</c:otherwise>
				</c:choose>
					<tr>
						<td>
							<a href="/user/message/messageTalkList.do?recv_mem_no=${recv_no}&msg_group_no=${list.msg_group_no}">
							${list.msg_no}
							</a>
						</td>
						<td>${list.send_mem_no}</td>
						<td>${list.send_mem_name}</td>
						<td>${list.recv_mem_no}</td>
						<td>${list.recv_mem_name}</td>
						<td>${list.msg_group_no}</td>
						<td>${list.message}</td>
						<td>${list.send_time}</td>
						<td>${list.recv_time}</td>
						<td>${list.unreadCount}</td>
						<td>${list.send_remove_time}</td>
						<td>${list.recv_remove_time}</td>
					</tr>
				</c:forEach>
				</table>
            </div> --%>
        
        
        <div style="overflow:auto; overflow-x:hidden; max-height:700px; border:1px solid #e5e5e5;">
                <!-- Accordion v1 -->
				<c:forEach var="list" items="${messageBoxList}">
				<c:choose>
					<c:when test="${mem_object.mem_no==list.send_mem_no}">
							<c:set value="${list.recv_mem_no}" var="recv_no"/>
							<c:set value="${list.recv_mem_name}" var="nameTo"/>
					</c:when>
					<c:otherwise>
							<c:set value="${list.send_mem_no}" var="recv_no"/>
							<c:set value="${list.send_mem_name}" var="nameTo"/>
					</c:otherwise>
				</c:choose>
                <div class="panel-group acc-v1" id="accordion-1">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-1" href="#collapse-Four">
                                    ${nameTo}님과의 대화
                                    <c:if test="${list.unreadCount!=0 }">
                                    	<span class="dropcap-bg rounded-x" style="min-width:25px; line-height:10px; font-size:13px; border: double 1px #23c3f2; margin: 0px;">${list.unreadCount}</span>
                                    </c:if>
                                    
                                    <c:choose>
                                    	<c:when test="${list.send_time==null || list.send_time==''}">
		                                    <span style="float: right;">${list.recv_time}</span>
                                    	</c:when>
                                    	<c:when test="${list.recv_time==null || list.recv_time==''}">
		                                    <span style="float: right;">${list.send_time}</span>
                                    	</c:when>
                                    	<c:otherwise>
		                                    <span style="float: right;">${list.send_time}</span>
                                    	</c:otherwise>
                                    </c:choose>
                                </a>
                            </h4>
                        </div>
                        <div id="collapse-Four" class="panel-collapse collapse">
                            <div class="panel-body"><a href="/user/message/messageTalkList.do?recv_mem_no=${recv_no}&msg_group_no=${list.msg_group_no}">${list.message}</a></div>
                        </div>
                    </div>
                </div>
                <!-- End Accordion v1 -->
                </c:forEach>

            </div>
            <!-- End Content -->

            </div>
        

            <!-- 메인------------------------------------------------------------------------------------------------------------------------------ -->
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