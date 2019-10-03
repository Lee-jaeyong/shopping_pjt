<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@include file="../include/pageMeta.jsp"%>
<script>
	function fileUpload() {
		$.ajax({
			url : "./ExcelUploadServlet",
			type : "post",
			data : {
				"path" : $("#excelFile").val()
			},
			success : function(data) {
			}
		});
	}

	function showExcelData() {
		$.ajax({
			url : "./ShowExcelDataServlet",
			type : "post",
			data : {
				"path" : $("#excelFile").val()
			},
			dataType : "json",
			success : function(data) {
				var obj = data.result;
				var section = "";
				for (var i = 0; i < obj.length; i++) {
					section += "<tr>";
					section += "<td>" + obj[i].i_name + "</td>";
					section += "<td>" + obj[i].c_category + "</td>";
					section += "<td>" + obj[i].cs_category + "</td>";
					section += "<td>" + obj[i].i_price + "</td>";
					section += "<td>" + obj[i].i_main + "</td>";
					section += "<td>" + obj[i].i_detail + "</td>";
					section += "<td>" + obj[i].i_info + "</td>";
					section += "</tr>";
				}
				$("#sectionTableBody").html(section);
			}
		});
	}
</script>
<body>
	<%@include file="../include/headerTop.jsp"%>

	<%@include file="../include/headerMenu.jsp"%>

	<%@include file="../include/sideMenu.jsp"%>

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
						<br> <input type="file" id="excelFile" value=""
							accept=".xlsx" onchange="showExcelData();">
						<button class="btn mb-1 btn-rounded btn-info" data-toggle='modal'
							data-target='.bd-example-modal-sm' onclick="fileUpload();">업로드</button>
						<br> <br>
						<div class="table-responsive">
							<table class="table header-border table-hover verticle-middle">
								<thead>
									<tr>
										<th scope="col">상품명</th>
										<th scope="col">대분류</th>
										<th scope="col">소분류</th>
										<th scope="col">가격</th>
										<th scope="col">대표이미지</th>
										<th scope="col">상세이미지</th>
										<th scope="col">상품 정보</th>
									</tr>
								</thead>
								<tbody id="sectionTableBody">
								</tbody>
							</table>
						</div>
						<div class="modal fade bd-example-modal-sm" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">상품 일괄 등록</h5>
										<button type="button" class="close" data-dismiss="modal">
											<span>&times;</span>
										</button>
									</div>
									<div class="modal-body">상품을 일괄등록 했습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal" onclick="location.href='./adminItemlist.do'">Close</button>
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
	<%@include file="../include/footer.jsp"%>
	<!--**********************************
        Main wrapper end
    ***********************************-->
	<%@include file="../include/script.html"%>
</body>

</html>