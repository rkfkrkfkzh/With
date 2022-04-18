<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>With - 제품 상세내용</title>
<c:import url="../head.jsp"></c:import>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/product_view.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<script>
        commentsList = {};
        function toggleComments(comments_num) {
            $(`#form-${"${comments_num}"}`).slideToggle();
        }
        function editComments(comments_num) {
            const comments = $(`#comments-${"${comments_num}"}`);
            if (commentsList[comments_num] === undefined) {
                commentsList[comments_num] = comments.text();
                let html = `
                    <form action="${pageContext.request.contextPath}/comments/edit" method="post">
                        <div class="input-group edit-comments">
                            <textarea name="comments_content" class="form-control" rows="4" aria-describedby="comments" required>${"${comments.text()}"}</textarea>
                            <button class="btn btn-outline-secondary comments-btn" type="submit">댓글 수정</button>
                        </div>
                        <input type="hidden" name="comments_num" value="${"${comments_num}"}" />
                    </form>`;
                comments.css("white-space", "normal");
                comments.html(html);
            } else {
                comments.text(commentsList[comments_num]);
                comments.css("white-space", "pre");
                commentsList[comments_num] = undefined;
            }
        }
        function deleteComments(comments_num) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/comments/delete",
                data: { comments_num },
                success: function (response) {
                    alert("댓글이 삭제되었습니다.");
                    location.href = location.href.split("#")[0];
                },
            });
        }
            // 찜 목록 및 거래기능 추가시 로그인사용자만 가능하게끔 구현
            function loginCheck() {
                if ("${sessionScope.id}" === "" || "${sessionScope.id}" === "null") {
                    return false;
                } else {
                    return true;
                }
            }
            // 이미지 리스트 생성
            $(document).ready(function () {
                // 로그인 되어있을 때 찜버튼 변경
                if (loginCheck()) {
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/wish/check",
                        data: { product_num: "${p.product_num}" },
                        success: function (response) {
                            // 로그인이 되어있고, 해당 상품을 찜 해놓았으면 체크박스 값 변경해줌
                            if (loginCheck() === true && response === true) {
                                $("#wish").prop("checked", true);
                            }
                        },
                    });
                }
                // 찜 버튼 클릭시 로그인여부를 확인하고, 찜 목록에 추가/삭제기능
           $("#wish").change(function (e) {
                    if (loginCheck() === true) {
                        if ($(this).prop("checked") === true) {
                            $.ajax({
                                type: "post",
                                url: "${pageContext.request.contextPath}/wish/add",
                                data: { product_num: "${p.product_num}" },
                                success: function (response) {
                                    alert("찜목록에 추가되었습니다.");
                                },
                            });
                        } else {
                            $.ajax({
                                type: "post",
                                url: "${pageContext.request.contextPath}/wish/delete",
                                data: { product_num: "${p.product_num}" },
                                success: function (response) {
                                    alert("찜목록에서 삭제되었습니다.");
                                },
                            });
                        }
                    } else {
                        const goLogin = confirm("로그인이 필요한 기능입니다. 로그인하시겠습니까?");
                        if (goLogin) {
                            $("#wish").prop("checked", false);
                            location.href = `${pageContext.request.contextPath}/member/loginForm?refer=${"${location.href}"}`;
                        } else {
                            // 로그인하지 않았으므로 체크박스를 다시 해제시킴
                            $("#wish").prop("checked", false);
                        }
                    }
                });
                // 댓글 입력
              $(".add-comments-form").submit(function (e) {
                    e.preventDefault();
                    if ("${sessionScope.id}" === "") {
                        const goLogin = confirm("로그인이 필요한 기능입니다. 로그인하시겠습니까?");
                        if (goLogin) {
                            location.href = `${pageContext.request.contextPath}/member/login?refer=${"${location.href}"}`;
                        } else {
                            $(this)[0].reset();
                        }
                    } else {
                        $(this)[0].submit();
                    }
                }); 
               
             
                  $('[data-toggle="popover"]' ).popover({ html: true });
 
                $("button[name='comments-member_id']").click(function (e) {
                    e.preventDefault();
                    console.log(e);
                });
                // 신고하기 버튼
                $(document).on("click", "a[id='reportbtn']", function (e) {
                e.preventDefault();
                if ("${sessionScope.id}" == "" || "${sessionScope.id}" == null) {
                    const goLogin = confirm("로그인이 필요한 기능입니다. 로그인하시겠습니까?");
                    if (goLogin) {
                    	location.href="${pageContext.request.contextPath}/member/login";
                    }
                } else {
                    $("#rb").modal("toggle");
                }
            });
            // 신고 제출 버튼
            $(document).on("click", "button[id='report']", function () {
                document.getElementById("report_form").submit();
            });
                $("#reviewSpan")
				.click(
						function() {
							var form = document
									.createElement('form');
							var objs;
							objs = document
									.createElement('input');
							objs.setAttribute('type', 'hidden');
							objs.setAttribute('name', 'id');
							objs.setAttribute('value',
									'${p.product_writer}');
							form.appendChild(objs);
							form.setAttribute('method', 'post');
							form
									.setAttribute('action',
											'${pageContext.request.contextPath}/review/reviewList');
							document.body.appendChild(form);
							form.submit();
						});
              //거래신청 로그인확인
                $(document).on("click", "button[id='mailbtn']", function (e) {
                    e.preventDefault();
                    if ("${sessionScope.id}" == "" || "${sessionScope.id}" == null) {
                        const goLogin = confirm("로그인이 필요한 기능입니다. 로그인하시겠습니까?");
                        if (goLogin) {
                        	location.href="${pageContext.request.contextPath}/member/login";
                        }
                    } else {
                        $("#mail").modal("toggle");
                    }
                });
                // 거래신청 버튼
                $(document).on("click", "button[id='msbtn']", function () {
                    document.getElementById("mailsend").submit();
                });
            });
        </script>
</head>
<body>
	<c:import url="../header.jsp"></c:import>
	<section class="py-5">
		<div class="container border px-5 py-4">
			<h2>${p.product_title}</h2>
			<div class="product_image">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<c:if test="${not empty p.path1}">
							<div class="carousel-item active">
								<a href="${p.path1}" target="blank"> <img src="${p.path1}"
									alt="${p.product_title}" id="img1"
									class="d-block w-100 product-img" itemid="0" />
								</a>
							</div>
						</c:if>
						<c:if test="${not empty p.path2}">
							<div class="carousel-item">
								<a href="${p.path2}" target="blank"> <img src="${p.path2}"
									alt="${p.product_title}" id="img2"
									class="d-block w-100 product-img" itemid="1" />
								</a>
							</div>
						</c:if>
						<c:if test="${not empty p.path3}">
							<div class="carousel-item">
								<a href="${p.path3}" target="blank"> <img src="${p.path3}"
									alt="${p.product_title}" id="img3"
									class="d-block w-100 product-img" itemid="2" />
								</a>
							</div>
						</c:if>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<div class="my-4">
				<div class="product-content">
					<div class="user">
						<span class="product-nick"> <a
							href="${pageContext.request.contextPath}/product/search?q=product_nick&value=${p.product_nick}"
							title="판매자의 다른 상품보기">${p.member.nick}</a>
						</span> <span id="reviewSpan">(<i class="fas bi bi-star-fill"
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
					<div class="dropdown-divider my-3"></div>
					<div class="product-price">
						<fmt:formatNumber value="${p.product_price}" pattern="#,###원" /> |
						<c:choose>
							<c:when test="${p.product_tradetype==1}">
							<a>직접거래</a>
							</c:when>
							<c:when test="${p.product_tradetype==2}">
							<a>택배거래</a>
							</c:when>
							</c:choose>
					</div>
					<div class="category">
						<nav style="-bs-breadcrumb-divider: '&gt;'"
							aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item active"><a
									href="${pageContext.request.contextPath}/product/search?q=c1&value=${p.category1_num}"
									title="해당 대분류로 검색">${p.c1.category_name}</a>
								</li>
								<li class="breadcrumb-item active"><a
									href="${pageContext.request.contextPath}/product/search?q=c2&value=${p.category2_num}"
									title="해당 중분류로 검색">${p.c2.category_name}</a>
								</li>
								<li class="breadcrumb-item active"><a
									href="${pageContext.request.contextPath}/product/search?q=c3&value=${p.category3_num}"
									title="해당 소분류로 검색">${p.c3.category_name}</a>
								</li>
							</ol>
							<div class="add_date">${p.stringDate}</div>
						</nav>
					</div>
					<div class="content py-2">${p.product_content}</div>
					<div class="product-data my-2">
						조회수 ${p.product_hit} | 관심
						<c:import
							url="${pageContext.request.contextPath}/wish/countProduct?product_num=${p.product_num}" />
						| 댓글
						${p.comments.size()}
						| <a id="reportbtn" style="cursor: pointer">신고하기</a>
					</div>
					<c:if test="${i >=1 }">
           			    <div><i class="bi bi-exclamation-triangle-fill"></i>
             			<div style="background-color:#FFBB00; display:inline">신고 누적: ${i }</div> <br>
             		<c:if test="${i >= 5}"><p style="color:red"><b>(신고 횟수가 많습니다 거래에 주의하세요.)</b></p></c:if>
               			</div>
               </c:if>
					<c:choose>
						<%-- 판매자 --%>
						<c:when test="${sessionScope.id == p.product_writer || sessionScope.type == 2}">
                                <c:choose>
                                    <c:when test="${p.product_type != 2 }">
                                        <div class="user-panel">
                                            <button
                                                type="button"
                                                class="btn btn-danger"
                                                onclick="location.href=`${pageContext.request.contextPath}/product/delete?product_num=${p.product_num}`"
                                            >
                                                제품 삭제
                                            </button>
                                            <c:choose>
                                                <c:when test="${p.product_type == 1}">
                                                    <button
                                                        type="button"
                                                        class="btn btn-warning"
                                                        onclick="location.href=`${pageContext.request.contextPath}/product/ordercancel?product_num=${p.product_num}`"
                                                    >
                                                        거래 예약 취소
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button
                                                        type="button"
                                                        class="btn btn-warning"
                                                        onclick="location.href=`${pageContext.request.contextPath}/product/order?product_num=${p.product_num}`"
                                                    >
                                                        거래 예약 중
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <h4 class="result my-4">거래 완료된 제품입니다.</h4>
                                        <button
                                            type="button"
                                            class="btn btn-danger"
                                            onclick="location.href=`${pageContext.request.contextPath}/product/delete?product_num=${p.product_num}`"
                                        >
                                            제품 삭제
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
					<%-- 구매자 --%>
						<c:otherwise>
                     <c:choose>
                        <c:when test="${p.product_type != 2}">
                        <table class="w-100">
                           <tr>
                              <td>
                            	  <label class="like">
                            	  <input type="checkbox" id="wish" />
                           	   <div class="hearth"></div>
                         		  </label>
                          	 </td>
                              <td style="text-align: right">
                              	<button id="mailbtn" type="button" class="btn btn-success" >거래 신청</button>
                              </td>
                           </tr>
                        </table>   
									<!-- 신고하기 -->
      <div class="modal fade" id="rb" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
             <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
               <div class="modal-body">
               <form id="report_form" method="post" action="${pageContext.request.contextPath}/report/add">
                <div class="mb-3">
                 <label for="recipient-name" class="col-form-label">신고 사유</label>
                  <input type="text" class="form-control  w-100" id="recipient-name" name="report_title">
                 </div>
                <div class="mb-3">
                <label for="message-text" class="col-form-label">세부 내용을 적어주세요</label>
                 <textarea class="form-control w-100" id="message-text" name="report_content"></textarea>
                 </div>
                 <input type="hidden" id="product_num" name="product_num" value="${p.product_num}" />
                 </form>
                  </div>
                  <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="report">신고</button>
                   </div>
                  </div>
             </div>
        </div>
         <!-- /신고하기 -->
          <!-- 거래신청 -->
          <div class="modal fade" id="mail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
             <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">거래신청</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
               <div class="modal-body">
               <form id="mailsend" method="post" action="${pageContext.request.contextPath}/mail/mailSend">
                <div class="mb-3">
                 <label for="attention" class="col-form-label">
                 	본 신청은 이메일로 발송됩니다.<br>
                 	반복적인 거래 신청은 제재의 사유가 될 수 있습니다.
                 </label>
                 </div>
                 <input type="hidden" id="product_num" name="product_num" value="${p.product_num}" />
                 <input type="hidden" id="product_writer" name="product_writer" value="${p.product_writer}" />
                 <input type="hidden" id="product_title " name="product_title" value="${p.product_title}" />
                 </form>
                  </div>
                  <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="msbtn">보내기</button>
                   </div>
                  </div>
             </div>
        </div>
         <!-- /거래신청 -->
								</c:when>
								<c:otherwise>
									<h4 class="result my-4">거래 완료된 제품입니다.</h4>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="dropdown-divider my-3"></div>
			<div class="comments" id="comments-add-form">
				<!-- 댓글 등록 폼 -->
				<form action="${pageContext.request.contextPath}/comments/add"
					method="post" class="add-comments-form">
					<div class="input-group add-comments">
						<textarea name="comments_content" class="form-control" rows="4"
							aria-describedby="comments" required></textarea>
						<button class="btn btn-outline-secondary comments-btn"
							type="submit">댓글 등록</button>
					</div>
					<input type="hidden" name="member_id" value="${sessionScope.id}" />
					<input type="hidden" name="product_num" value="${p.product_num}" />
					<input type="hidden" name="top_comments_num" value="-1" />
				</form>
				<!-- 댓글 목록 -->
				<ul class="list-group comments">
					<c:forEach var="comments" items="${p.comments}">
						<c:set var="status"
							value="${comments.comments_content==null?'deleted':p.product_writer==comments.member_id?'seller':'other'}" />
						<c:set var="className"
							value="${comments.comments_content==null?'deleted':p.product_writer==comments.member_id?'primary':'info'}" />
						<%-- 한개의 댓글 내용 --%>
						<c:choose>
							<%-- 댓글이 정상상태인 경우 --%>
							<c:when test="${status!='deleted'}">
								<li
									class="list-group-item list-group-item-${className} ${status}">
									<div class="comments-content"
										id="comments-${comments.comments_num}">${comments.comments_content}</div>

									<div class="comments-writer">
										<c:if test="${p.product_writer==sessionScope.id && p.product_type != 2}">
											<a name="comments-member_id" data-toggle="popover" title="<a href='${pageContext.request.contextPath}/product/soldout?product_num=${p.product_num}&member_id=${comments.member_id}'>거래완료상대</a>">
										</c:if>
										${comments.member.nick} </a>
									</div>
									<div class="comments-menu mt-3">
										<c:if test="${sessionScope.id!=null}">
											<a onclick="toggleComments(`${comments.comments_num}`)"
												title="댓글"><i class="fas fa-comments"></i> 댓글</a>
										</c:if>
										<c:if test="${comments.member_id==sessionScope.id || sessionScope.type == 2}">
											<span> | </span>
											<a onclick="editComments(`${comments.comments_num}`)"
												title="수정"><i class="fas fa-edit"></i> 수정</a>
											<span> | </span>
											<a onclick="deleteComments(`${comments.comments_num}`)"
												title="삭제"><i class="fas fa-trash"></i> 삭제</a>
										</c:if>
									</div>
								</li>
								<%-- 댓글 내용 끝 & 댓글의 댓글 추가 폼 --%>
								<form action="${pageContext.request.contextPath}/comments/add"
									method="post" class="add-child-comments-form"
									id="form-${comments.comments_num}" style="display: none">
									<div class="input-group">
										<textarea name="comments_content" class="form-control"
											rows="4" aria-describedby="comments" required></textarea>
										<button class="btn btn-outline-secondary child-comments-btn"
											type="submit">댓글 등록</button>
									</div>
									<input type="hidden" name="member_id"
										value="${sessionScope.id}" /> <input type="hidden"
										name="product_num" value="${p.product_num}" /> <input
										type="hidden" name="top_comments_num"
										value="${comments.comments_num}" />
								</form>
								<%-- 댓글의 댓글 폼 끝 --%>
							</c:when>
							<%-- 댓글이 삭제된 상태인 경우 --%>
							<c:otherwise>
								<li
									class="list-group-item list-group-item-${className} ${status}">
									<div class="comments-content">삭제된 댓글 입니다.</div>
								</li>
							</c:otherwise>
						</c:choose>
						<%-- 하위 댓글이 있는 경우 --%>
						<c:if test="${not empty comments.child_comments}">
							<c:forEach var="c_comments" items="${comments.child_comments}">
								<c:set var="child_status"
									value="${c_comments.comments_content==null?'deleted':p.product_writer==c_comments.member_id?'seller':'other'}" />
								<c:set var="child_className"
									value="${c_comments.comments_content==null?'deleted':p.product_writer==c_comments.member_id?'primary':'info'}" />
								<c:choose>
									<c:when test="${child_status!='deleted'}">
										<li
											class="list-group-item list-group-item-${child_className} ${child_status} child-comments">
											<div id="comments-${c_comments.comments_num}"
												class="child comments-content">${c_comments.comments_content}</div>
												<div class="child comments-writer">
													<c:if test="${p.product_writer==sessionScope.id && p.product_type != 2}">
													<a name="comments-member_id" data-toggle="popover" title="<a href='${pageContext.request.contextPath}/product/soldout?product_num=${p.product_num}&member_id=${comments.member_id}'>거래완료상대</a>">
													</c:if>
													${c_comments.member.nick} </a>
												</div>
											 <%-- 댓글 쓴 사람 == 로그인 한 사람 --%> <c:if
												test="${c_comments.member_id==sessionScope.id || sessionScope.type == 2}">
												<div class="child comments-menu mt-3">
													<a onclick="editComments(`${c_comments.comments_num}`)"
														title="수정"><i
														class="fas fa-edit"></i> 수정</a> <span> | </span> <a
														onclick="deleteComments(`${c_comments.comments_num}`)"
														title="삭제"><i
														class="fas fa-trash"></i> 삭제</a>
												</div>
											</c:if>
										</li>
									</c:when>
									<c:otherwise>
										<li
											class="list-group-item list-group-item-${child_className} ${child_status} child-comments">
											<div class="child comments-content">삭제된 댓글 입니다.</div>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</section>
	<c:import url="../footer.jsp"></c:import>
</body>
</html>