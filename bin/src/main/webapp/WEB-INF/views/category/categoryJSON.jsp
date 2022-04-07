<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
[
	<c:forEach var="i" items="${cate_list }" varStatus="status">
		<c:if test="${not status.first }">
			,
		</c:if>
		{"category_num":${i.category_num }, "category_name":"${i.category_name }"}
	</c:forEach>
]
