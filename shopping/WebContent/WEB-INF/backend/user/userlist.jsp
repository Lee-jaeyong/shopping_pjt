<%@page import="shopping.backend.DTO.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../include/pageMeta.jsp"%>
<script>
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

	function searchUser() {
		$("#pageNum").val(0);
		pageMove(0);
	}

	function pageMove(pageNum) {
		$("#pageNum").val(pageNum);
		var page = pageNum;
		var search = $("#searchUser").val();
		var sortType = $("#sortType").val();
		var showType = $("#showType").val();
		$.ajax({
			url : "./GetUserListServlet",
			type : "POST",
			dataType : "json",
			data : {
				"pageNum" : page,
				"search" : search,
				"sortType" : sortType,
				"showType" : showType
			},
			success : function(data) {
				alert(data);
			}
		});
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
		<div class="container-fluid mt-3">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="active-member">
								<div class="table-responsive">
									<table class="table table-xs mb-0">
										<thead>
											<tr>
												<th>아이디</th>
												<th>휴대폰 번호</th>
												<th>회원 이름</th>
												<th>생년월일</th>
												<th>주소</th>
												<th>가입일</th>
											</tr>
										</thead>
										<tbody id="userList">
											<tr>
												<td><img src="./backend/images/avatar/6.jpg"
													class=" rounded-circle mr-3" alt=""> Megan S.</td>
												<td>Galaxy</td>
												<td><span>Japan</span></td>
												<td>
													<div>
														<div class="progress" style="height: 6px">
															<div class="progress-bar bg-success" style="width: 50%"></div>
														</div>
													</div>
												</td>
												<td><i class="fa fa-circle-o text-success  mr-2"></i>
													Paid</td>
												<td><span>Last Login</span> <span class="m-0 pl-3">10
														sec ago</span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="showType" value="10">
	<input type="hidden" id="sort" value="">
	<input type="hidden" id="searchUser" value="">
	<input type="hidden" id="pageNum" value="">

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