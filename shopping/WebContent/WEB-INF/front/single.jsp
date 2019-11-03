<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="shopping.DTO.Sh_itemDTO"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="include/pageMeta.html"%>
<link rel="stylesheet" type="text/css"
	href="front/styles/single_styles.css">
<link rel="stylesheet" type="text/css"
	href="front/styles/single_responsive.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function addCart() {
		if ($("#user").val() == "") {
			alert("로그인이 필요합니다.");
		} else {

			var count = $("#quantity_value").text();
			var user = $("#user").val();
			var i_idx = $("#i_idx").val();
			var color = $("#sel1 option:selected").val();
			var size = $("#sel2 option:selected").val();

			if (color == "defalutColor") {
				alert("색상을 선택해주세요");
			} else if (size == "defalutSize") {
				alert("사이즈를 선택해주세요");
			} else {

				$.ajax({
					url : "addCart.do",
					type : "post",
					data : {
						"count" : count,
						"size" : size,
						"color" : color,
						"i_idx" : i_idx,
						"user" : user
					},
					success : function(data) {
						alert("장바구니에 추가했습니다.");
					}

				});
			}
		}
	}
</script>

<body>
	<%
		String user = "";
		if (session.getAttribute("u_id") != null)
			user = (String) session.getAttribute("u_id");
	%>

	<%
		Sh_itemDTO item = ((Sh_itemDTO) request.getAttribute("item"));
		ArrayList<Sh_itemDTO> colorAndSize = ((ArrayList<Sh_itemDTO>) request.getAttribute("colorAndSize"));
		String price = NumberFormat.getInstance().format(item.getI_price());
	%>
	<input type="hidden" id="i_idx" value="<%=item.getI_idx()%>" />
	<input type="hidden" id="user" value="<%=user%>" />
	<div class="super_container">
		<!-- Header -->
		<%@include file="include/header.html"%>
		<%@include file="include/menu.html"%>

		<div class="container single_product_container">
			<div class="row">
				<div class="col">

					<!-- Breadcrumbs -->

					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="categories.html"><i
									class="fa fa-angle-right" aria-hidden="true"></i>Men's</a></li>
							<li class="active"><a href="#"><i
									class="fa fa-angle-right" aria-hidden="true"></i>Single Product</a></li>
						</ul>
					</div>

				</div>
			</div>

			<div class="row">
				<div class="col-lg-7">
					<div class="single_product_pics">
						<div class="row">
							<div class="col-lg-9 image_col order-lg-2 order-1">
								<div class="single_product_image">
									<img class="single_product_image_background"
										src="<%=item.getMainImg()%>">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="product_details">
						<div class="product_details_title">
							<h2><%=item.getI_name()%></h2>
							<p style="height: 160px;"><%=item.getInfo()%></p>
						</div>
						<div
							class="free_delivery d-flex flex-row align-items-center justify-content-center">
							<span class="ti-truck"></span><span>무료 배송</span>
						</div>

						<div class="product_price" style="padding-top: 50px">
							￦
							<%=price%>원
						</div>
						<div class="product_color">
							<span>색상:</span>
							<div class="form-group">
								<select class="form-control" id="sel1">
									<option value="defalutColor" selected>색상을 선택해주세요</option>
									<%
										for (int i = 0; i < colorAndSize.size(); i++) {
											String color = colorAndSize.get(i).getColor();
											boolean chk = true;
											for (int j = 0; j <= i; j++) {
												if (i != j && color.equals(colorAndSize.get(j).getColor())) {
													chk = false;
													break;
												}
											}
											if (chk == false)
												continue;
									%>
									<option><%=color%></option>
									<%
										}
									%>
								</select>
							</div>
							<span>사이즈:</span>
							<div class="form-group">
								<select class="form-control" id="sel2">
									<option value="defalutSize" selected>사이즈를 선택해주세요</option>
									<%
										for (int i = 0; i < colorAndSize.size(); i++) {
											String size = colorAndSize.get(i).getSize();
											boolean chk = true;
											for (int j = 0; j <= i; j++) {
												if (i != j && size.equals(colorAndSize.get(j).getSize())) {
													chk = false;
													break;
												}
											}
											if (chk == false)
												continue;
									%>
									<option><%=size%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
						<div
							class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
							<span>수량:</span>
							<div class="quantity_selector">
								<span class="minus"><i class="fa fa-minus"
									aria-hidden="true"></i></span> <span id="quantity_value" value="sdf">1</span>
								<span class="plus"><i class="fa fa-plus"
									aria-hidden="true"></i></span>
							</div>
							<div class="red_button add_to_cart_button" style="width: 220px;">
								<a href="javascript:addCart();">장바구니 추가</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Tabs -->

		<div class="tabs_section_container">

			<div class="container">
				<div class="row">
					<div class="col">
						<div class="tabs_container">
							<ul
								class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
								<li class="tab active" data-active-tab="tab_1"><span>Description</span></li>
								<li class="tab" data-active-tab="tab_2"><span>Additional
										Information</span></li>
								<li class="tab" data-active-tab="tab_3"><span>Reviews
										(2)</span></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<!-- Tab Description -->
						<div id="tab_1" class="tab_container active">
							<div class="row">
								<div class="col-lg-5 desc_col">
									<img src="<%=item.getDetailImg() %>" style="width: 1300px;"
										alt="">
								</div>
							</div>
						</div>

						<!-- Tab Additional Info -->
						<div id="tab_2" class="tab_container">
							<div class="row">
								<div class="col additional_info_col">
									<div class="tab_title additional_info_title">
										<h4>Additional Information</h4>
									</div>
									<p>
										COLOR:<span>Gold, Red</span>
									</p>
									<p>
										SIZE:<span>L,M,XL</span>
									</p>
								</div>
							</div>
						</div>
						<!-- Tab Reviews -->
						<div id="tab_3" class="tab_container">
							<div class="row">
								<!-- User Reviews -->
								<div class="col-lg-6 reviews_col">
									<div class="tab_title reviews_title">
										<h4>Reviews (2)</h4>
									</div>
									<!-- User Review -->
									<div
										class="user_review_container d-flex flex-column flex-sm-row">
										<div class="user">
											<div class="user_pic"></div>
											<div class="user_rating">
												<ul class="star_rating">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
												</ul>
											</div>
										</div>
										<div class="review">
											<div class="review_date">27 Aug 2016</div>
											<div class="user_name">Brandon William</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua.</p>
										</div>
									</div>
									<!-- User Review -->
									<div
										class="user_review_container d-flex flex-column flex-sm-row">
										<div class="user">
											<div class="user_pic"></div>
											<div class="user_rating">
												<ul class="star_rating">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
												</ul>
											</div>
										</div>
										<div class="review">
											<div class="review_date">27 Aug 2016</div>
											<div class="user_name">Brandon William</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua.</p>
										</div>
									</div>
								</div>
								<!-- Add Review -->
								<div class="col-lg-6 add_review_col">
									<div class="add_review">
										<form id="review_form" action="post">
											<div>
												<h1>Add Review</h1>
												<input id="review_name" class="form_input input_name"
													type="text" name="name" placeholder="Name*"
													required="required" data-error="Name is required.">
												<input id="review_email" class="form_input input_email"
													type="email" name="email" placeholder="Email*"
													required="required" data-error="Valid email is required.">
											</div>
											<div>
												<h1>Your Rating:</h1>
												<ul class="user_star_rating">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
												</ul>
												<textarea id="review_message" class="input_review"
													name="message" placeholder="Your Review" rows="4" required
													data-error="Please, leave us a review."></textarea>
											</div>
											<div class="text-left text-sm-right">
												<button id="review_submit" type="submit"
													class="red_button review_submit_btn trans_300"
													value="Submit">submit</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Benefit -->
		<div class="benefit">
			<div class="container">
				<div class="row benefit_row">
					<div class="col-lg-3 benefit_col">
						<div class="benefit_item d-flex flex-row align-items-center">
							<div class="benefit_icon">
								<i class="fa fa-truck" aria-hidden="true"></i>
							</div>
							<div class="benefit_content">
								<h6>free shipping</h6>
								<p>Suffered Alteration in Some Form</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 benefit_col">
						<div class="benefit_item d-flex flex-row align-items-center">
							<div class="benefit_icon">
								<i class="fa fa-money" aria-hidden="true"></i>
							</div>
							<div class="benefit_content">
								<h6>cach on delivery</h6>
								<p>The Internet Tend To Repeat</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 benefit_col">
						<div class="benefit_item d-flex flex-row align-items-center">
							<div class="benefit_icon">
								<i class="fa fa-undo" aria-hidden="true"></i>
							</div>
							<div class="benefit_content">
								<h6>45 days return</h6>
								<p>Making it Look Like Readable</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 benefit_col">
						<div class="benefit_item d-flex flex-row align-items-center">
							<div class="benefit_icon">
								<i class="fa fa-clock-o" aria-hidden="true"></i>
							</div>
							<div class="benefit_content">
								<h6>opening all week</h6>
								<p>8AM - 09PM</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Newsletter -->
		<%@include file="include/newsletter.html"%>
		<!-- Footer -->
		<%@include file="include/footer.html"%>
	</div>
	<%@include file="include/script.html"%>
	<script src="front/js/single_custom.js"></script>
</body>

</html>
