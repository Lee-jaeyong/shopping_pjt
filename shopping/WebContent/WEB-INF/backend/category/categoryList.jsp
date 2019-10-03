<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../include/pageMeta.jsp"%>
<script>
	function showCsCategory(category) {
		$
				.ajax({
					url : "./GetCsCategoryListServlet",
					type : "post",
					dataType : "json",
					data : {
						"category" : category.value
					},
					success : function(data) {
						var obj = data.result;
						var categoryArea = "<select class='form-control' id='val-skill' name='val-skill'>";
						if (obj.length != 0) {
							for (var i = 0; i < obj.length; i++) {
								categoryArea += "<option>" + obj[i].value + "("
										+ obj[i].count + ")</option>";
							}
							categoryArea += "</select>";
						} else {
							categoryArea += "<option>*카테고리 항목이 존재하지 않습니다.</option>";
						}
						$("#CscategoryArea").html(categoryArea);
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
						categoryArea += "<option value='1'>카테고리를 선택하세요</option>";
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
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="form-group row">
								<div class="col-lg-6">
									<h3>
										<label class="col-lg-4 col-form-label" for="val-skill">대
											카테고리 </label>
									</h3>
									<div id="categoryArea">
										<select class="form-control" id="val-skill" name="val-skill">
										</select>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-6">
									<h3>
										<label class="col-lg-4 col-form-label" for="val-skill">소
											카테고리 </label>
									</h3>
									<div id="CscategoryArea">
										<select class="form-control" id="val-skill" name="val-skill">
										</select>
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