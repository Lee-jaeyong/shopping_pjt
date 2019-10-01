<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@include file="include/pageMeta.jsp"%>
<script>
	function fileUpload() {
		$.ajax({
			url : "./ExcelUploadServlet",
			type : "post",
			data : {
				"path" : $("#excelFile").val()
			},
			success : function(data) {
				alert("등록 완료");
				$("#excelFile").val("");
			}
		});
	}
</script>
<body>
	<%@include file="include/headerTop.jsp"%>

	<%@include file="include/headerMenu.jsp"%>

	<%@include file="include/sideMenu.jsp"%>

	<!--**********************************
            Content body start
        ***********************************-->
	<div class="container">
		<br>
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">상품 일괄 등록</h4>
						<br> <input type="file" id="excelFile" value="" accept=".xls">
						<button class="btn mb-1 btn-rounded btn-info"
							onclick="fileUpload();">업로드</button>
						<br> <br>
						<div class="table-responsive">
							<table class="table header-border table-hover verticle-middle">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Product</th>
										<th scope="col">Popularity</th>
										<th scope="col">Sales</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<td>Air Conditioner</td>
										<td>
											<div class="progress" style="height: 10px">
												<div class="progress-bar gradient-1" style="width: 70%;"
													role="progressbar">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</td>
										<td><span class="label gradient-1 btn-rounded">70%</span>
										</td>
									</tr>
									<tr>
										<th>2</th>
										<td>Textiles</td>
										<td>
											<div class="progress" style="height: 10px">
												<div class="progress-bar gradient-2" style="width: 70%;"
													role="progressbar">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</td>
										<td><span class="label btn-rounded gradient-2">70%</span>
										</td>
									</tr>
									<tr>
										<th>3</th>
										<td>Milk Powder</td>
										<td>
											<div class="progress" style="height: 10px">
												<div class="progress-bar gradient-3" style="width: 70%;"
													role="progressbar">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</td>
										<td><span class="label btn-rounded gradient-3">70%</span>
										</td>
									</tr>
									<tr>
										<th>4</th>
										<td>Vehicles</td>
										<td>
											<div class="progress" style="height: 10px">
												<div class="progress-bar gradient-8" style="width: 70%;"
													role="progressbar">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</td>
										<td><span class="label gradient-8 btn-rounded">70%</span>
										</td>
									</tr>
									<tr>
										<th>5</th>
										<td>Boats</td>
										<td>
											<div class="progress" style="height: 10px">
												<div class="progress-bar gradient-1" style="width: 70%;"
													role="progressbar">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</td>
										<td><span class="label gradient-1 btn-rounded">70%</span>
										</td>
									</tr>
								</tbody>
							</table>
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