<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Bootstrap 101 Template</title>

<!-- Bootstrap -->
<link href="/script/common/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/script/common/bootstrap/js/bootstrap.min.js"></script>
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModal">Open Modal</button>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			<form action="/user/planner/plannerCreate.do" method="post" onsubmit="return plannerForm(this)" >
			<input type="hidden" name="mem_no" value="64">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">새일정 만들기..</h4>
				</div>
				<div class="modal-body">
					<p>One fine body&hellip;</p>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">여행제목</span> 
						<input type="text" class="form-control" name="title" placeholder="예) 나의 3박 4일 제주여행기"
							aria-describedby="basic-addon1">
					</div>
					<div>
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">여행시작</span> 
							<input type="date" class="form-control" name="start_date"> 
							<span class="input-group-addon" id="basic-addon1">여행끝</span> 
							<input type="date" class="form-control" name="end_date">
						</div>
					</div>
					<div>
						<div class="radio">
						  <label><input type="radio" name="planner_ba_code" value="P0002">여행스케쥴</label>
						  <label><input type="radio" name="planner_ba_code" value="P0001">여행리뷰</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="submit" class="btn btn-primary"/>
				</div>
			</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
		
	</div>
	<!-- /.modal -->
</body>
</html>