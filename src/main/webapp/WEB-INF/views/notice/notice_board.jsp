<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>with: ��� �Բ� - �������� ���</title>
<c:import url="../head.jsp" />
</head>
<body>
	<c:import url="../header.jsp" />
	<section class="py-5">
		<div class="container">
			<div class="py-3">
				<h1>�������� ���</h1>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="th_num">��ȣ</th>
						<th class="th_title">����</th>
						<th class="th_date">�ۼ���</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="5">��ϵ� ������ �����ϴ�.</td>
						</tr>
					</c:if>
					<c:if test="${not empty list}">
						<c:forEach var="n" items="${list}" varStatus="status">
							<tr>
								<td>${n.notice_num}</td>
								<td>
									<a class="link" href="${pageContext.request.contextPath}/notice/notice_contentView?notice_num=${n.notice_num}"> ${n.notice_title}</a>
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
					<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/notice/notice_writing'">�������� �ۼ�</button>
				</div>
			</c:if>

		</div>

	</section>
	<c:import url="../footer.jsp" />
</body>
</html>