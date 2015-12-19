<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function test() {
		window.showModalDialog("/test/reply.do","","");
	}
</script>

</head>

<body>
 <h3>공통사용(모듈)</h3>
 <a href="/test/test2.do">파일테스트</a>
 <a href="/test/reply.do">공통댓글</a>
 <a href="/common/email/sendEmail.do">메일 보내기</a>
 <hr/>

 <h1>관리자</h1>
 <a href="/admin/main/main.do">어드민메인페이지</a>
 <a href="/admin/commoncode/code.do">관리자-공통코드(기본CRUD)</a>
 <a href="/admin/mailtemplat/mailTemplatList.do">메일목록</a>
 <a href="/admin/member/adminMemberList.do">관리자 -회원관리</a>
 <hr/>
 <a href="/admin/chart/chartView.do">관리자 - 통계보기</a>
 <hr/>

 <h1>사용자</h1>
 <a href="/user/myPage/myPage.do?uandMe=1">마이페이지</a>
 <hr/>
 <h3>타회원(마이페이지) 이동</h3>
 <a href="/user/myPage/myPage.do?uandMe=2&mem_no=44">봉채윤(tjdrhkd@naver.com)</a><br/>
 <a href="/user/myPage/myPage.do?uandMe=2&mem_no=43">김성광(tjdrhkd2@naver.com)</a><br/>
 <a href="/user/myPage/myPage.do?uandMe=2&mem_no=70">전현준(guswns@naver.com)</a><br/>
 <hr/>
 <a href="/user/member/register.do">회원가입</a>
 <a href="/user/member/memberRead.do?mem_no=10">회원정보보기</a>
 <a href="/user/member/memberUpdate.do?mem_no=10">회원정보수정</a>
 <a href="/user/member/memberDelete.do?mem_no=10">회원정보삭제</a>
 <hr/> 

 <a href="/user/visitor/visitorWrite.do?mem_no=10">방명록쓰기</a>
 <hr/> 

 <a href="/user/accompany/accompanyMain.do">회원동행구하기</a>
 <hr/> 
 <a href="/user/planner/plannerCreate.do">스케줄</a>
 <a href="/user/planner/plannerList.do?mem_no=64">스케줄 목록</a>
 <a href="/user/planner/writePlanner.do?planner_no=30">스케줄 쓰기 테스트</a>
 <hr/>
 <a href="/user/spot/addSpotPage.do">명소추가</a>
 <a href="user/spot/spotListPage.do">스케줄-명소목록()</a>

 <hr/>
 <a href="/user/main/main.do">유저 메인 페이지</a>
<hr/>
 <a href="/user/message/messageTalkList.do?recv_mem_no=${mem_object.mem_no}&msg_group_no=888888">1:1대화함</a>
 <a href="/user/message/messageBox.do?mem_no=${mem_object.mem_no}">메세지 박스</a>
 
<hr/>
<a href="javascript:test()">test</a>
<hr/>
<h2>로그인</h2>
 <a href="/user/login/login.do">로그인 페이지</a>
<c:choose>
	<c:when test="${mem_object==null}">
		<form action="/user/login/login.do" name="memberLogin" method="post">
		<label>아이디<input type="text" name="mem_email" value="admin@everwhere.com"></label>
		<label>비밀번호<input type="text" name="mem_pwd" value="1234567890"></label>
		<input type="submit" value="로그인">
		</form>
	</c:when>
	<c:otherwise>
		mem_no:${mem_object.mem_no}<br/>
		mem_email:${mem_object.mem_email}<br/>
		mem_name:${mem_object.mem_name}<br/>
		mem_phone:${mem_object.mem_phone}<br/>
		mem_interest:${mem_object.mem_interest}<br/>
		mem_status_code:${mem_object.mem_status_code}<br/>
		mem_level_code:${mem_object.mem_level_code}<br/>
		mem_profile_photo:${mem_object.mem_profile_photo}<br/>
		mem_reg_date:${mem_object.mem_reg_date}<br/>
		<br/><a href="/user/login/loginout.do">로그아웃</a>
	</c:otherwise>
</c:choose>
</body>
</html>