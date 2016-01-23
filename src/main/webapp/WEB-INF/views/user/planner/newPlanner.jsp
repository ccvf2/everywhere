<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/common/jquery.jsp" />
<c:import url="/WEB-INF/views/user/common/utilImport.jsp" />
<meta charset="UTF-8">
<title>여행스케줄쓰기</title>
<script type="text/javascript" src="/script/user/planner/newPlanner.js"></script>
<script type="text/javascript">
		$(function() { 
			$('#plannerCreate').modal('show');
			$('#plannerCreate').on('hide.bs.modal', function() {
				$("#plannerCreate").remove;
			})
		});
</script>
</head>

<!-- 여행스케줄쓰기 -->
<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
<div class="modal fade" id="plannerCreate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<form action="/user/planner/plannerCreate.do" method="post">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title"><i class="fa fa-paper-plane-o"></i>새일정 만들기</h4>
			</div>
			<div class="modal-body">
				<div class="input-group margin-bottom-20">
					<span class="input-group-addon" id="basic-addon1">여행제목</span> 
					<input type="text" class="form-control" required id="title" name="title" placeholder="예) 나의 3박 4일 제주여행기"
						aria-describedby="basic-addon1">
				</div>
				<div>
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon" id="basic-addon1">여행시작</span> 
						<input type="date" class="form-control" min="1900-01-01" required pattern="\d{4}-\d{1,2}-\d{1,2}" id="start" name="start_date" onchange="startSelect()">
						<span class="input-group-addon" id="basic-addon1">여행끝</span> 
						<input type="date" class="form-control" max="2099-12-31" required pattern="\d{4}-\d{1,2}-\d{1,2}" id="finish" name="end_date" onchange="endSelect()">
					</div>
				</div>
				<div>
					<div class="input-group radio">
					  <label><input type="radio" name="planner_ba_code" value="E0001" checked="checked">여행스케쥴</label> &nbsp;&nbsp;
					  <label><input type="radio" name="planner_ba_code" value="E0002">여행리뷰</label>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn-u btn-u-default" data-dismiss="modal">닫기</button>
				<!-- <input type="submit" class="btn-u btn-u-default" value="쓰기"/> -->
				<input type="submit" class="btn-u" value="쓰기"/>
			</div>
		</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
	
</div>
<!-- /.modal -->

</html>