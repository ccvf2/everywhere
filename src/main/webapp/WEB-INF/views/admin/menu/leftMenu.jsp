<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
<body>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <!-- <li>
                        <a href="index.html"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                    </li> -->
                    <li>
                        <a href="/admin/chart/chartView.do"><i class="fa fa-fw fa-bar-chart-o"></i> 통계보기</a>
                    </li>
                    <li>
                        <a href="/admin/member/adminMemberList.do"><i class="fa fa-fw fa-table"></i>회원관리</a>
                    </li>
                   <!--  <li>
                        <a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a>
                    </li>
                    <li>
                        <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                    </li>
                    <li>
                        <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                    </li> -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i>메일템플릿<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="/admin/mailtemplate/mailTemplateList.do">메일템플릿목록</a>
                            </li>
                            <li>
                                <a href="/admin/mailtemplate/mailTemplateInsert.do">메일템플릿 등록</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://localhost:8888/admin/commoncode/code.do"><i class="fa fa-fw fa-file"></i> 공통코드목록</a>
                    </li>
                    <li>
                        <a href="/admin/settingMain/settingMain.do"><i class="fa fa-fw fa-dashboard"></i> 메인화면 수정하기</a>
                    </li>
                </ul>
            </div>
</body>
</html>