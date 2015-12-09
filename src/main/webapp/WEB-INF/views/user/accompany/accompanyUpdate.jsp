<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  </head>
  <body>
   	<form action="/user/accompany/accompanyWriteOk.do" method="post" onsubmit="" enctype="multipart/form-data">
		<input type="hidden" name="accompany_no" value="" />
		<input type="hidden" name="mem_no" value="" />
		<label>제목</label>
		<input type="text" name="title"><br/>
		<br/>
		<label>시작일</label>
		<input type="text" name="start_date" id="start_date" />
		
		<label>종료일</label>
		<input type="text" name="end_date" id="end_date" />
		<input type="radio"	name="gender_code" value="1">남 
		<input type="radio"	name="gender_code" value="2">여 
		<input type="radio"	name="gender_code" value="3" checked="checked">둘 다 
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

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/script/common/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>