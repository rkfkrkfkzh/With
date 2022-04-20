<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>with: 모두 함께 - 공지사항 목록</title>
    <c:import url="../head.jsp"></c:import>
    <link rel="stylesheet" href="/static/css/notice_list.css"/>

</head>
<body>
<c:import url="../header.jsp"></c:import>
<section class="py-5">
    <div class="container">
        <!-- 검색 Form -->
        <div class="search-form text-center">
            <form action="${pageContext.request.contextPath}/notice/search"
                  method="get" onsubmit="return checkSearch()" id="nSearchForm">
                <select class="form-select" name="q" id="q" aria-label="query">
                    <option ${q=='notice_title' ? 'selected' : '' }
                            value="notice_title">공지 제목
                    </option>
                    <option ${q=='notice_num' ? 'selected' : '' }
                            value="notice_num">공지 번호
                    </option>
                    <option ${q=='notice_date' ? 'selected' : '' }
                            value="notice_date">작성일
                    </option>
                </select>
                <input class="form-control" type="text" placeholder="검색"
                       name="value" aria-label="검색"/>
                <button type="submit" class="btn btn-outline-primary">검색</button>
            </form>
        </div>

        <div class="py-3">
            <h1>공지사항 목록</h1>
        </div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th class="th_num">번호</th>
                <th class="th_title">제목</th>
                <th class="th_date">작성일</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${empty list }">
                <tr>
                    <td colspan="5">등록된 공지가 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${not empty list}">
                <c:forEach var="n" items="${list}" varStatus="status">
                    <tr>
                        <td>${n.display_num}</td>
                        <td>
                            <a class="link"
                               href="${pageContext.request.contextPath}/notice/notice_contentView?notice_num=${n.notice_num}"> ${n.notice_title}</a>
                        </td>
                        <td>${n.notice_date}</td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
        <!--<c:import url="${pageContext.request.contextPath}/api/member/getUserType" var="userType" />-->
        <c:if test="${sessionScope.type == 2}">
            <div class="d-flex justify-content-end">
                <button type="button" class="btn btn-secondary"
                        onclick="location.href='${pageContext.request.contextPath}/notice/notice_writing'">공지사항 작성
                </button>
            </div>
        </c:if>

    </div>
    <c:if test="${not empty page}">
        <nav class="py-5 w-100 d-flex justify-content-center">
            <ul class="pagination">
                <li class="page-item ${page.prev?'':'disabled'}">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/notice/notice_board?p=${page.startPage-1}">
                        <i class="fas fa-chevron-left"></i>
                    </a>
                </li>
                <c:forEach begin="${page.startPage}" end="${page.endPage}" varStatus="status">
                    <li class="page-item ${page.currentPage==status.current?'active':''}">
                        <a class="page-link"
                           href="${pageContext.request.contextPath}/notice/notice_board?p=${status.current}">${status.current}</a>
                    </li>
                </c:forEach>
                <li class="page-item ${page.next?'':'disabled'}">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/notice/notice_board?p=${page.endPage+1}">
                        <i class="fas fa-chevron-right"></i>
                    </a>
                </li>
            </ul>
        </nav>
    </c:if>
</section>
<c:import url="../footer.jsp"/>
</body>
</html>