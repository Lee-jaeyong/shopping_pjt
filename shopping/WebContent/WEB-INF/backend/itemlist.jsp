<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@include file="include/pageMeta.jsp"%>
<script>
	function searchItem() {
		$("#pageNum").val(0);
		pageMove(0);
	}

	function pageMove(pageNum) {
		$("#pageNum").val(pageNum);
		var page = pageNum;
		var search = $("#search").val();
		$.ajax({
			url : "./getListServlet",
			type : "POST",
			dataType : "json",
			data : {
				"pageNum" : page,
				"search" : search
			},
			success : function(data) {
				var obj = data;
				var listArea = "";
				var btnArea = "";

				for (var i = 0; i < obj.result.length; i++) {
					listArea += "<tr>";
					listArea += "<td>" + obj.result[i].idx + "</td>";
					listArea += "<td>" + obj.result[i].name + "</td>";
					listArea += "<td>" + obj.result[i].c_category + "</td>";
					listArea += "<td>" + obj.result[i].cs_category + "</td>";
					listArea += "<td>" + obj.result[i].price + "</td>";
					listArea += "<td>" + obj.result[i].img_path + "</td>";
					listArea += "<td>" + obj.result[i].hit + "</td>";
					listArea += "<td>" + obj.result[i].date + "</td>";
					listArea += "</tr>";
				}

				btnArea += "<button type='button' class='btn btn-primary";
				if (obj.startBlock == 0)
					btnArea += "disabled";
				btnArea += "'><</button>";
				
				for (var i = obj.startBlock; i < obj.endBlock; i++) {
					btnArea += "<button onclick='pageMove(" + i
							+ ")' type='button' class='btn btn-primary";
					if (i == page)
						btnArea += "disabled";
					btnArea += "'>" + (parseInt(i) + 1) + "</button>";
				}
				
				btnArea += "<button type='button' class='btn btn-primary";
				if (obj.endBlock == obj.totalBlock)
					btnArea += "disabled";
				btnArea += "'>></button>";
				
				$("#listArea").html(listArea);
				$("#blockArea").html(btnArea);
			}
		});
	}
	window.onload = function() {
		pageMove(0);
	}
</script>
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
							<div class="input-group icons col-sm-6">
								<div class="input-group-prepend">
									<span
										class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
										id="basic-addon1"><i class="mdi mdi-magnify"
										style="font-size: 25px;"></i></span>
								</div>
								<input type="search" class="form-control"
									placeholder="Search Dashboard" id="search"
									aria-label="Search Dashboard" onkeyup="searchItem();">
							</div>
							<br>
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
									<tbody id="listArea">
									</tbody>
								</table>
								<div class="button-group">
									<div class="btn-toolbar">
										<div id="blockArea" class="btn-group mr-2 mb-2"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="pageNum" value="" />
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