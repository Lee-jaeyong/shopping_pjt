<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="include/pageMeta.jsp"%>
<script type="text/javascript">
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
</script>
<body>
	<%@include file="include/headerTop.jsp"%>

	<%@include file="include/headerMenu.jsp"%>

	<%@include file="include/sideMenu.jsp"%>

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
							<form class="form-valide" action="./addItem.do" method="post"
								onsubmit="alert('상품 등록 완료');">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">상품
										명 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="val-username"
											name="i_name">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-email">가
										격 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="val-email"
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
										<select class="form-control" id="val-skill" name="c_category">
											<option value="">(대)분류</option>
											<option value="1">상의</option>
										</select>
									</div>
									<div class="col-lg-3">
										<select class="form-control" id="val-skill" name="cs_category">
											<option value="">(소)분류</option>
											<option value="1">가디건</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-phoneus">대표
										이미지<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input id="mainImgVal" type="file" name="mainImg"
											onchange="changeMainImg(this,'top');" accept="image/*">
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
										<input type="file" name="detailImg"
											onchange="changeMainImg(this,'bottom');">
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
											class="css-control-input" id="val-terms" name="val-terms"
											value="1"> <span class="css-control-indicator"></span>
											I agree to the terms
										</label>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-8 ml-auto">
										<button type="submit" class="btn btn-primary">상품 등록</button>
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
	<%@include file="include/footer.jsp"%>
	<!--**********************************
        Main wrapper end
    ***********************************-->
	<%@include file="include/script.html"%>
</body>

</html>