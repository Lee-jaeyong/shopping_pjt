<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<br>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="form-validation">
							<form class="form-valide" action="#" method="post">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-username">상품
										명 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="val-username"
											name="val-username">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-email">가
										격 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="val-email"
											name="val-email">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-suggestions">상품
										정보 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<textarea class="form-control" id="val-suggestions"
											name="val-suggestions" rows="5"></textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-skill">분
										류 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-3">
										<select class="form-control" id="val-skill" name="val-skill">
											<option value="">(대)분류</option>
											<option value="html">HTML</option>
											<option value="css">CSS</option>
											<option value="javascript">JavaScript</option>
											<option value="angular">Angular</option>
											<option value="angular">React</option>
										</select>
									</div>
									<div class="col-lg-3">
										<select class="form-control" id="val-skill" name="val-skill">
											<option value="">(소)분류</option>
											<option value="html">HTML</option>
											<option value="css">CSS</option>
											<option value="javascript">JavaScript</option>
											<option value="angular">Angular</option>
											<option value="angular">React</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-phoneus">대표
										이미지<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="file">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-number">설정
										이미지 <span class="text-danger">*</span>
									</label> <img class="card-body col-lg-6" alt=""
										src="backend/images/paypal.png" />
								</div>
								<br>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-phoneus">(대표)상세
										페이지 등록<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="file">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-number">(상세)설정
										이미지 <span class="text-danger">*</span>
									</label> <img class="card-body col-lg-6" alt=""
										src="backend/images/paypal.png" />
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