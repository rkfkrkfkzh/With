<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
</head>
<script>
	function starCheck() {
		if ($("#star").val() <= 0) {
			alert("별점을 입력해주세요.")
			return false;
		} else if ($("#content").val() == null
				|| $("#content").val().trim() == "") {
			alert($("#content").val());
			alert("내용을 입력해주세요.")
			return false;
		}
	}

	$(document).ready(function() {
		var list = $('.sStar i');
		list.click(function() {
			var itemIndex = $(this).index();
			$("#star").val(itemIndex + 1);
			for (i = 4; i >= 0; i--) {
				if (itemIndex >= i) {
					$('.sStar i').eq(i).removeClass("bi-star");
					$('.sStar i').eq(i).addClass("bi-star-fill");
				} else {
					$('.sStar i').eq(i).addClass("bi-star");
					$('.sStar i').eq(i).removeClass("bi-star-fill");
				}
			}
		});
	});
</script>
<style>
.sStar {
	cursor: pointer
}

.iStar {
	color: black;
}
</style>
<body>
	<c:import url="../header.jsp" />
	<div class="mt-3 mb-3 mx-3">
		${m.nick }님의 후기
		<c:if test="${sessionScope.id != m.id && sessionScope.id != null}">
			<div class="mb-2" style="text-align: right">
				<button type="button" data-toggle="collapse"
					data-target="#writeReview" class="btn btn-dark">후기 작성</button>
			</div>
		</c:if>

		<!-- toggle -->
		<div id="writeReview"
			class="collapse mb-1 card border-top border-bottom"
			style="width: 100%;">
			<form action="${pageContext.request.contextPath }/review/addReview"
				onsubmit="return starCheck()" method="post">
				<div class="card-body">
					<h6 class="card-subtitle mb-2 text-muted">${sessionScope.id }</h6>
					<h5 class="card-title">
						<span class="sStar"> <c:forEach begin="1" end="5"
								varStatus="status">
								<i class="fas bi bi-star iStar" style="font-size: 30px"></i>
							</c:forEach>
						</span>
					</h5>
					<p class="card-text">
						<textarea style="width: 100%; resize: none" rows="3"
							placeholder="후기를 남겨주세요." id="content" name="content"></textarea>
					</p>
					<input type="hidden" id="star" name="star" value="0"> <input
						type="hidden" id="id" name="id" value="${m.id }">
					<div style="text-align: right">
						<button type="submit" class="btn btn-dark">등록</button>
					</div>
				</div>
			</form>
		</div>
		<!-- toggle -->
		<div id="reList">
			<c:choose>
				<c:when test="${not empty list }">
					<c:forEach items="${list }" var="r">
						<form action="${pageContext.request.contextPath }/review/del" method="post">
							<div class="card border-top border-bottom" style="width: 100%;">
								<div class="card-body">
									<h6 class="card-subtitle mb-2 text-muted">
										${r.member_id} | ${r.review_date }
										<button type="submit" onclick="delBtn()" style="float: right"
											class="btn-close" aria-label="Close"></button>
									</h6>
									<h5 class="card-title">
										<c:forEach begin="1" end="5" varStatus="status">
											<c:choose>
												<c:when test="${r.star >= status.index}">
													<i class="fas bi bi-star-fill" style="font-size: 30px"></i>
												</c:when>
												<c:otherwise>
													<i class="fas bi bi-star" style="font-size: 30px"></i>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</h5>
									<p class="card-text">${r.review_content }</p>
								</div>
							</div>
							<input type="hidden" name="star" value="${r.star }">
							<input type="hidden" name="id" value="${r.product_id }">
							<input type="hidden" name="num" value="${r.review_num }">
						</form>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="card border-top border-bottom text-center"
						style="width: 100%;">
						<div class="card-body">
							<h5 class="card-title">등록된 후기가 없습니다.</h5>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="" style="height: 5%">
		<c:import url="../footer.jsp" />
	</div>
</body>
</html>