<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>With: 마이페이지</title>
<c:import url="../head.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/star.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
</head>
<body>
	<c:import url="../header.jsp" />
	<section class="py-5">
		<div class="container">
			<span> <span class="fs-1">${m.nick}</span> <span class="fs-5">${sessionScope.id}</span>
			</span>
			<table>
            <tr>
               <td><a style="width: 100px; height: 75px"
                  href="/product/mylist"
                  class="btn btn-outline-dark px-3 py-2 rounded-3"> <i
                     class="fas bi bi-layout-text-sidebar-reverse w-100" style="font-size: 36px"></i>판매 내역
               </a></td>
               <td><a style="width: 100px; height: 75px"
                  href="${pageContext.request.contextPath }/wish/wishList"
                  class="btn btn-outline-dark mx-3 px-3 py-2 rounded-3"> <i
                     class="fas bi bi-heart-fill w-100 text-red" style="font-size: 36px"></i>찜 목록
               </a></td>
               <td><a style="width: 100px; height: 75px" href="/product/add"
                  class="btn btn-outline-dark px-3 py-2 rounded-3"> <i
                     class="fas bi bi-gift w-100 " style="font-size: 36px" ></i>상품 등록
               </a></td>
               <td><a style="width: 100px; height: 75px"
                  href="/review/reviewList?id=${sessionScope.id }"
                  class="btn btn-outline-dark mx-3 py-2 rounded-3"> <i
                     class="fas w-100 bi bi-chat-text"
                     style="font-size: 36px; width: 100%"> </i> 거래 평점
               </a></td>
            </tr>
         </table>

			<c:import url="${pageContext.request.contextPath }/alram/mylist"></c:import>
			<div class="btn-group btn-group-sm mt-3" role="group">
				<a class="btn btn-outline-secondary" href="/member/update">내 정보
					수정</a> <a class="btn btn-outline-secondary" href="/member/logout">로그아웃</a>
			</div>
		</div>
	</section>
	<c:import url="../footer.jsp"></c:import>
</body>
</html>