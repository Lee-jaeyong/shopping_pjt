<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../include/pageMeta.jsp"%>
<script>
	function add_category() {
		var ckind = parseInt($("#val-skill").val());
		var name;
		if (ckind == -1)
			name = $("#c_category").val();
		else
			name = $("#cs_category").val();
		$.ajax({
			url : "./AddCategoryServlet",
			type : "post",
			data : {
				"category" : name,
				"ckind" : ckind,
			},
			success : function(data) {
			}
		});
	}

	function showCategory() {
		$
				.ajax({
					url : "./GetCategoryListServlet",
					dataType : "json",
					success : function(data) {
						var obj = data.result;
						var categoryArea = "<select onchange='showCsCategory(this)' class='form-control' id='val-skill' name='val-skill'>";
						categoryArea += "<option value='-1'>카테고리를 선택하세요</option>";
						for (var i = 0; i < obj.length; i++) {
							categoryArea += "<option value='"+obj[i].c_idx+"'>"
									+ obj[i].value + "(" + obj[i].count
									+ ")</option>";
						}
						categoryArea += "</select>";
						$("#categoryArea").html(categoryArea);
					}
				});
	}

	window.onload = function() {
		showCategory();
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
		<div class="container-fluid mt-3">
			<h2>카테고리 추가</h2>
			<br>
			<div class="row">
				<div class="card-body">
					<!-- Nav tabs -->
					<div class="default-tab">
						<ul class="nav nav-tabs mb-3" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#home">(대)카테고리</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#profile">(소)카테고리</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="home" role="tabpanel">
								<div class="p-t-15">
									<div class="col-lg-6">
										<div class="form-group">
											<h5>(대)카테고리</h5>
											<input type="text" id="c_category" name=""
												class="form-control">
										</div>
										<button type="button"
											onclick="add_category(); showCategory();"
											class="btn mb-1 btn-secondary btn-block" data-toggle='modal'
											data-target='.bd-example-modal-sm'>등 록</button>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="profile">
								<div class="p-t-15">
									<div class="col-lg-6">
										<div class="form-group">
											<h5>(소)카테고리</h5>
											<input type="text" id="cs_category" name="confirmPassword"
												class="form-control">
										</div>
										<div id="categoryArea"></div>
										<br />
										<button type="button"
											onclick="add_category(); showCategory();"
											class="btn mb-1 btn-secondary btn-block" data-toggle='modal'
											data-target='.bd-example-modal-sm'>등 록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">카테고리 등록</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">카테고리가 등록되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal"
						onclick="location.href='./adminCategoryList.do'">Close</button>
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