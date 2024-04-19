<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ADMIN] 휴무일 정보</title>
</head>
<body>
	<!-- 공통 / 헤더 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>

			
		<!-- 어드민 타이틀 영역 -->
			<div class="admTitle">
				<table class="title_tbl">
					<tr>
						<td class="titleFirst"><h2>운휴정보</h2></td>
					</tr>
					<tr>
						<td class="titleSecond"><h4>운휴정보 목록</h4></td>
					</tr>
				</table>
			</div>
		
		<!-- 컨텐츠 영역 -->
			<div class="content">
				
				<!-- 목록 테이블 -->
				<table class="table_ride_list">
					<tr>
						<td colspan="5"><input type="button" name="closeregist" onClick="showRegist();" value="휴무 등록"></td>
					</tr>
					
					<tr>
						<td>번호</td>
						<td>놀이기구명</td>
						<td>휴무일시</td>
						<td>사유</td>
						<td>현재상태</td>
					</tr>
					
					<!-- 	등록된 운영 휴무 계획이 있는 경우 -->
					<c:choose>
							<c:when test="${fn:length(cList) != 0 }">
								<c:forEach items="${cList }" var="close" varStatus="i">
									<tr class="close_list_tr">
										<td class="list_first_td">
											<a href="/admin/closedetail.ft?rideId=${close.rideId }">${i.count }</a>
										</td>
										<td class="list_second_td">
											<a href="/admin/closedetail.ft?rideId=${close.rideId }">${close.rideName }</a>
										</td>
										<td class="list_third_td">
											<a href="/admin/closedetail.ft?rideId=${close.rideId }">${close.closeDate}</a>
										</td>
										
										<td class="list_fourth_td">
											<a href="/adminclosedetail.ft?rideId=${close.rideId }">${close.closeReason}</a>
										</td>

										<c:set var="rStatus" value="${close.rideStatus }" />
										<c:if test="${rStatus eq 'Y' }">
											<td class="list_fifth_td"><a
												href="/admin/closedetail.ft?rideId=${close.rideId }">정상 운영</a>
											</td>
										</c:if>
										<c:if test="${rStatus eq 'N'}">
											<td class="list_fifth_td"><a
												href="/adminclosedetail.ft?rideId=${close.rideId }">임시 휴무</a>
											</td>
										</c:if>
									</tr>
								</c:forEach>


								<tr align="center" class="pgn">
									<td colspan="5">
										<c:if test="${pi.startNavi ne '1' }">
											<a href="/admin/closesearch.ft?page=${pi.startNavi - 1 }">[이전]</a>
										</c:if> 
										<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
											<a href="/admin/closesearch.ft?page=${p }">${p }</a>
										</c:forEach> 
											<c:if test="${pi.endNavi ne pi.naviTotalCount }">
												<a href="/admin/closesearch.ft?page=${pi.endNavi + 1 }">[다음]</a>
											</c:if>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
									<td class="list_fifth_td" colspan="5">
										<p class="nullmsg_search">
											검색된 휴무 일정이 없습니다.<br>
										</p>
										<button type="button" class="empty_reg_btn"
											onclick="showRegist();">휴무 일정 등록하기</button>
							</c:otherwise>
						</c:choose>
										
				
				<!-- 검색 영역 -->
			<tr>
				<td colspan="5">
					<div class="search_box">
					    <form class="search_form" action="/admin/closesearch.ft" name="search_form" method="get">
							<div class="search_select">
								<select class="form-select" name="searchCondition"  id="searchcon">
									<option value="all" 			<c:if test="${searchCondition == 'all'}">selected</c:if>>전체</option>
									<option value="rideName"		<c:if test="${searchCondition == 'rideName'}">selected</c:if>>놀이기구명</option>
									<option value="closeDate"		<c:if test="${searchCondition == 'closeDate'}">selected</c:if>>휴무일시</option>
									<option value="closeReason"		<c:if test="${searchCondition == 'closeReason'}">selected</c:if>>사유</option>
									<option value="rideStatus"		<c:if test="${searchCondition == 'rideStatus'}">selected</c:if>>현재 상태</option>
								</select>
							</div>	
							
							<div class="search_button">
								<div class="input">
									<input type="search" name="searchKeyword" id="searchKeyword" value="${searchKeyword }">
									<button type="submit" class="btn" onClick="return Checkalert();">검색</button>
									<button type="reset" class="btn search_reset"  onClick="removeWord();">초기화</button>
								</div>
							</div>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<script>
		
		// 검색 목록 페이지 사용 JS : Checkalert,removeWord(),showRegist()
			function Checkalert() {
				if (search_form.searchKeyword.value == "") {
					search_form.searchKeyword
							.focus();
					alert("검색어를 입력해주세요.");
					return false;

				}
		
				function removeWord(){
				    if( search_form.searchKeyword.value != "" ) {
				    	search_form.searchKeyword.value="";
				    	document.getElementById("searchcon").value = "all";
				     }
				}
				
				function showRegist(){
					location.href = "/admin/closeregist.ft";
					}
				}		
	</script>
	  
	<!-- 공통 / 풋터 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	
</body>
</html>