<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../include/pageMeta.jsp"%>
<script>
	function categoryClick(value) {
		$("#categoryClick").val(value);
	}

	function add_category() {
		var ckind = parseInt($("#val-skill").val());
		if ($("#categoryClick").val() == 0 && $("#c_category").val() == '') {
			alert("(대)카테고리를 입력해주세요");
			return;
		} else if ($("#categoryClick").val() == 1
				&& ($("#cs_category").val() == '' || ckind == -1)) {
			if (ckind == -1)
				alert("(대)해당하는 카테고리를 선택해주세요");
			else
				alert("(소)카테고리를 입력해주세요");
			return;
		}
		var name;
		if ($("#categoryClick").val() == 0)
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
				alert("카테고리 등록 완료");
				location.href = './adminCategoryList.do';
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
								<div class="p-t-15" onclick="categoryClick(0);">
									<div class="col-lg-6">
										<div class="form-group">
											<h5>(대)카테고리</h5>
											<input type="text" id="c_category" name=""
												class="form-control">
										</div>
										<button type="button"
											onclick="add_category(); showCategory();"
											class="btn mb-1 btn-secondary btn-block">등 록</button>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="profile">
								<div class="p-t-15" onclick="categoryClick(1);">
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
											class="btn mb-1 btn-secondary btn-block">등 록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="categoryClick" value="0" />
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