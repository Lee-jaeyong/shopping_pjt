<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<ItemDTO> list = (ArrayList<ItemDTO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<%@include file="include/pageMeta.jsp"%>

<body>
	<%@include file="include/headerTop.jsp"%>

	<%@include file="include/headerMenu.jsp"%>

	<%@include file="include/sideMenu.jsp"%>

	<!--**********************************
            Content body start
        ***********************************-->
	<div class="content-body">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<table
									class="table table-striped table-bordered zero-configuration">
									<thead>
										<tr>
											<th>상품 번호</th>
											<th>상품</th>
											<th>대분류</th>
											<th>소분류</th>
											<th>가격</th>
											<th>대표이미지</th>
											<th>조회수</th>
											<th>상품 등록일</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 0; i < list.size(); i++) {
										%>
										<tr>
											<td><%=list.get(i).getI_idx()%></td>
											<td><%=list.get(i).getI_name()%></td>
											<td><%=list.get(i).getC_cagetoryName()%></td>
											<td><%=list.get(i).getCs_categoryName()%></td>
											<td><%=list.get(i).getI_price()%></td>
											<td><%=list.get(i).getImg_path()%></td>
											<td><%=list.get(i).getI_hit()%></td>
											<td><%=list.get(i).getI_date()%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<div class="button-group">
									<div class="btn-toolbar">
										<div class="btn-group mr-2 mb-2">
											<button type="button" class="btn btn-primary disabled">2</button>
											<button type="button" class="btn btn-primary">3</button>
											<button type="button" class="btn btn-primary">4</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--**********************************
            Content body end
        ***********************************-->
	<%@include file="include/footer.jsp"%>
	<!--**********************************
        Main wrapper end
    ***********************************-->
	<%@include file="include/script.html"%>
</body>

</html>