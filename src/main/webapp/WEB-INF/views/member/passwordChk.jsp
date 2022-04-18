<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>With: ��й�ȣ Ȯ��</title>
<c:import url="../head.jsp"></c:import>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('input[type="text"]').keydown(function(){
	if(event.keyCode===13){
		event.preventDefault();
	}
	});
	$("#submit").click(function(){
		$.ajax({
			url: "/member/pwdChk",
			type: "post",
			data: { pwd: $("#user_pwd").val()},
			success: function (data){
				if(data.res == "ok") {
					$("#form").submit();
				}else{
					alert("�н����带 Ȯ�����ּ���!");
					document.getElementById("user_pwd").value = "";
				}
			},
		});
	});
	$("#form").submit(function (e){
		e.preventDefault();
		$.ajax({
			url: "/member/pwdChk",
			type: "post",
			data: { pwd: $("#user_pwd").val() },
			success: function(data) {
				if(data.res == "ok") {
					location.href = "/member/editForm";
				} else {
					alert("�н����带 Ȯ�����ּ���!");
					document.getElementById("").value = "";
					document.getElementById("user_pwd").focus();
				}
			},
		});
	});
	
});
</script>
</head>
<body>
	<c:import url="../header.jsp"></c:import>
	<section class="py-5">
		<div class="container">
			<div class="py-3">
				<h1>��й�ȣ Ȯ��</h1>
			</div>
			<form id="form">
				<div class="col-md-6 input-group" style="width: 40%">
					<input type="password" name="user_pwd" id="user_pwd" class="form-control" placeholder="��й�ȣ�� �Է��ϼ���." />
					<button class="btn btn-outline-secondary" type="submit">Ȯ��</button>
				</div>
			</form>
		</div>
	</section>
	<c:import url="../footer.jsp"></c:import>
</body>
</html>