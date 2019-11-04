<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@include file="../include/pageMeta.jsp"%>
<script>
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function excelDownload() {
		location.href = "./ExcelFile.jsp";
	}

	function showCount() {
		var showType = $("#showCount").val();
		$("#showType").val(showType);
		pageMove(0);
	}

	function sortType() {
		var sortType = $("#sort").val();
		$("#sortType").val(sortType);
		pageMove(0);
	}

	function searchItem() {
		pageMove(0);
	}

	function showStock(i_idx){
		$.ajax({
			url : "./getItemStockServlet",
			data : {"data" : i_idx},
			dataType : "json",
			success : function(data){
				alert(data);
			}
		});
	}
	
	function pageMove(pageNum) {
		$("#pageNum").val(pageNum);
		var page = pageNum;
		var search = $("#search").val();
		var sortType = $("#sortType").val();
		var showType = $("#showType").val();
		$.ajax({
					url : "./getListServlet",
					type : "POST",
					dataType : "json",
					data : {
						"pageNum" : page,
						"search" : search,
						"sortType" : sortType,
						"showType" : showType
					},
					success : function(data) {
						var obj = data;
						var listArea = "";
						var btnArea = "";

						if (obj.result.length == 0) {
							listArea += "<tr>";
							listArea += "<td colspan='9'>* 등록된 상품이 존재하지 않습니다.</td>";
							listArea += "</tr>";
						} else {
							for (var i = 0; i < obj.result.length; i++) {
								listArea += "<tr>";
								listArea += "<td width='50px;'><img src='"+obj.result[i].img_path+"' style='width:70px; height:50px;'/></td>";
								listArea += "<td>" + obj.result[i].idx
										+ "</td>";

								var name = obj.result[i].name;
								name = name.substr(0, name.indexOf(search))
										+ "<span style='background-color:yellow;'>"
										+ search
										+ "</span>"
										+ name.substr(name.indexOf(search)
												+ search.length, name.length);

								listArea += "<td>" + name + "</td>";
								listArea += "<td>" + obj.result[i].c_category
										+ "</td>";
								listArea += "<td>" + obj.result[i].cs_cateogry
										+ "</td>";
								listArea += "<td>￦"
										+ numberWithCommas(obj.result[i].price)
										+ "</td>";
								listArea += "<td>" + obj.result[i].hit
										+ "</td>";
								listArea += "<td>" + obj.result[i].date
										+ "</td>";
								listArea += "<td><button type='button' data-toggle='modal' data-target='#myModal' class='btn btn-outline-dark'>재고 수정</td>";
								listArea += "<td><button type='button' class='btn btn-outline-dark' onclick='modifyItem("
										+ obj.result[i].idx + ")'>수정</td>";
								listArea += "<td><button type='button' class='btn btn-outline-danger' onclick='deleteItem("
										+ obj.result[i].idx + ")'>삭제</td>";
								listArea += "</tr>";
							}

							btnArea += "<button type='button' class='btn btn-primary ";
							if (obj.startBlock == 0)
								btnArea += "disabled'><</button>";
							else
								btnArea += "' onclick='pageMove("
										+ (parseInt(obj.startBlock) - parseInt($(
												"#showType").val()))
										+ ")'><</button>";

							for (var i = parseInt(obj.startBlock); i < parseInt(obj.endBlock); i++) {
								btnArea += "<button onclick='pageMove("
										+ i
										+ ")' type='button' class='btn btn-primary";
								if (i == page)
									btnArea += "disabled";
								btnArea += "'>" + (parseInt(i) + 1)
										+ "</button>";
							}

							btnArea += "<button type='button' class='btn btn-primary ";
							if (obj.endBlock == obj.totalBlock)
								btnArea += "disabled'>></button>";
							else
								btnArea += "' onclick='pageMove("
										+ (parseInt(obj.startBlock) + parseInt($(
												"#showType").val()))
										+ ")'>></button>";
						}
						$("#listArea").html(listArea);
						$("#blockArea").html(btnArea);
					},
					error : function(data,a,b){
						alert(a);
					}
				});
	}
	function deleteItem(i_idx) {
		if (confirm("정말 삭제하시겠습니까?"))
			$.ajax({
				url : "./ItemDeleteServlet",
				data : {
					"item_idx" : i_idx,
				},
				success : function(data) {
					if (data == 'true') {
						pageMove(0);
					} else
						alert("삭제 도중 문제가 발생했습니다.");
				}
			});
	}

	function modifyItem(i_idx) {
		$("#modify").val(i_idx);
		$("#modifyForm").submit();
	}

	window.onload = function() {
		pageMove(0);
	}
</script>
<body>
	<%@include file="../include/headerTop.jsp"%>

	<%@include file="../include/headerMenu.jsp"%>

	<%@include file="../include/sideMenu.jsp"%>

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
								<div class="col-sm-4">
									<input type="search" class="form-control" placeholder="Search"
										id="search" aria-label="Search Dashboard"
										onkeyup="searchItem();">
								</div>
								<div class="col-sm-3">
									<select class="form-control form-white" id="sort"
										data-placeholder="Choose a color..." name="category-color"
										onchange="sortType();">
										<option value="i_idx" disabled="disabled" selected="selected">정렬</option>
										<option value="i_idx">번호순</option>
										<option value="i_name">이름순</option>
										<option value="i_price">가격순</option>
										<option value="c_categoryName">(대)분류</option>
										<option value="cs_categoryName">(소)분류</option>
										<option value="i_date">등록일순</option>
									</select>
								</div>
								<div class="col-sm-2">
									<select class="form-control form-white" id="showCount"
										data-placeholder="Choose a color..." name="category-color"
										onchange="showCount();">
										<option value="" disabled="disabled" selected="selected">보기</option>
										<option value="5">5개</option>
										<option value="10">10개</option>
										<option value="20">20개</option>
										<option value="30">30개</option>
										<option value="50">50개</option>
									</select>
								</div>
								<div class="col-sm-1">
									<button type="button" class="btn btn-success"
										onclick="excelDownload();">엑셀 다운로드</button>
								</div>
							</div>
							<br>
							<div class="table-responsive">
								<table
									class="table table-striped table-bordered zero-configuration">
									<thead>
										<tr>
											<th>상품 이미지</th>
											<th>상품 번호</th>
											<th>상품</th>
											<th>대분류</th>
											<th>소분류</th>
											<th>가격</th>
											<th>조회수</th>
											<th>상품 등록일</th>
											<th></th>
											<th></th>
											<th></th>
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
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">Default</span>
						</div>
						<input type="text" class="form-control" value="">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">재고
						수정</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
				</div>

			</div>
		</div>
	</div>
	<input type="hidden" id="pageNum" value="" />
	<input type="hidden" id="sortType" value="" />
	<input type="hidden" id="showType" value="5" />
	<form id="modifyForm" action="./modifyItem.do" method="post">
		<input type="hidden" name="i_idx" id="modify" value="" />
	</form>

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