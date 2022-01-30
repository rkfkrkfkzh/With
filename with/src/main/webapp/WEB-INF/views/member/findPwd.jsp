<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>With: ��й�ȣ ã��</title>
<c:import url="../head.jsp"></c:import>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){	
	$('input[type="text"]').change(function(){
		var box = $(this).val();
		var c = "id";
		$("#"+box).show();
		$("#"+box+"_ip")[0].focus();
		$("#"+c).hide();
		console.log($("#"+box+"_ip").val());
	});
	<c:if test="${not empty error}">
    alert("${error}")
    </c:if>	
});

</script>
</head>
<body>
   <c:import url="../header.jsp"></c:import>
   <section class="py-5">
       <div class="container">
           <h1>��й�ȣ ã��</h1>
           
           <form action="/member/findPwd" method="post">
            <div class="mb-3 col-md-3">
                        <!-- <label for="user_id" class="form-label">���̵�</label> -->

                        <input
                            type="text"
                            class="form-control"
                            id="id"
                            name="id"
                            placeholder="���̵�(�̸���)�� �Է��ϼ���."
                        />
                        <button class="btn btn-outline-secondary" type="submit">Ȯ��</button>
                    </div>
            </form>             
         </div>        
   </section>
   <c:import url="../footer.jsp"></c:import>
</body>
</html>