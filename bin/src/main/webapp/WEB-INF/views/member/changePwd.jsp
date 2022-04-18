<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>With: ��й�ȣ �����ϱ�</title>
<c:import url="../head.jsp"></c:import>
<link rel="stylesheet" href="/static/css/member_msg.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var chkp = false;
function btnSet() {
	$("#edit").attr("disabled", true);
	if(chkp){
		$("#edit").attr("disabled", false);
	}
}

function chkPwd() {
	if($("#user_pwd").val() != $("#pwdCheck").val()){
		$("#pwd2Result").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		chkp = false;
	}else{
		$("#pwd2Result").empty();
		chkp = true;
	}
}
$(document).ready(function(){
	/* $('input[type="text"]').keydown(function(){
		if(event.keyCode === 13){
			event.preventDefault();
		}
	}); */
	$("#user_pwd").on("change", function(){
		chkp = false;
		$("#pwd1Result").empty();
		$("#pwd2Result").empty();
		if($("#user_pwd").val() == ""){
			$("#pwd1Result").text("�ʼ� �����Դϴ�.");
		}else if($("#pwdCheck").val() != "") {
			chkPwd();
		}
		btnSet();
	});
	 $("#pwdCheck").on("change", function () {
         chkp = false;
         $("#pwd2Result").empty();
         if ($("#pwdCheck").val() == "") {
             $("#pwd2Result").text("�ʼ� �����Դϴ�.");
         } else {
             chkPwd();
         }
         btnSet();
     });
});


</script>
</head>
<body>
<c:import url="../header.jsp"></c:import>
<section class="py-5">
<div class="container">
   <form action="/member/changePwd" method="post">
      <div class="mb-3 col-md-3">
         <label for="user_pwd" class="form-label">���ο� ��й�ȣ</label>
         <input type="password" class="form-control" id="user_pwd" name="pwd" />
         <span id="pwd1Result" class="msg"></span>
      </div>
       <div class="mb-3 col-md-3">
         <label for="pwdCheck" class="form-label">��й�ȣ Ȯ��</label>
         <input type="password" class="form-control" id="pwdCheck" name="pwd2" />
         <span id="pwd2Result" class="msg"></span>
      </div>
      <button type="submit" id="edit" class="btn btn-primary btn" disabled="disabled">��й�ȣ �����ϱ�</button>
      <input type="hidden" name="id" value="${id }" />
   </form>
</div>
</section>
<c:import url="../footer.jsp"></c:import>
</body>
</html>