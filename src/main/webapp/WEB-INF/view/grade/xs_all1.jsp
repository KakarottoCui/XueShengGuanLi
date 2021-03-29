<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${xs_all.size() != 0}">
	<option>--请选择--</option>
	<c:forEach items="${xs_all}" var = "b">
		<option value="${b.id}">${b.name}</option>
	</c:forEach>
</c:if>
