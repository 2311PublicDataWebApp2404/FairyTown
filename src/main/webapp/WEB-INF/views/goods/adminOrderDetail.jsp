<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈 주문 상세 정보</title>

	<!-- DataTables -->
	<link rel="stylesheet" href="../resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="../resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" href="../resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
</head>
<body>
	<jsp:include page="../inc/adminheader.jsp"></jsp:include>
	<!-- Content Header -->
	<div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>굿즈 목록</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">DataTables</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
			<div class="card-body">
			<form name="cancelPay" action="/goods/cancelPay.ft" method="post" autocomplete="off">
				<input type="hidden" name="cancelArray" id="cancelArray" value="">
				<input type="hidden" name="goodsOrderCode" value="${oList[0].goodsOrderCode }">
				<input type="hidden" name="merchantUid" value="${oList.get(0).merchantUid }">
				<button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef; margin: 0 10px 0 0; float:left;" onclick="cancel();">주문취소</button>
			</form>
			<button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onclick="showOrderList();">주문내역</button>
                <br><br>
                <table id="example2" class="table table-bordered table-hover">
                  
	                  <tbody>
							<tr>
								<td width="170px">주문번호</td>
								<td><p class="goodsOrderCode">${oList[0].goodsOrderCode }</p></td>
							</tr>
							
								<tr>
									<td><br>상품 정보</td>
									<td>
									<c:forEach items="${oList }" var="oList" varStatus="i">
									<br>
									<img src='../resources/guploadFiles/${oList.goodsFileRename }' width="300px" height="230px">
									${oList.goodsName }
									<br><br>
									</c:forEach>
									</td>
								</tr>
							<tr>
								<td>총 가격</td>
<%-- 								<td>${goods.goodsPrice }원</td> --%>
								<td><fmt:formatNumber value="${oList[0].goodsSum}" pattern="###,###,###"/>원</td>
							</tr>
							<tr>
								<td>주문날짜</td>
								<td>${oList[0].goodsOrderDate }</td>
							</tr>
							<tr>
								<td>수령인</td>
								<td>${oList[0].goodsOrderName }</td>
							</tr>
							<tr>
								<td>수령인 전화번호</td>
								<td>${oList[0].goodsOrderPhone }</td>
							</tr>
							<tr>
								<td>수령인 우편번호</td>
								<td>${oList[0].goodsOrderPostcode }</td>
							</tr>
							<tr>
								<td>수령인 주소</td>
								<td>${oList[0].goodsOrderAddress }</td>
							</tr>
						</tbody>
                </table>
              </div>
			</div>	
		</div>
	</div>
</div>
</section>
</div>
<jsp:include page="../inc/adminfooter.jsp"></jsp:include>
<!-- DataTables  & Plugins -->
<script src="../resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../resources/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../resources/plugins/jszip/jszip.min.js"></script>
<script src="../resources/plugins/pdfmake/pdfmake.min.js"></script>
<script src="../resources/plugins/pdfmake/vfs_fonts.js"></script>
<script src="../resources/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../resources/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../resources/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script>
  $(function () {
    $('#example2').DataTable({
		"paging": true,
		"lengthChange": false,
		"searching": true,
		"ordering": true,
		"info": true,
		"autoWidth": true,
		"responsive": true,
		
		language: {
		    "decimal": "",
		    "emptyTable": "테이블에 데이터가 없습니다",
		    "info": "_TOTAL_개 항목 중 _START_부터 _END_까지 표시중",
		    "infoEmpty": "0개 항목 중 0부터 0까지 표시중",
		    "infoFiltered": "(_MAX_개 항목 중 필터링됨)",
		    "infoPostFix": "",
		    "thousands": ",",
		    "lengthMenu": "_MENU_개 항목 표시",
		    "loadingRecords": "로딩 중...",
		    "processing": "처리 중...",
		    "search": "검색:",
		    "zeroRecords": "일치하는 레코드를 찾을 수 없습니다",
		    "paginate": {
		        "first": "처음",
		        "last": "마지막",
		        "next": "다음",
		        "previous": "이전"
		    },
		    "aria": {
		        "orderable": "이 열을 정렬하려면 클릭",
		        "orderableReverse": "이 열을 역순으로 정렬하려면 클릭"
		    }
	    }
    });
  });
</script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script type="text/javascript">
		function showOrderList() {
			location.href = "/admin/orderList.ft";
		}
		function cancel() {
			var cancelGoods = "";
			<c:forEach items="${oList }" var="oList" varStatus="i">
				cancelGoods += "{goodsCode: '${oList.goodsCode }',goodsOrderCnt : '${oList.goodsOrderCnt }'}/";
		       </c:forEach>
		      	document.getElementById('cancelArray').value = cancelGoods;
			  if(confirm("주문 취소하시겠습니까?")) {	
				  
				cancelPay.submit();
			  }
		}
	</script>
</body>
</html>