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
    <title>여행 동행구하기</title>

    <!-- Bootstrap -->
    <link href="/script/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
	<script type="text/javascript" src="/script/common/datepicker.js"></script>	    
	

  </head>
  <body>
   	<form name="accompanyForm" action="/user/accompany/accompanyUpdateOk.do" method="post" onsubmit="" enctype="multipart/form-data">
		<input type="hidden" name="accompany_no" value="${accompanyDto.accompany_no}"/>
		<input type="hidden" name="mem_no" value="${accompanyDto.mem_no}" />
		<input type="hidden" name="currentPage" value="${currentPage}"/>
		<label>제목</label>
		<input type="text" name="title" value="${accompanyDto.title}"><br/>
		<br/>
		
		<fmt:formatDate var="start_date" pattern="yyyy-MM-dd" value="${accompanyDto.start_date}"/>
  		<fmt:formatDate var="end_date" pattern="yyyy-MM-dd" value="${accompanyDto.end_date}"/>
  		
		<label>시작일</label>
		<input type="text" name="start_date" id="start_date" value="${start_date}"/>
		
		<label>종료일</label>
		<input type="text" name="end_date" id="end_date" value="${end_date}"/><br/>
		
		
		<c:forEach var="gender_code" items="${genderList}">
			<!-- 성별코드 일치시 -->
			<input type="radio"	name="gender_code" value="${gender_code.code}" id="gender_id_${gender_code.code}">${gender_code.code_name}
		</c:forEach>
		<script type="text/javascript">
			for(var i=0;i<accompanyForm.gender_code.length;i++){
				if(accompanyForm.gender_code[i].value=="${accompanyDto.gender_code}") {
					accompanyForm.gender_code[i].checked=true;
				}
			}
		</script>
		<br/><br />
		

		<!-- 동행구함 여부 -->
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
		<br/><br/>
		
		<label>내용</label>
		<textarea rows="14" cols="67" name="content">${accompanyDto.content}</textarea>
		<br/>
		<br/>
		<label class="title">파일명</label>
		<input type="file" name="file"/>
			
		<br/>
		<br/>
		<input type="submit" value="글 수정" />
		<input type="button" value="취소" onclick="location.href='/user/accompany/accompanyList.do?pageNumber=${currentPage}'" />
	</form>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/script/common/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>