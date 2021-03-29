<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${student.size() != 0}">
	<table class="table table-bordered table-striped table-hover table-condensed">
		<tr>
			<td>姓名</td><td>成绩</td>
		</tr>
		<c:forEach items="${student}" var="c">
			<tr>
				<td width="40%">${c.name}</td>
				<td>
				   	<input type="text" onchange = "fun_1(this.value, ${c.id})" name="grade" value="${c.cj}" class="form-control" placeholder="成绩" >
				</td>
			</tr>
		</c:forEach>
	</table>
</c:if>

<script type = "text/javascript">
	function fun_1(grade, xs_id){
		var kc_id = $("#course_id").val();
		$.post("grade/save?grade="+grade+"&kc_id="+kc_id+"&xs_id="+xs_id);
	}
</script>
