<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
   function join() {
      location.href = "${pageContext.request.contextPath }/member/join";
   }

   function goMyPage() {
      location.href = "${pageContext.request.contextPath }/member/myPage";
   }

   function login() {
      location.href = "${pageContext.request.contextPath }/member/login";
   }

   function logout() {
      location.href = "${pageContext.request.contextPath }/member/logout";
   }

   $(document)
         .ready(
               function() {

                  $("#n_board")
                        .click(
                              function() {
                                 if ("${sessionScope.id}" == ""
                                       || "${sessionScope.id}" == null) {
                                    alert("로그인을 해주세요.");
                                    location.href = "${pageContext.request.contextPath}/member/login";
                                 } else {
                                    location.href = "${pageContext.request.contextPath}/notice/notice_board";
                                 }
                              });
               });
</script>
<style>
ul {
   margin: 0;
   padding: 0
}

li {
   list-style-type: none;
   float: right;
   margin: 0px;
   padding: 0px;
   margin: 0px;
}

#n_board {
   cursor: pointer;
}

html, body { min-width: 1300px}
</style>
</head>
<body>
   <div class="px-2" style="text-align: center">
      <header class="d-flex align-items-center py-1 justify-content-center">
         <div class="col"></div>
         <div class="col">
            <a style="margin: 0; padding: 0"
               href="${pageContext.request.contextPath }/member/main"
               class=" align-items-center text-dark text-decoration-none"> <b
               style="font-size: 50px">With</b>
            </a>
         </div>
         <div class="col">
            <div style="float: right" class="mx-5">
               <c:choose>
                  <c:when test="${empty sessionScope.id }">
                     <button type="button" class="btn btn-dark" onClick="join()">Sign-up</button>
                     <button type="button" class="btn btn-outline-dark" onClick="login()">Login</button>
                  </c:when>
                  <c:otherwise>
                     <button type="button" class="btn btn-dark" onClick="goMyPage()">myPage</button>
                     <button type="button" class="btn btn-outline-dark"
                        onClick="logout()">Logout</button>
                  </c:otherwise>
               </c:choose>
            </div>
            <ul>
               <c:if test="${sessionScope.id != null && sessionScope.type == 2 }">
                  <li class="nav-item my-2 mx-1"><a
                     style="margin: 0; padding: 0"
                     class="nav-link link-secondary text-decoration-none"
                     href="${pageContext.request.contextPath}/admin/category"
                     onClick="adimnCheck()">카테고리</a></li>
                  <li class="nav-item my-2 mx-1">
                         <a style="margin: 0; padding: 0"
                       class="nav-link link-secondary text-decoration-none"
                       href="${pageContext.request.contextPath}/report/reportList">신고목록</a>
                       </li>
               </c:if>
               <li class="nav-item my-2 mx-2" id="prod"><a
                  class="nav_link link-secondary text-decoration-none"
                  href="${pageContext.request.contextPath}/product/list">상품 목록</a></li>
               <li class="nav-item my-2 mx-2" id="n_board"><a
                  class="nav_link link-secondary text-decoration-none">공지사항</a></li>
            </ul>
         </div>
      </header>
   </div>
   <hr style="margin: 0">
</body>
</html>