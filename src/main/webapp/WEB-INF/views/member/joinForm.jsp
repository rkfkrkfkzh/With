<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>>With: 회원가입</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<c:import url="../head.jsp" />
<script>
	var cId = false;
	var cPwd = false;
	var cNick = false;
	var cTel = false;
	const autoHyphen2 = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		}
	function allCheck() {
		if (cId && cPwd && cNick && cTel) {
			return true;
		} else {
			alert("양식에 맞게 입력해주세요.")
			return false;
		}
	}

	$(document)
			.ready(
					function() {
						$("#id")
								.change(
										function() {
											var value = $(this).val();
											var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

											if (!regExp.test(value)) {
												$("#id").addClass("is-invalid");
												$("#id")
														.removeClass("is-valid");
												cId = false;
											} else {
												$("#id").removeClass(
														"is-invalid");

												$
														.ajax({
															url : '/member/idCheck',
															type : 'post',
															data : {
																id : value
															},
															success : function(
																	data) {
																if (data == 1) {
																	$("#id")
																			.addClass(
																					"is-valid");
																	$("#id")
																			.removeClass(
																					"is-invalid");
																	cId = true;
																} else {
																	$("#id")
																			.addClass(
																					"is-invalid");
																	$("#id")
																			.removeClass(
																					"is-valid");
																	cId = false;
																}
															}
														});
											}
										});

						$("#pwd, #pwd2")
								.change(
										function() {
											var p1 = $("#pwd").val();
											var p2 = $("#pwd2").val();

											var value = $(this).val();
											var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

											if (!regExp.test(value)) {
												$("#pwd")
														.addClass("is-invalid");
												cPwd = false;
											} else {
												$("#pwd").removeClass(
														"is-invalid");
												cPwd = true;
											}
											if (p1 != p2) {
												$("#pwd1").addClass(
														"is-invalid");
												$("#pwd2").addClass(
														"is-invalid");
												$("#pwd2").focus();
												cPwd = false;
											} else {
												$("#pwd1").removeClass(
														"is-invalid");
												$("#pwd2").removeClass(
														"is-invalid");
												cPwd = true;
											}
										});

						$("#tel")
								.change(
										function() {
											var value = $(this).val();
											var regExp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

											if (!regExp.test(value)) {
												$("#tel")
														.addClass("is-invalid");
												cTel = false;
											} else {
												$("#tel").removeClass(
														"is-invalid");
												cTel = true;
											}
										});

						$("#nick").change(function() {
							var nickName = $(this).val();

							$.ajax({
								url : '/member/nickCheck',
								type : 'post',
								data : {
									nick : nickName
								},
								success : function(data) {
									if (data == 0) {
										$("#nick").addClass("is-valid");
										$("#nick").removeClass("is-invalid");
										cNick = true;
									} else {
										$("#nick").addClass("is-invalid");
										$("#nick").removeClass("is-valid");
										cTel = false;
									}
								}

							});
						});
					});
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<section class="py-5">
		<form action="${pageContext.request.contextPath }/member/join" method="post" class="needs-validation" onsubmit="return allCheck()">
			<div class="container px-4 px-lg-5 mt-5 container1 col-md-6">
				<div class="col-md-12 mb-3" style="text-align: center">
					<h3>
						<b>회원 가입</b>
					</h3>
				</div>
				<div class="col-md-12 mb-3" style="text-align: right; padding-left: 15%; padding-right: 15%">
					<input type="text" required id="id" name="id" class="form-control w-100" placeholder="아이디">
					<div class="invalid-feedback">이메일 형식이 아니거나, 중복된 아이디입니다.</div>
					<div class="valid-feedback">사용 가능한 아이디입니다.</div>
				</div>
				<div class="col-md-12 mb-3" style="text-align: right; padding-left: 15%; padding-right: 15%">
					<input type="password" id="pwd" required name="pwd" class="form-control w-100" placeholder="비밀번호">
					<div class="invalid-feedback">최소 8 자, 하나 이상의 대문자, 하나의 소문자, 하나의 숫자 및 하나의 특수 문자를 넣어주세요.</div>
				</div>
				<div class="col-md-12 mb-3" style="text-align: right; padding-left: 15%; padding-right: 15%">
					<input type="password" id="pwd2" required class="form-control w-100" placeholder="비밀번호 확인">
					<div class="invalid-feedback">비밀번호가 다릅니다.</div>
				</div>
				<div class="col-md-12 mb-3" style="text-align: right">
					<div style="padding-left: 15%; padding-right: 15%">
						<input type="text" id="name" required name="name" class="form-control w-100" placeholder="이름">
					</div>
				</div>
				<div class="col-md-12 mb-3" style="text-align: right; padding-left: 15%; padding-right: 15%">
					<input type="text" id="nick" required name="nick" class="form-control w-100" placeholder="닉네임">
					<div class="invalid-feedback">사용할 수 없는 닉네임입니다.</div>
					<div class="valid-feedback">사용 가능한 닉네임입니다.</div>

				</div>
				<div class="col-md-12 mb-3" style="text-align: right; padding-left: 15%; padding-right: 15%">
					<input type="text" id="tel" required name="tel" class="form-control w-100" placeholder="휴대폰 번호( - 제외)" oninput="autoHyphen2(this)" maxlength="13">
					<div class="invalid-feedback">휴대폰 번호를 정확히 입력해주세요(-제외)</div>
				</div>
				<div class="col-md-12 mb-3" style="padding-left: 15%; padding-right: 15%">
					<select class="form-select" id="addr" name="addr">
						<option value="서울" selected>서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="부산">부산</option>
						<option value="대전">대전</option>
						<option value="광주">광주</option>
						<option value="대구">대구</option>
						<option value="울산">울산</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="제주">제주</option>
						<option value="세종">세종</option>
					</select>
				</div>
				<div class="col-md-12 mb-3" style="padding-left: 15%; padding-right: 15%">

					<input type="radio" name="type" value="2">
					관리자
					<input type="radio" name="type" value="1" checked>
					사용자

				</div>
				<div class="col-md-12 mb-3" style="padding-left: 15%; padding-right: 15%">

					<button type="submit" id="joinBtn" class="btn btn-dark">회원 가입</button>
				</div>
			</div>
		</form>
	</section>
	<c:import url="../footer.jsp"></c:import>
</body>
</html>