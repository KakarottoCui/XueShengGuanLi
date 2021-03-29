<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="home_1">
	<ul class="breadcrumb">
		<li><span class="glyphicon glyphicon-home"></span>&emsp;当前位置：</li>
		<li><a>设置</a></li>
		<li><a class="active">查看班级成绩</a></li>
	</ul>
	<c:if test="${grade.size() != 0}">
		<table class="table table-bordered table-striped table-hover table-condensed">
			<tr>
				<td>姓名</td><td>学号</td><td>课程</td><td>成绩</td>
			</tr>
			<c:forEach items="${grade}" var = "c">
				<tr>
					<td>${c.student.name}</td>
					<td>${c.student.username}</td>
					<td>${c.course.name}</td>
					<td>${c.grade}</td>				
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
