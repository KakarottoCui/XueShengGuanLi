<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${grade.size() != 0}">
	<table class="table table-bordered table-striped table-hover table-condensed">
		<tr>
			<td>课程</td><td>成绩</td>
		</tr>
		<c:forEach items="${grade}" var="c">
			<tr>
				<td width="40%">${c.course.name}</td>
				<td>
				   	<input type="text" onchange = "fun_1(this.value, ${c.id})" value="${c.grade}" name="grade" class="form-control" placeholder="成绩" >
				</td>
			</tr>
		</c:forEach>
	</table>
</c:if>

<script type = "text/javascript">
	function fun_1(grade, id){
		$.post("grade/updata1?grade="+grade+"&id="+id);
	}
</script>
