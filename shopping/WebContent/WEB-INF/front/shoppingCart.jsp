<%@page import="shopping.DAO.ShoppingCartDAO"%>
<%@page import="shopping.DTO.ShoppingCartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="include/pageMeta.html"%>
<link rel="stylesheet" type="text/css"
	href="front/styles/contact_styles.css">
<link rel="stylesheet" type="text/css"
	href="front/styles/contact_responsive.css">
</head>
</head>
<script type="text/javascript">
	function delBtn(num){
		var delChk = confirm("상품을 삭제하시겠습니까?");
		if(delChk){
			$.ajax({
				url:"delCart.do",
				data : {
					"ct_idx" : num
				},
				type : "post",
				success : function(){
					alert("삭제되었습니다.");
					location.reload();
				}
			});
		}
	}
</script>

<%
	ShoppingCartDAO dao = ShoppingCartDAO.getInstance();
	String user = (String) session.getAttribute("u_id");
	ArrayList<ShoppingCartDTO> list = dao.getCartList(user);
%>

<body>

	<input type="hidden" id="user" value=<%=user%> />
	<div class="super_container">
		<!-- Header -->
		<%@include file="include/header.html"%>
		<%@include file="include/menu.html"%>

		<div class="container contact_container">
			<div class="row">
				<div class="col">

					<div class="container">
						<h2 style="padding-top: 30px;">
							<strong>장바구니</strong>
						</h2>
						<br>
						<table class="table table-striped">
							<thead>
								<tr>

									<th width="200">상품</th>
									<th width="400">상세정보</th>
									<th width="300">수량</th>
									<th width="330">상품금액</th>
									<th width="70"></th>

								</tr>
							</thead>
							<tbody>
								<%
									int sum = 0;
									int totalCount = 0;
									String totalPrice = "";
									for (int i = 0; i < list.size(); i++) {
										String price = NumberFormat.getInstance().format(list.get(i).getPrice());
										String price2 = NumberFormat.getInstance().format(list.get(i).getPrice() * list.get(i).getCount());
										sum = sum + (list.get(i).getPrice() * list.get(i).getCount());
										totalCount += list.get(i).getCount();
										totalPrice = NumberFormat.getInstance().format(sum);
								%>
								<tr>
									<td><img width="120" height="120"
										src="<%=list.get(i).getImg()%>" /></td>
									<td>상품명 : <%=list.get(i).getI_name()%><br>사이즈 : <%=list.get(i).getSize()%><br>색상
										: <%=list.get(i).getColor()%>
									</td>
									<td>수량 : <%=list.get(i).getCount()%></td>
									<td>상품금액 : <%=price%> 원<br>수량별총액 : <%=price2%> 원
									</td>
									<td><input type="button" id="delBtn" value="삭제" class="btn btn-outline-danger"
										onClick="delBtn(<%=list.get(i).getCt_idx()%>);"></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>

						<h5 style="padding-top: 30px;">
							<strong>전체합계</strong>
						</h5>

						<table class="table table-striped">
							<thead>
								<tr>
									<th width="500">상품수</th>
									<th width="200">전체 주문금액</th>
									<th width="200">결제</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%=totalCount%> 개</td>
									<td><%=totalPrice%> 원</td>
									<td></center> <input id="newsletter_submit" type="button"
										class="newsletter_submit_btn trans_300" value="주문하기" /></td>
								</tr>
							</tbody>
						</table>
					</div>



					<div class="row"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- Newsletter -->
	<%@include file="include/newsletter.html"%>
	<!-- Footer -->
	<%@include file="include/footer.html"%>
	</div>
	<%@include file="include/script.html"%>
	<script src="front/js/contact_custom.js"></script>
</body>
</html>