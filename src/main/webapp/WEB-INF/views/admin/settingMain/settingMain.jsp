<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- 최상단 한줄메뉴 -->
			<c:import url="/WEB-INF/views/admin/menu/topMenu.jsp"/>
            <!-- sideMeny -->
			<c:import url="/WEB-INF/views/admin/menu/leftMenu.jsp"/>
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            EVERYWHERE <small>관리자 모드</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> 서비스 메인화면 교체 
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i>  <strong>서비스</strong> 메인화면을 수정 할 수 있습니다.
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> 슬라이드 이미지 백그라운드</h3>
                            </div>
                            <div class="panel-body">
								<form action="/admin/settingMain/backgroundImgChange.do" name="mainSettingBackImg" id="mainSettingBackImg" method="post" enctype="multipart/form-data"	>
									<input type="hidden" name="setting_spot_code" value="M8881">
									<input type="hidden" name="setting_type_code" value="M9990">
									<input type="hidden" name="setting_url" value="">
									<!-- <input type="hidden" name="planner_no" value=""> -->
	                               <input type="file" name="mainBackground">
	                                <button type="submit" class="btn btn-xs btn-default">등록</button>
								</form>                            
                                <div id="previewDiv"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> 슬라이드 이미지 프론트</h3>
                            </div>
                            <div class="panel-body">
								<form action="/admin/settingMain/forgroundImgChange.do" name="mainSettingBackImg" id="mainSettingBackImg" method="post" enctype="multipart/form-data"	>
									<input type="hidden" name="setting_spot_code" value="M8882">
									<input type="hidden" name="setting_type_code" value="M9991">
									<input type="hidden" name="setting_url" value="">
									<!-- <input type="hidden" name="planner_no" value=""> -->
	                               <input type="file" name="mainBackground">
	                               <!--텍스트 내용 -->
	                               <div class="form-group">
                                	<label>html로 작성해 주세요</label>
	                               <textarea class="form-control" rows="10" name="setting_text">
							            <div class="da-slide">
							                <h2><i>USING BEST WEB</i> <br /> <i>SOLUTIONS WITH</i> <br /> <i>HTML5/CSS3</i></h2>
							                <p><i>Lorem ipsum dolor amet</i> <br /> <i>tempor incididunt ut</i> <br /> <i>veniam omnis </i></p>
							                <div class="da-img"><img src="@{image}" alt="image01" /></div>
							            </div>
	                               </textarea>
                            		</div>
	                                <button type="submit" class="btn btn-xs btn-default">등록</button>
	                              <span>작성내용중 이미지는 @{image} 를 써주세요.</span>
								</form>                            
                                <div id="previewDiv"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->



            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>

</html>
