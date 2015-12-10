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
	<form name="accompanyForm" action="/user/accompany/accompanyWriteOk.do" method="post" onsubmit="return writeCheck()" enctype="multipart/form-data">
		<input type="hidden" name="accompany_no" value="" />
		<input type="hidden" name="mem_no" value="" />
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
		
		<!-- 동행구함 여부 -->
		<select name="accompany_status_code">
			<c:forEach var="postType" items="${postTypeList}">
				<option value="${postType.code}">${postType.code_name}</option>
			</c:forEach>
		</select>
		<br/><br/>
		
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
	
</body>
</html>