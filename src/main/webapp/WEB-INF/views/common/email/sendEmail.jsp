<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>이메일 작성</title>

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
   	<div class="container-fluid">
   		<div class="row">
   			<form name="emailForm" id="emailForm" action="/common/email/sendEmail.do" method="post" onsubmit="return emailFormCheck()">
   				<input type="hidden" name="mail_sender_email" value="admin@ccvf2.mynetgear.com">
   				
			  <div class="form-group">
			    <label for="mail_receiver_email">*받는 사람 이메일</label>
			    <input type="email" class="form-control" name="mail_receiver_email" id="mail_receiver_email" placeholder="Reciever Email" required="required">
			  </div>
			  <!-- 참조 -->
			  <a class="btn btn-default" role="button" data-toggle="collapse" href="#collapseMail_cc" aria-expanded="false" aria-controls="collapseExample">
				 참조
			  </a>
			  <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#collapseMail_bcc" aria-expanded="false" aria-controls="collapseExample">
				  숨은 참조
			  </button>
			  
			  <div class="collapse" id="collapseMail_cc">
			   	 <div class="form-group">
			    	<label for="mail_cc">참조</label>
			    	<input type="email" class="form-control" name="mail_cc" id="mail_cc" placeholder="cc">
		  		</div>
			  </div>
			  
			  <div class="collapse" id="collapseMail_bcc">
			   	 <div class="form-group">
			    	<label for="mail_receiver_email">숨은 참조</label>
			    	<input type="email" class="form-control" name="mail_bcc" id="mail_bcc" placeholder="bcc">
		  		</div>
			  </div>
			  
			  <div class="form-group">
			  	<label for="mail_receiver_name">받는 사람 이름</label>
			  	<input type="text" class="form-control" name="mail_receiver_name" id="mail_receiver_name" placeholder="Receiver Name">
			  </div>
			  
			  <div class="form-group">
			    <label for="mail_title">*제목</label>
			    <input type="text" class="form-control" name="mail_title" id="mail_title" placeholder="Subject" required="required">
			  </div>
			  
			  <div class="form-group">
			  	<label for="mail_content">*내용</label>
			  	<textarea class="form-control" name="mail_content" rows="3" placeholder="Content" required="required"></textarea>
			  </div>
			  
			 <!--  <div class="form-group">
			    <label for="exampleInputFile">File input</label>
			    <input type="file" id="exampleInputFile">
			    <p class="help-block">Example block-level help text here.</p>
			  </div>
			  -->
			  <button type="submit" class="btn btn-primary">메일 보내기</button>
			</form>	
   		</div>
   	</div>
	<script type="text/javascript">
		function emailFormCheck() {
			var validator = $("#emailForm").validate();
			validator.form();
		}
	</script>
	<script type="text/javascript" src="/assets/js/plugins/validation.js"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="/script/common/jquery-1.11.3.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/script/common/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>