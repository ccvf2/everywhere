                                            <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
			<!-- 사이드 메뉴  시작-->
	            <div class="col-md-3" id="leftCol">
		            <!-- Blog Newsletter -->
		            <div class="blog-newsletter" id="sidebar">
		               <div class="headline-v2"></div>
	            	 	<form action="#" class="sky-form" onsubmit="searchSpotList()">
		                    <header>리뷰 검색</header>
		                    
		                    <fieldset style="padding: 15px 15px 5px;">
		                    	<!-- 지역 찾기 -->
		                    	  <section>
		                            <label class="input">
		                            	<!-- 자동완성 input : works in Chrome, Firefox, Opera and IE10. -->
		                                <input type="text" list="list" name="searchPlace" id="searchPlace" placeholder="키워드" value="${searchPlace}">
		                                <datalist id="list">
		                                	<c:forEach var="place" items="${placeList}">
		                                		<option value="${place.code_name}"></option>
		                                	</c:forEach>
		                                </datalist>
		                            </label>
		                        </section>
		                    </fieldset>
		                    <!-- 명소 종류 선택 시작 -->
		                    <fieldset style="padding: 15px 15px 5px;">
		                        <section>
		                            <label class="label">글종류</label>
		                            <div class="">
		                            	<c:forEach var="typeCode" items="${selectCode}">
		                            		<label class="checkbox"><input type="checkbox" name="typeCode" value="${typeCode.code}"><i></i>${typeCode.code_name}</label>
		                            	</c:forEach>
		                            </div>
		                        </section>
		                    </fieldset>
		                    <fieldset style="padding: 15px 15px 5px;">
		                        <section>
		                            <label class="label">정렬</label>
				                            <label class="select">
				                                <select>
				                                	<c:forEach var="sortCode" items="${sortCode}">
				                                    <option value="${sortCode.code}">${sortCode.code_name}</option>
				                                	</c:forEach>
				                                </select>
				                                <i></i>
				                            </label>
		                        </section>
		                    </fieldset>
		                    <!-- 명소 종류 선택 끝 -->
		                    <!-- 명소 검색 버튼 시작 -->
		                    <footer>
		                        <button type="submit" class="btn-u">검색</button>
		                        <button type="button" class="btn-u btn-u-default" onclick="window.history.back();">뒤로</button>
		                    </footer>
		                </form>
			            <!-- End Blog Newsletter -->
		            </div>
		         </div>
			<!-- 사이드 메뉴  끝 -->
</html>