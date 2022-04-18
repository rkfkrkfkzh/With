<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:choose>
    <%-- 등록된 제품 목록이 있을 때 --%>
    <c:when test="${not empty plist}">
        <div class="list-group product-list">
            <!-- 1개의 제품 데이터 -->
            <c:forEach var="p" items="${plist}">
                <%-- a 태그에 제품이 거래 완료(p.product_type == 2)일때는 disabled를 추가 --%>
                <div class="product-item" style="position: relative">
                    <c:if test="${sessionScope.type==2}">
                        <div class="admin" style="z-index: 5">
                            <button
                                type="button"
                                class="btn-close"
                                onclick="location.href=`${pageContext.request.contextPath}/product/delete?product_num=${p.product_num}`"
                            ></button>
                        </div>
                    </c:if>
                    <a
                        href="${pageContext.request.contextPath}/product/view?product_num=${p.product_num}"
                        class="col-md-12 list-group-item list-group-item-action product-item ${p.product_type == 2 ? 'text-muted' : '' }" 
                        			title="판매자 : ${p.product_nick }" title="판매자 : ${p.product_nick }" data-toggle="popover" 
									data-bs-placement="right" data-bs-trigger="hover focus" data-bs-content="상세정보 : ${p.product_content } </br> 
									 <c:if test='${empty p.path2 }'>
									 <img class='card-img-mini' src='http://dummyimage.com/286.com/286x150/fff/000.png&text=No+Image' alt='${p.product_title}'/>
									 </c:if>
									 <c:if test='${empty p.path3 }'>
									 <img class='card-img-mini' src='http://dummyimage.com/286.com/286x150/fff/000.png&text=No+Image' alt='${p.product_title}'/>
									 </c:if>
									 <c:if test='${not empty p.path2 }'>
									<img class='card-img-mini' src='${pageContext.request.contextPath}${p.path2}' alt='${p.product_title}'/> 
									</c:if>
									<c:if test='${not empty p.path3 }'>
									<img class='card-img-mini' src='${pageContext.request.contextPath}${p.path3}' alt='${p.product_title}'/>
									</c:if>
									
									" data-bs-html="true">
                        <div class="item row g-2">
                            <div class="img col-md-4 align-middle">
                                <div class="centered">
                                    <img class="product-image img-fluid w-100" src="${p.path1}" alt="${p.product_title}">
                                </div>
                            </div>
                            <div class="desc col-md-8 row g-2 px-3">
                                <div class="product-header">
                                    <h1 class="product-title display-3">
                                        ${p.product_title}
                                        <c:choose>
                                            <c:when test="${p.product_type == 0}">
                                                <span class="badge bg-primary">판매중</span>
                                            </c:when>
                                            <c:when test="${p.product_type == 1}">
                               
                                               <span class="badge bg-warning text-dark">거래 대기중</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-light text-dark">판매완료</span>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="badge bg-info">${p.member.addr }</span>
                                        <span class="badge bg-secondary"><c:choose>
											<c:when test="${p.product_tradetype==1}">
							                직접거래
							              </c:when>
											<c:when test="${p.product_tradetype==2}">
							               택배거래
							               </c:when>
										</c:choose>
										</span>
                                    </h1>
                                </div>
                                <%-- 가격을 보기 좋게 포맷팅함 --%>
                                <div class="product-price">
                                    <fmt:formatNumber pattern="#,###원" value="${p.product_price}"></fmt:formatNumber>
                                </div>
                                <div class="product-add-date">등록일 : ${p.stringDate}</div>
                                <div class="product-hit">조회수 : ${p.product_hit}</div>
                                <div class="user">
                                    <div class="product-user-writer">판매자 : ${p.member.nick}</div>
                                    <div class="product-user-score">
                                         <span id="reviewSpan">(<i class="fas bi bi-star-fill"
							style="font-size: 10px"></i> <c:choose>
								<c:when test="${p.member.rateCount == 0 }">
                            0.0)
                            </c:when>
								<c:otherwise>
                            ${p.member.rate / p.member.rateCount})
                            </c:otherwise>
							</c:choose>
						</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </c:when>
    <%-- 등록된 제품이 없을 때 --%>
    <c:otherwise>
        <h3>등록된 제품이 없습니다.</h3>
    </c:otherwise>
</c:choose>
<!-- 페이지 목록 -->
<c:if test="${not empty page}">
    <nav class="py-5 w-100 d-flex justify-content-center">
        <ul class="pagination">
            <li class="page-item ${page.prev?'':'disabled'}">
                <a class="page-link" href="${pageContext.request.contextPath}/product/list?p=${page.startPage-1}">
                    <i class="fas fa-chevron-left"></i>
                </a>
            </li>
            <c:forEach begin="${page.startPage}" end="${page.endPage}" varStatus="status">
                <li class="page-item ${page.currentPage==status.current?'active':''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/product/list?p=${status.current}">${status.current}</a>
                </li>
            </c:forEach>
            <li class="page-item ${page.next?'':'disabled'}">
                <a class="page-link" href="${pageContext.request.contextPath}/product/list?p=${page.endPage+1}">
                    <i class="fas fa-chevron-right"></i>
                </a>
            </li>
        </ul>
    </nav>
</c:if>