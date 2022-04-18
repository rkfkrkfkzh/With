<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>With: 정보 변경하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<c:import url="../head.jsp" />
</head>
<script>
	function delMem() {
		var result = confirm("정말로 탈퇴하시겠습니까? 저장된 정보는 전부 제거됩니다.");
		if (result) {
			var f = document.f1;
			f.method = "post";
			f.action = "${pageContext.request.contextPath}/member/del";
			f.submit();
		}
	}

	function goPwdChange() {
		location.href = "${pageContext.request.contextPath }/member/changePwd?id=${sessionScope.id}";
	}
</script>
<body>
	<c:import url="../header.jsp"></c:import>
	<section class="py-5">
		<form action="${pageContext.request.contextPath }/member/update" method="post" name="f1">
			<div class="container mt-5 container1 col-md-6" style="padding-left: 10%; padding-right: 10%">
				<div class="col-md-12 mb-3" style="text-align: center">
					<h3>
						<b>내 정보 수정</b>
					</h3>
				</div>
				<table class="table border-top border-bottom w-100">
					<tr class="table-light align-middle">
						<td>아이디</td>
						<td>${m.id }</td>
					</tr>
					<tr class="table-light align-middle">
						<td>비밀번호</td>
						<td>
							<button type="button" class="btn btn-outline-dark" onclick="goPwdChange()">비밀번호 변경</button>
						</td>
					</tr>
					<tr class="table-light align-middle">
						<td>이름</td>
						<td>${m.name }</td>
					</tr>
					<tr class="table-light align-middle">
						<td>닉네임</td>
						<td>${m.nick }</td>
					</tr>
					<tr class="table-light align-middle">
						<td>휴대폰 번호</td>
						<td>
							<input type="text" class="form-control" name="tel" value="${m.tel }">
						</td>
					</tr>
					<tr class="table-light align-middle">
						<td>주소</td>
						<td style="vertical-align: middle">
							<div class="col-md-4">
								<select class="form-select" name="addr">
									<option value="서울" <c:if test="${m.addr eq '서울'}">selected</c:if>>서울</option>
									<option value="경기" <c:if test="${m.addr eq '경기'}">selected</c:if>>경기</option>
									<option value="인천" <c:if test="${m.addr eq '인천'}">selected</c:if>>인천</option>
									<option value="부산" <c:if test="${m.addr eq '부산'}">selected</c:if>>부산</option>
									<option value="대전" <c:if test="${m.addr eq '대전'}">selected</c:if>>대전</option>
									<option value="광주" <c:if test="${m.addr eq '광주'}">selected</c:if>>광주</option>
									<option value="대구" <c:if test="${m.addr eq '대구'}">selected</c:if>>대구</option>
									<option value="울산" <c:if test="${m.addr eq '울산'}">selected</c:if>>울산</option>
									<option value="강원" <c:if test="${m.addr eq '강원'}">selected</c:if>>강원</option>
									<option value="충북" <c:if test="${m.addr eq '충북'}">selected</c:if>>충북</option>
									<option value="충남" <c:if test="${m.addr eq '충남'}">selected</c:if>>충남</option>
									<option value="전북" <c:if test="${m.addr eq '전북'}">selected</c:if>>전북</option>
									<option value="전남" <c:if test="${m.addr eq '전남'}">selected</c:if>>전남</option>
									<option value="경북" <c:if test="${m.addr eq '경북'}">selected</c:if>>경북</option>
									<option value="경남" <c:if test="${m.addr eq '경남'}">selected</c:if>>경남</option>
									<option value="제주" <c:if test="${m.addr eq '제주'}">selected</c:if>>제주</option>
									<option value="세종" <c:if test="${m.addr eq '세종'}">selected</c:if>>세종</option>
								</select>
							</div>
						</td>
					</tr>
				</table>
				<div class="col-md-12 mb-3">
					<button type="submit" class="btn btn-dark">내 정보 수정</button>
					<button type="button" class="btn btn-danger" onclick="delMem()">회원 탈퇴</button>
				</div>
			</div>
			<input type="hidden" name="id" value="${sessionScope.id }">
		</form>
	</section>
	<c:import url="../footer.jsp"></c:import>
</body>
</html>