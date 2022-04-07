<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>로그인</title>
<c:import url="../head.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member_loginForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member_msg.css" />
</head>
<body>
	<c:import url="../header.jsp"></c:import>
	<section class="py-5">
	<div class="container">
		<div class="py-4">
			<h1>로그인</h1>
		</div>
		<form action="${pageContext.request.contextPath}/member/login" method="post">
			<div class="col-md-5 my-2">
				<input type="text" class="my-3 py-2 form-control" name="id" id="id" placeholder="아이디(이메일)" /> <input type="password" class="my-3 py-2 form-control" name="pwd" id="pwd" placeholder="비밀번호" /> <span id="msg" class="my-3 py-2 msg"> </span>
				<button type="submit" id="login" class="btn btn-dark py-2">로그인하기</button>
			</div>
		</form>
		<a href="${pageContext.request.contextPath}/member/findPwd">비밀번호 찾기</a>
	</div>
	</section>
	<c:import url="../footer.jsp"></c:import>
</body>
</html>
