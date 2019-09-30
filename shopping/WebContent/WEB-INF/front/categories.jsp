<%@page import="shopping.DTO.Sh_itemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="include/pageMeta.html"%>
<link rel="stylesheet" type="text/css"
	href="front/styles/categories_styles.css">
<link rel="stylesheet" type="text/css"
	href="front/styles/categories_responsive.css">
</head>

<body>

	<div class="super_container">

		<!-- Header -->

		<%@include file="include/header.html"%>

		<%@include file="include/menu.html"%>

		<div class="container product_section_container">
			<div class="row">
				<div class="col product_section clearfix">

					<!-- Breadcrumbs -->

					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li class="active"><a href="index.html"><i
									class="fa fa-angle-right" aria-hidden="true"></i>Men's</a></li>
						</ul>
					</div>

					<!-- Sidebar -->

					<div class="sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h5>Product Category</h5>
							</div>
							<ul class="sidebar_categories">
								<li><a href="#">Men</a></li>
								<li class="active"><a href="#"><span><i
											class="fa fa-angle-double-right" aria-hidden="true"></i></span>Women</a></li>
								<li><a href="#">Accessories</a></li>
								<li><a href="#">New Arrivals</a></li>
								<li><a href="#">Collection</a></li>
								<li><a href="#">Shop</a></li>
							</ul>
						</div>

						<!-- Price Range Filtering -->
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h5>Filter by Price</h5>
							</div>
							<p>
								<input type="text" id="amount" readonly
									style="border: 0; color: #f6931f; font-weight: bold;">
							</p>
							<div id="slider-range"></div>
							<div class="filter_button">
								<span>filter</span>
							</div>
						</div>

						<!-- Sizes -->
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h5>Sizes</h5>
							</div>
							<ul class="checkboxes">
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>S</span></li>
								<li class="active"><i class="fa fa-square"
									aria-hidden="true"></i><span>M</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>L</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>XL</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>XXL</span></li>
							</ul>
						</div>

						<!-- Color -->
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h5>Color</h5>
							</div>
							<ul class="checkboxes">
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Black</span></li>
								<li class="active"><i class="fa fa-square"
									aria-hidden="true"></i><span>Pink</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>White</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Blue</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Orange</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>White</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Blue</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Orange</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>White</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Blue</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Orange</span></li>
							</ul>
							<div class="show_more">
								<span><span>+</span>Show More</span>
							</div>
						</div>

					</div>

					<!-- Main Content -->

					<div class="main_content">

						<!-- Products -->
						<%
							ArrayList<Sh_itemDTO> list = (ArrayList<Sh_itemDTO>) request.getAttribute("list");
							int totalPage = (int) request.getAttribute("totalPage");
						%>
						
						<input type="hidden" id="pageNum" value="0" /> <input
							type="hidden" id="showNum" value="12" /> <input type="hidden"
							id="pageNum" />
						<div class="products_iso">
							<div class="row">
								<div class="col">

									<!-- Product Sorting -->

									<div
										class="product_sorting_container product_sorting_container_top">
										<ul class="product_sorting">
											<li><span class="type_sorting_text">Default
													Sorting</span> <i class="fa fa-angle-down"></i>
												<ul class="sorting_type">
													<li class="type_sorting_btn"
														data-isotope-option='{ "sortBy": "original-order" }'><span>Default
															Sorting</span></li>
													<li class="type_sorting_btn"
														data-isotope-option='{ "sortBy": "price" }'><span>Price</span></li>
													<li class="type_sorting_btn"
														data-isotope-option='{ "sortBy": "name" }'><span>Product
															Name</span></li>
												</ul></li>
											<li><span>Show</span> <span class="num_sorting_text">6</span>
												<i class="fa fa-angle-down"></i>
												<ul class="sorting_num">
													<li class="num_sorting_btn"><span>6</span></li>
													<li class="num_sorting_btn"><span>12</span></li>
													<li class="num_sorting_btn"><span>24</span></li>
												</ul></li>
										</ul>
										<div class="pages d-flex flex-row align-items-center">
											<div class="page_current">
												<span>1</span>
												<ul class="page_selection">
													<li><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
												</ul>
											</div>
											<div class="page_total">
												<span>of</span> 3
											</div>
											<div id="next_page" class="page_next">
												<a href="#"><i class="fa fa-long-arrow-right"
													aria-hidden="true"></i></a>
											</div>
										</div>

									</div>

									<!-- Product Grid -->

									<div class="product-grid">

										<!-- Product 1 -->
										<%
											for (int i = 0; i < list.size(); i++) {
										%>

										<div class="product-item men">
											<div class="product discount product_filter">
												<div class="product_image">
													<img src="<%=list.get(i).getMainImg()%>" alt="" style="height: 250px;">
												</div>
												<div class="favorite favorite_left"></div>
												<!-- 세일표시부분
												<div
													class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
													<span>-$20</span>
												</div>
												 -->
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html"><%=list.get(i).getI_name()%></a>
													</h6>
													<div class="product_price">
														<%
															NumberFormat nf = NumberFormat.getInstance();
																String price = nf.format(list.get(i).getI_price());
														%>
														₩ <%=price%>
														<!-- $520.00<span>$590.00</span> -->
													</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
										</div>
										<%
											}
										%>
									</div>

									<!-- Product Sorting -->

									<div
										class="product_sorting_container product_sorting_container_bottom clearfix">
										<ul class="product_sorting">
											<li><span>Show:</span> <span class="num_sorting_text">04</span>
												<i class="fa fa-angle-down"></i>
												<ul class="sorting_num">
													<li class="num_sorting_btn"><span>01</span></li>
													<li class="num_sorting_btn"><span>02</span></li>
													<li class="num_sorting_btn"><span>03</span></li>
													<li class="num_sorting_btn"><span>04</span></li>
												</ul></li>
										</ul>
										<span class="showing_results">Showing 1–3 of 12 results</span>
										<div class="pages d-flex flex-row align-items-center">
											<div class="page_current">
												<span>1</span>
												<ul class="page_selection">
													<%
														for (int i = 0; i < totalPage; i++) {
													%>
													<li><a href="category.do?pageNum=<%=i%>"><%=i + 1%></a></li>
													<%
														}
													%>
												</ul>
											</div>
											<div class="page_total">
												<span>of</span>
												<%=totalPage%>
											</div>
											<div id="next_page_1" class="page_next">
												<a href="#"><i class="fa fa-long-arrow-right"
													aria-hidden="true"></i></a>
											</div>
										</div>

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
	<script src="front/js/categories_custom.js"></script>
</body>

</html>
