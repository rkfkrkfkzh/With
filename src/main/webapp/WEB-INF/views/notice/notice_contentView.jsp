<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>with: ��� �Բ� - ${n.notice_title }</title>
<c:import url="../head.jsp" />
</head>
<body>
	<c:import url="../header.jsp" />
	<section class="py-5">
		<div class="container">
			<div class="py-3">
				<h1>��������</h1>
			</div>
			<c:import url="/notice/Board"></c:import>
			<div class="col-md-12">
				<form id="contentForm" action="${pageContext.request.contextPath}">
					<input type="hidden" name="notice_num" value="${n.notice_num }" />
					<div class="mb-3">
						<h1>${n.notice_title }</h1>
					</div>

					<div class="mb-3">
						<fmt:formatDate value="${n.notice_date}" pattern="YYYY�� MM�� dd�� hh:mm" />
					</div>

					<hr class="dropdown-divider" />
					<div class="mb-3">
						<div class="content fs-2" style="white-space: pre">${n.notice_content }</div>
					</div>

					<div class="mb-3">
						<c:if test="${type==2}">
							<button class="btn btn-danger del-btn" type="button" onclick="location.href=`${pageContext.request.contextPath}/notice/notice_delete?notice_num=${n.notice_num}`">����</button>
						</c:if>
						<button class="btn btn-primary list-btn" type="button" onClick="history.back();">�������</button>
					</div>
				</form>

			</div>

		</div>
	</section>
	<c:import url="../footer.jsp" />

</body>
</html>