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
			success : function(data) {
				var obj = data.result;
				var userList = "";

				for (var i = 0; i < obj.length; i++) {
					userList += "<tr>";
					userList += "<td>";
					userList += obj[i].u_id;
					userList += "</td>";
					userList += "<td>" + obj[i].u_phone + "</td>";
					userList += "<td><span>" + obj[i].u_name + "</span></td>";
					userList += "<td><span>" + obj[i].u_birth + "</span></td>";
					userList += "<td><span>" + obj[i].u_address
							+ "</span></td>";
					userList += "<td><span>" + obj[i].u_date
							+ "</span></td></tr>";
				}
				$("#userList").html(userList);
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