<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 입력</title>
</head>
			<!-- id값으로 사이드 메뉴 고정 -->
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
		              <div class="tag-box tag-box-v4 margin-bottom-20 hidden-xs" style="padding : 0px; border: 1px #bbb;">
							<ul class="list-unstyled mCustomScrollbar margin-bottom-20 _mCS_1 mCS-autoHide" data-mcs-theme="minimal-dark" id="spotLists" style="position: relative; overflow: visible;">
								<c:forEach var="spot" items="${searchSpotList}">
									<li class="notification" style="margin:0px;border:1px solid #eee;padding:5px 5px;height: 48px;overflow:hidden;" id="spotItem">
										<div id="${spot.spot_no}_item" class="ui-widget-content" style="border:0px;">
											<i style="margin:0; float:left;"><img alt="" src="/attatchFile/spot/${spot.spot_photoes[0].save_name}.${spot.spot_photoes[0].extension}" style="width:35px;height:35px;margin-right:5px;"></i>
											<div class="overflow-h">
												<span>
													<strong><a href="javascript:spotReadPage('${spot.spot_no}')">${spot.spot_name}</a></strong>
												</span><br/>
												<small><c:out value="${spot.spot_note}"/></small>
											</div>
										</div>
									</li>
								</c:forEach>
								<div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;">
									<div class="mCSB_draggerContainer">
										<div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; display: block; height: 247px; max-height: 286px; top: 0px;" oncontextmenu="return false;">
											<div class="mCSB_dragger_bar" style="line-height: 50px;">
											</div>
										</div>
										<div class="mCSB_draggerRail">
										</div>
									</div>
								</div>
							</ul>
							<button type="button" class="btn-u btn-u-default btn-u-sm btn-block" onclick="selectMoreSpotList()">Load More</button>
							<!--End Notification-->
			            </div>
			            <!-- End Blog Newsletter -->
		            </div>
		         </div>
</html>