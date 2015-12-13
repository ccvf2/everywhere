<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
 <h3>공통사용(모듈)</h3>
 <a href="/test/test2.do">파일테스트</a>
 <a href="/test/reply.do">공통댓글</a>
 <hr/>

 <h1>관리자</h1>
 <a href="/admin/main/main.do">어드민메인페이지</a>
 <a href="/admin/commoncode/code.do">관리자-공통코드(기본CRUD)</a>
 <a href="/admin/mailtemplat/mailTemplatList.do">메일목록</a>
 <a href="/admin/member/adminMemberList.do">관리자 -회원관리</a>
 <hr/>

 <h1>사용자</h1>
 <a href="/user/member/register.do">회원가입</a>
 <a href="/user/member/memberRead.do?mem_no=64">회원정보보기</a>
 <a href="/user/member/memberUpdate.do?mem_no=64">회원정보수정</a>
 <a href="/user/member/memberDelete.do?mem_no=64">회원정보삭제</a>
 <hr/> 

 <a href="/user/visitor/visitorWrite.do?mem_no=64">방명록쓰기</a>
 <hr/> 

 <a href="/user/accompany/accompanyMain.do">회원동행구하기</a>
 <hr/> 
 <a href="/user/planner/plannerCreate.do">스케줄</a>
 <a href="/user/planner/plannerList.do?mem_no=64">스케줄 목록</a>
 <hr/>
 <a href="/user/spot/addSpotPage.do">명소추가</a>
 <a href="user/spot/spotListPage.do">스케줄-명소목록()</a>

 <hr/>
 <a href="/user/main/main.do">유저 메인 페이지</a>

</body>
</html>