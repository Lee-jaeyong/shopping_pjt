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
	<div class="content-body">
		<div class="container-fluid">
			<div class="row">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="col-sm-2"></div>
								<div class="card-body col-sm-10">
									<div class="toolbar" role="toolbar">
										<label>* 상 품 분 류</label><br>
										<div class="btn-group m-b-20">
											<button type="button" class="btn btn-light dropdown-toggle"
												data-toggle="dropdown">
												(대) 분류 <span class="caret m-l-5"></span>
											</button>
											<div class="dropdown-menu">
												<span class="dropdown-header">More Option :</span> <a
													class="dropdown-item" href="javascript: void(0);">Mark
													as Unread</a> <a class="dropdown-item"
													href="javascript: void(0);">Add to Tasks</a> <a
													class="dropdown-item" href="javascript: void(0);">Add
													Star</a> <a class="dropdown-item" href="javascript: void(0);">Mute</a>
											</div>
										</div>
										<div class="btn-group m-b-20">
											<button type="button" class="btn btn-light dropdown-toggle"
												data-toggle="dropdown">
												(소) 분류 <span class="caret m-l-5"></span>
											</button>
											<div class="dropdown-menu">
												<span class="dropdown-header">More Option :</span> <a
													class="dropdown-item" href="javascript: void(0);">Mark
													as Unread</a> <a class="dropdown-item"
													href="javascript: void(0);">Add to Tasks</a> <a
													class="dropdown-item" href="javascript: void(0);">Add
													Star</a> <a class="dropdown-item" href="javascript: void(0);">Mute</a>
											</div>
										</div>
									</div>
									<div class="compose-content mt-5">
										<form action="#">
											<div class="form-group">
												<label>* 상 품 명</label><input type="text"
													class="form-control bg-transparent" placeholder=" To">
											</div>
											<div class="form-group">
												<label>* 가 격</label> <input type="text"
													class="form-control bg-transparent" placeholder=" Subject">
											</div>
											<div class="form-group">
												<label>* 가 격</label> <input type="text"
													class="form-control bg-transparent" placeholder=" Subject">
											</div>
											<div class="form-group">
												<label>* 정 보</label>
												<textarea class="textarea_editor form-control bg-light"
													rows="15" placeholder="Enter text ..."></textarea>
											</div>
										</form>
										<h5 class="m-b-20">
											<i class="fa fa-paperclip m-r-5 f-s-18"></i> Attatchment
										</h5>
										<form action="#" class="dropzone">
											<div class="form-group">
												<div class="fallback">
													<input class="l-border-1" name="file" type="file"
														multiple="multiple">
												</div>
											</div>
										</form>
									</div>
									<div class="text-left m-t-15">
										<button
											class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
											type="button">
											<i class="fa fa-paper-plane m-r-5"></i> Send
										</button>
										<button
											class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"
											type="button">
											<i class="ti-close m-r-5 f-s-12"></i> Discard
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #/ container -->
		</div>
	</div>
	<input type="hidden" id="pageNum" value="" />
	<input type="hidden" id="sortType" value="" />
	<input type="hidden" id="showType" value="5" />

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