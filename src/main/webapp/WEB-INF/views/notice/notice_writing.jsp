<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>with: ��� �Բ� - �������� �ۼ�</title>
<c:import url="../head.jsp" />
</head>
<body>
	<c:import url="../header.jsp" />
	<section class="py-5">
		<div class="container">
			<div class="title py-3">
				<h1>�������� �ۼ�</h1>
			</div>
			<div class="write-form col-md-12">
				<form method="post" id="noticeForm" action="${pageContext.request.contextPath}/notice/notice_writing">
					<div class="mb-3">
						<label for="title" class="form-label">����</label> <input type="text" class="form-control w-100" id="title" placeholder="������ �Է��ϼ���." name="notice_title" />
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">����</label>
						<textarea class="form-control w-100" id="content" rows="14" placeholder="������ �Է��ϼ���." name="notice_content"></textarea>
					</div>
					<button class="btn btn-danger" type="reset">�ʱ�ȭ</button>
					<button class="btn btn-primary" type="submit">�ۼ�</button>
				</form>
			</div>
		</div>
	</section>
	<c:import url="../footer.jsp" />
</body>
</html>