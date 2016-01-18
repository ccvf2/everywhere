<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/WEB-INF/views/common/jquery.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
alert("☆★로그인시 아이디패스워드 꼭 확인하세요. 성국이서버는@everwhere   제서버는@everywhere 빠진y가 추가 되었습니다. 비밀번호는 동일하게 1234567890 입니다.-성욱-★☆");

	var requestURL="http://api.visitkorea.or.kr/TourAPI2_manual/sample/searchKeyword_sample2.xml";
	$(function() {
		$.ajax({
					url : requestURL,
					type : "GET",
					dataType : "xml",
					success : function(data){
						//alert(data);
						var itemList= new Array();
						var itemList=$(data).find("item");
						console.log(itemList)
					},
					error : function() {
						alert("목록 가져오기 실패");
					}
				})
	})

</script>

</head>

<body>
 <h3>spot 추가</h3>
<a href="/xmlparse/parse.do?areaCode=1">서울</a>
<a href="/xmlparse/parse.do?areaCode=2">인천</a>
<a href="/xmlparse/parse.do?areaCode=3">대전</a>
<a href="/xmlparse/parse.do?areaCode=4">대구</a>
<a href="/xmlparse/parse.do?areaCode=5">광주</a>
<a href="/xmlparse/parse.do?areaCode=6">부산</a>
<a href="/xmlparse/parse.do?areaCode=7">울산</a>
<a href="/xmlparse/parse.do?areaCode=8">세종</a>
<hr/>
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
 <a href="/user/myPage/myPage.do?uandMe=S0001">마이페이지</a>
 <hr/>
 <h3>타회원(마이페이지) 이동</h3>
 <a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=327">문희준(user01@everywhere.com)</a><br/>
 <a href="/user/myPage/myPage.do?uandMe=S0002&mem_no=328">장우혁(user02@everywhere.com)</a><br/>

 <hr/>
 <a href="/user/member/register.do">회원가입</a>
 <a href="/user/member/memberRead.do?mem_no=${mem_object.mem_no}">회원정보보기</a>
 <a href="/user/member/memberUpdate.do?mem_no=${mem_object.mem_no}">회원정보수정</a>
 <a href="/user/member/memberDelete.do?mem_no=${mem_object.mem_no}">회원정보삭제</a>
 <hr/> 

 <a href="/user/visitor/visitorWrite.do?mem_no=${mem_object.mem_no}">방명록쓰기</a>
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
	<a href="/user/search/searchTotal.do">통합검색</a>
	<a href="/user/search/searchSpot.do">명소검색</a>
	<a href="/user/search/searchPlanner.do">스캐줄 검색</a>
<hr/>
<a href="javascript:test()">test</a>
<hr/>



	<a href="/admin/settingMain/backgroundList.do">백스라운드 설정 목록</a>
<hr/>
<h2>로그인</h2>
 <a href="/user/login/login.do">로그인 페이지</a>
<c:choose>
	<c:when test="${mem_object==null}">
		<form action="/user/login/login.do" name="memberLogin" method="post">
		<label>아이디<input type="text" name="mem_email" value="ccvf2@naver.com"></label>
		<label>비밀번호<input type="text" name="mem_pwd" value="12345678"></label>
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