<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>With: 위드 - 제품 목록</title>
<c:import url="../head.jsp"></c:import>
<link rel="stylesheet" href="/static/css/product_list.css" />
<script>
function checkSearch() {
	var num = "${checkNum}";
		if(num == 1) {
			$("#pSearchForm").attr("action", "${pageContext.request.contextPath}/product/search2");
			var inputC1 = $("<input type='hidden' name='checkNum' id='checkNum' value='${checkNum }'>");
			var inputC2 = $("<input type='hidden' name='c_num' id='c_num' value='${c_num }'>");
			var inputC3 = $("<input type='hidden' name='c_name' id='c_name' value='${c_name }'>");
			$("#pSearchForm").append(inputC1).append(inputC2).append(inputC3);
		}
	}

	$(document).ready(function() {
		$.ajax({
			url : '/category/getCategory',
			type : 'get',
			data : {
				category_type: 1,
				parent_category_num: 0
			},
			success : function(data) {
				var list = $.parseJSON(data);
				var html = "";
				
				for(i = 0 ; i < list.length ; i++) {
					html += "<option value='" + list[i].category_num + "'>" +  list[i].category_name + "</option>";
				}
				
				$("#cate1").append(html);
				
				if("${c_name}" == "c2") {
					if("${cate.parent_category_num}" != null && !"${cate.parent_category_num}" == "") {
						$("#cate1").val("${cate.parent_category_num}").prop("selected", true);
						$("#cate1").val("${cate.parent_category_num}").trigger('change');
					}
				} else {
					if("${c_num}" == null || "${c_num}" == "") {
						$("#cate1 option:eq(0)").prop("selected", true);
					} else {
						$("#cate1").val("${c_num}").prop("selected", true);
						$("#cate1").val("${c_num}").trigger('change');
					}
				}
			}
		});
		
		$("#cate1").change(function() {
			var v = this.value;
			if($("#cate1 option").index($("#cate1 option:selected")) == 0) {
				$("#cate2").empty();
				var html = "<option>선택</option>";
				$("#cate2").append(html);
			
			} else {
				$.ajax({
					url: '/category/getCategory',
					data: {
						category_type: 2,
						parent_category_num: v
					},
					success: function(data) {
						var list = $.parseJSON(data);
						var html = "";
						$("#cate2").empty();
						html += "<option>선택</option>";
						for(i = 0 ; i < list.length ; i++) {
							html += "<option value='" + list[i].category_num + "'>" +  list[i].category_name + "</option>";
						}
						$("#cate2").append(html);

						if("${cate}" != null && !"${cate}" == "") {
							$("#cate2").val("${cate.category_num}").prop("selected", true);
						}
						
						if($("#cate2").val("${cate.category_num}").val() == undefined) {
							$("#cate2 option:eq(0)").prop("selected", true);
						}
					}
				});
			}
		});
		
		$("#searchCate").click(function() {
			if($("#cate1 option").index($("#cate1 option:selected")) == 0) {
				alert("카테고리를 다시 선택하세요.");
				return false;
			}

			var nForm = document.createElement('form');
			nForm.name = 'nForm';
			nForm.method = 'get';
			nForm.action="${pageContext.request.contextPath}/product/search2";
			
			var input1 = document.createElement('input');
			var input2 = document.createElement('input');
			
			if($("#cate2 option").index($("#cate2 option:selected")) == 0) {
				input1.setAttribute("type", "hidden");
				input1.setAttribute("name", "c_name");
				input1.setAttribute("value", "c1");
				
				input2.setAttribute("type", "hidden");
				input2.setAttribute("name", "c_num");
				input2.setAttribute("value", $("#cate1").val());			
			} else {
				input1.setAttribute("type", "hidden");
				input1.setAttribute("name", "c_name");
				input1.setAttribute("value", "c2");
				
				input2.setAttribute("type", "hidden");
				input2.setAttribute("name", "c_num");
				input2.setAttribute("value", $("#cate2").val());	
			}
			
			nForm.appendChild(input1);
			nForm.appendChild(input2);
			
			document.body.appendChild(nForm);
			
			nForm.submit();
		});
		
		$('[data-toggle="popover"]' ).popover({ delay: { "show": 500, "hide": 100 } });
		$('[data-toggle="popover"]' ).popover();
	});
</script>
</head>
<body>
   <c:import url="../header.jsp"></c:import>
   <section class="py-5">
      <div class="container">
         <!-- 검색 Form -->
         <div class="search-form text-center">
            <form action="${pageContext.request.contextPath}/product/search"
               method="get" onsubmit="return checkSearch()" id="pSearchForm">
               <select class="form-select" name="q" id="q" aria-label="query">
                  <option ${q=='product_title' ? 'selected' : '' }
                     value="product_title">제품 이름</option>
                  <option ${q=='product_nick' ? 'selected' : '' }
                     value="product_nick">판매자 닉네임</option></select>
                  
                <input class="form-control" type="text" placeholder="검색..."
                  name="value" aria-label="검색" />
               <button type="submit" class="btn btn-outline-primary">검색</button>
            </form>
         </div>
         <!-- 페이지 제목 -->
         <div class="py-3">
         <div style="display: inline-block">
            <h1>제품목록</h1>
         </div>
         <div id="cList" style="float: right;">
					<select id="cate1" class="mx-1">
						<option>선택</option>
					</select> <select id="cate2" class="mx-1">
						<option>선택</option>
					</select>
					<button id="searchCate" type="button" class="btn btn-dark btn-sm">조회</button>
				</div>
			</div>
         <c:import url="./importList.jsp">
         </c:import>
      </div>
   </section>
   <c:import url="../footer.jsp"></c:import>
</body>
</html>