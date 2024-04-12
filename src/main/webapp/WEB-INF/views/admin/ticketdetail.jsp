<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ADMIN] 티켓 관리</title>
</head>
<body>
	<!-- 공통 / 헤더 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>

		<form action="/admin/ticketdetail.ft" method="post" name="ticketForm">
			
		<!-- 어드민 타이틀 영역 -->
			<div class="admTitle">
				<table class="title_tbl">
					<tr>
						<td class="titleFirst"><h2>티켓 관리 </h2></td>
					</tr>
					<tr>
						<td class="titleSecond"><h4>티켓 상세</h4></td>
					</tr>
				</table>
			</div>
		
		<!-- 컨텐츠 영역 -->
			<div class="content">
			<input type="hidden" name="ticketNo" value="ticketNo">
				<table class="table_close">
					<tr>
						<td>티켓명＊ : </td>
						<td>
							<span>${ticket.ticketName }</span>
						</td>
					</tr>
					<tr>
						<td>티켓설명 : </td>
						<td><span>${ticket.ticketDetail }"></span>
					</tr>
					<tr>
						<td>제휴카드 : </td>
						<td>
							<span>${ticket.ticketCard }</span>
						</td>
					</tr>
					
					<tr>
						<td>어른 가격* : </td>
						<td>
							<span>${ticket.ticketAdult}</span>
						</td>
					</tr>
					<tr>
						<td>청소년 가격 : </td>
						<td>
							<span>${ticket.ticketTeen}</span>
						</td>
					</tr>
					<tr>
						<td>어린이 가격 : </td>
						<td>
							<span>${ticket.ticketChild}</span>
						</td>
					</tr>
					<tr>
						<td>사용상태 : </td>
						<td>
							<span>${ticket.ticketStatus}</span>
						</td>
					</tr>
					<tr>
						<td>이미지 : </td>
						<td>
							<span>${ticket.ticketImgName}</span>
						</td>
					</tr>
					
					
					<tr>
						<td colspan="5">
							<input type="reset" value="이전으로" onClick="goBack();">
							<input type="submit" value="수정하기" onClick="showModify();"> 
						</td>
					</tr>
				</table>
			</div>
		</form> 
	
		<script>
		//상세 페이지 사용 JS : showModify(), goBack()
			
			function goBack() {
				history.back();
			}
			function showModify() {
				var noticeNo = "${ticket.ticketNo }";
				location.href = "admin/ticketmodify.ft?ticketNo=" + ticketNo;
			}
	
			
		
		</script>
	<!-- 공통 / 풋터 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>