<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Quixlab - Bootstrap Admin Dashboard Template by
	Themefisher.com</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../../assets/images/favicon.png">
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
<link href="./backend/css/style.css" rel="stylesheet">

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function inputCheck() {
		if ($("#id").val() == "" && $("#pw").val() != "") {
			$("#idError").html("아이디를 입력해주세요.");
			$("#pwError").html("");
			$("#id").focus();
		} else if ($("#id").val() != "" && $("#pw").val() == "") {
			$("#pwError").html("비밀번호를 입력해주세요.");
			$("#idError").html("");
			$("#pw").focus();
		} else if ($("#id").val() == "" && $("#pw").val() == "") {
			$("#idError").html("아이디를 입력해주세요.");
			$("#pwError").html("");
			$("#id").focus();
		} else {
			$("#loginForm").attr("action", "./login.do").attr("method",
					"post").submit();
		}

	}
</script>
<body class="h-100">

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->

	<%
		if (request.getParameter("id") != null) {
	%>
	<script type="text/javascript">
		alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
	</script>
	<%
		}
	%>

	<div class="login-form-bg h-100">
		<div class="container h-100">
			<div class="row justify-content-center h-100">
				<div class="col-xl-6">
					<div class="form-input-content">
						<div class="card login-form mb-0">
							<div class="card-body pt-5">
								<a class="text-center" href="./index.do">
									<h4>로그인</h4>
								</a>

								<form id="loginForm" class="mt-5 mb-5 login-input">
									<div class="form-group">
										<input type="text" id="id" class="form-control" name="id"
											placeholder="아이디"><span id="idError"></span>
									</div>
									<div class="form-group">
										<input type="password" name="pw" id="pw" class="form-control"
											placeholder="비밀번호"><span id="pwError"></span>
									</div>
									<input type="button" id="loginBtn"
										class="btn login-form__btn submit w-100"
										onClick="inputCheck();" value="로그인" />
								</form>
								<p class="mt-5 login-form__footer">
									Dont have account? <a href="./join.do" class="text-primary">Sign
										Up</a> now
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!--**********************************
        Scripts
    ***********************************-->
	<script src="./backend/plugins/common/common.min.js"></script>
	<script src="./backend/js/custom.min.js"></script>
	<script src="./backend/js/settings.js"></script>
	<script src="./backend/js/gleek.js"></script>
	<script src="./backend/js/styleSwitcher.js"></script>
</body>
</html>





