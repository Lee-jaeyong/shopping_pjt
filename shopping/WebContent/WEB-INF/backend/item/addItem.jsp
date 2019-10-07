<%@page import="shopping.backend.DTO.CategoryDTO"%>
<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<CategoryDTO> list = (ArrayList<CategoryDTO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<%@include file="../include/pageMeta.jsp"%>
<script type="text/javascript">
	function cs_category_list() {
		$
				.ajax({
					url : "./GetCsCategoryList_AddItem",
					type : "POST",
					dataType : "json",
					data : {
						"category" : $("#c_category").val()
					},
					success : function(data) {
						var html = "";
						html += "<select class='form-control' id='cs_category' name='cs_category'>";
						html += "<option value='0'>(소)분류</option>";
						for (var i = 0; i < data.result.length; i++) {
							html += "<option value='"+data.result[i].idx+"'>"
									+ data.result[i].value + "</option>";
						}
						html += "</select>";
						$("#cs_categoryArea").html(html);
					}
				});
	}

	function changeMainImg(input, kind) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				if (kind == 'top')
					$("#mainImg").attr("src", e.target.result);
				else
					$("#detailImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function checkInput() {
		if ($("#i_name").val() == "") {
			alert("상품명을 등록해주세요");
			$("#i_name").focus();
		} else if ($("#i_price").val() == "") {
			alert("상품 가격을 등록해주세요");
			$("#i_price").focus();
		} else if ($("#i_price").val() == "") {
			alert("상품 가격을 등록해주세요");
			$("#i_price").focus();
		} else if (isNaN($("#i_price").val())) {
			alert("가격이 잘못 입력되었습니다.");
			$("#i_price").focus();
		} else if ($("#c_category").val() == "0"
				|| $("#cs_category").val() == "0") {
			alert("상품 카테고리를 등록해주세요");
			$("#c_category").focus();
		} else if ($("#mainImgVal").val() == "") {
			alert("상품 대표이미지를 등록해주세요");
			$("#mainImgVal").focus();
		} else if ($("#detailImgVal").val() == "") {
			alert("상품 상세페이지를 등록해주세요");
			$("#detailImgVal").focus();
		} else if ($("#checkAdd").is(":checked") == false) {
			alert("상품 등록 동의를 체크해주세요");
			$("#checkAdd").focus();
		} else {
			$("#addItem").submit();
			alert("등록 완료");
		}
	}
</script>
<body>
	<%@include file="../include/headerTop.jsp"%>

	<%@include file="../include/headerMenu.jsp"%>

	<%@include file="../include/sideMenu.jsp"%>

	<!--**********************************
            Content body start
        ***********************************-->
	<br>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="form-validation">
							<form id="addItem" class="form-valide" action="./addItem.do"
								method="post">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">상품
										명 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="i_name"
											name="i_name">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-email">가
										격 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="i_price"
											name="i_price">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-suggestions">상품
										정보 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<textarea class="form-control" id="val-suggestions"
											name="i_info" rows="5"></textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-skill">분
										류 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-3">
										<select class="form-control" id="c_category" name="c_category"
											onchange="cs_category_list();">
											<option value="0">(대)분류</option>
											<%
												for (int i = 0; i < list.size(); i++) {
											%>
											<option value="<%=list.get(i).getC_idx()%>"><%=list.get(i).getC_name()%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-lg-3" id="cs_categoryArea">
										<select class="form-control" id="cs_category"
											name="cs_category">
											<option value="0">(소)분류</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-phoneus">대표
										이미지<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input id="mainImgVal" type="file" name="mainImg"
											onchange="changeMainImg(this,'top');"
											accept=".img, .gif, .png">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-number">설정
										이미지 <span class="text-danger">*</span>
									</label> <img id="mainImg" class="card-body col-lg-6" alt=""
										src="backend/images/defaultImg.png"
										style="width: 100px; height: 500px;" />
								</div>
								<br>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-phoneus">(대표)상세
										페이지 등록<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="file" id="detailImgVal" name="detailImg"
											onchange="changeMainImg(this,'bottom');"
											accept=".img, .gif, .png">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-number">(상세)설정
										이미지 <span class="text-danger">*</span>
									</label> <img id="detailImg" class="card-body col-lg-6" alt=""
										src="backend/images/camera.png"
										style="width: 100px; height: 1000px;" />
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label"><span
										class="text-danger">*</span> </label>
									<div class="col-lg-8">
										<label class="css-control css-control-primary css-checkbox"
											for="val-terms"> <input type="checkbox"
											class="css-control-input" id="checkAdd" name="val-terms"
											value="true"> <span class="css-control-indicator"></span>
											상품을 등록합니다.
										</label>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-8 ml-auto">
										<button type="button" class="btn btn-primary"
											onclick="checkInput();">상품 등록</button>
									</div>
								</div>
							</form>
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