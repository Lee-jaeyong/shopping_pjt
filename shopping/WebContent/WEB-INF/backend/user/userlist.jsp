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
		pageMove(0);
	}

	function pageMove(pageNum) {
		$("#pageNum").val(pageNum);
		var page = pageNum;
		var search = $("#searchUser").val();
		var sortType = $("#sortType").val();
		var showType = $("#showType").val();
		$
				.ajax({
					url : "./GetUserListServlet",
					type : "POST",
					dataType : "json",
					data : {
						"pageNum" : pageNum,
						"search" : search,
						"sortType" : sortType,
						"showType" : showType
					},
					success : function(data) {
						var obj = data.result;
						var startBlock = parseInt(data.startBlock);
						var endBlock = parseInt(data.endBlock);
						var totalBlock = parseInt(data.totalBlock);
						var userList = "";
						var btnArea = "";

						if (endBlock != 0) {
							for (var i = 0; i < obj.length; i++) {
								userList += "<tr>";
								userList += "<td>";
								userList += obj[i].u_id;
								userList += "</td>";
								userList += "<td>" + obj[i].u_phone + "</td>";
								userList += "<td><span>" + obj[i].u_name
										+ "</span></td>";
								userList += "<td><span>" + obj[i].u_birth
										+ "</span></td>";
								userList += "<td><span>" + obj[i].u_address
										+ "</span></td>";
								userList += "<td><span>" + obj[i].u_date
										+ "</span></td></tr>";
							}

							if (startBlock != 0)
								btnArea += "<button type='button' class='btn btn-primary'>";
							else
								btnArea += "<button type='button' class='btn btn-primary disabled'>";
							btnArea += "<</button>";
							for (var i = startBlock; i < endBlock; i++) {
								if (i == $("#pageNum").val())
									btnArea += "<button type='button' class='btn btn-primary disabled'>";
								else
									btnArea += "<button type='button' class='btn btn-primary' onclick='pageMove("
											+ i + ")'>";
								btnArea += i + 1;
								btnArea += "</button>";
							}

							if (endBlock != totalBlock)
								btnArea += "<button type='button' class='btn btn-primary'>";
							else
								btnArea += "<button type='button' class='btn btn-primary disabled'>";
							btnArea += "></button>";

							$("#btnArea").html(btnArea);
						} else {
							userList += "<td colspan='6'>* 등록된 회원 정보가 존재하지 않습니다.</td>";
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
						<br>
						<div class="input-group icons col-sm-6">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
									id="basic-addon1"><i class="mdi mdi-magnify"
									style="font-size: 25px;"></i></span>
							</div>
							<div class="col-sm-4">
								<input type="search" class="form-control" placeholder="Search"
									id="searchUser" aria-label="Search Dashboard"
									onkeyup="searchUser();">
							</div>
							<div class="col-sm-3">
								<select class="form-control form-white" id="sort"
									data-placeholder="Choose a color..." name="category-color"
									onchange="sortType();">
									<option value="u_idx" disabled="disabled" selected="selected">정렬</option>
									<option value="u_name">이름순</option>
									<option value="u_date">가입일순</option>
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
								</select>
							</div>
						</div>
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
								<div id="btnArea" class="btn-group mr-2 mb-2"></div>
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