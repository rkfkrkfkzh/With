<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>With: 모두 함께</title>
<c:import url="./head.jsp"></c:import>
<link href="${pageContext.request.contextPath}/static/css/index.css"
	rel="stylesheet" />
<script>
	$(document).ready(function() {
		$("#pAdd")
				.click(
						function() {
							if ("${sessionScope.id}" == ""
									|| "${sessionScope.id}" == null) {
								alert("로그인을 해주세요.");
								location.href = "${pageContext.request.contextPath}/member/login";
							} else {
								location.href = "${pageContext.request.contextPath}/product/add";
							}
						});
		
		 $('[data-toggle="popover"]' ).popover({ delay: { "show": 500, "hide": 100 } });
		 $('[data-toggle="popover"]' ).popover();
	});
</script>
</head>
<body>
	<c:import url="./header.jsp"></c:import>
	<!-- Section-->
	<section class="py-5">
		<!-- Header-->
		<header class="bg-dark py-5">
			<div class="text-center text-white">
				<h1>with: 모두 함께</h1>
				<p class="text-white-50">모두함께라는 의미로 정직하게 사고 팔아봐요</p>
			</div>
		</header>
		<div class="container">
			<c:if test="${empty list}">
				<div class="py-5">
					<h1>등록된 제품이 없습니다..</h1>
					<h1>가장 먼저 제품을 등록해보세요</h1>
					<h3>
					<a id="pAdd" href="#">제품 등록하기</a>
						<%-- <a href="${pageContext.request.contextPath}/product/add"><p id="a">제품
							등록하기</p></a> --%>
					</h3>
				</div>
			</c:if>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach var="item" items="${list}">
					<div class="col mb-5">
						<div class="card h-100">
							<div class="product-img">
								<a
									href="${pageContext.request.contextPath}/product/view?product_num=${item.product_num}" title="판매자 : ${item.product_nick }" data-toggle="popover" 
									data-bs-placement="right" data-bs-trigger="hover focus" data-bs-content="상세정보 : ${item.product_content } </br> 
									 판매자평점 : (<i class='fas bi bi-star-fill' style='font-size: 10px'></i>${item.member.rate })</br> 
									 <c:if test='${empty item.path2 }'>
									 <img class='card-img-mini' src='http://dummyimage.com/286.com/286x150/fff/000.png&text=No+Image' alt='${item.product_title}'/>
									 </c:if>
									 <c:if test='${empty item.path3 }'>
									 <img class='card-img-mini' src='http://dummyimage.com/286.com/286x150/fff/000.png&text=No+Image' alt='${item.product_title}'/>
									 </c:if>
									 <c:if test='${not empty item.path2 }'>
									<img class='card-img-mini' src='${pageContext.request.contextPath}${item.path2}' alt='${item.product_title}'/> 
									</c:if>
									<c:if test='${not empty item.path3 }'>
									<img class='card-img-mini' src='${pageContext.request.contextPath}${item.path3}' alt='${item.product_title}'/>
									</c:if>
									
									" data-bs-html="true">
								<img class="card-img-top"
									src="${pageContext.request.contextPath}${item.path1}"
									alt="${item.product_title}" />
								</a>
							</div>
							<div class="card-body p-4">
								<div class="text-center">
									<h5 class="fw-bolder">${item.product_title}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${item.product_price}"
										pattern="#,###원" />
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="${pageContext.request.contextPath}/product/view?product_num=${item.product_num}">상품페이지로
										이동</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<c:import url="./footer.jsp"></c:import>
</body>
</html>
