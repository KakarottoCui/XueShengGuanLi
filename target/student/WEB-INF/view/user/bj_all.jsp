<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="home_1">
	<ul class="breadcrumb">
		<li><span class="glyphicon glyphicon-home"></span>&emsp;当前位置：</li>
		<li><a class="active">查看班级成员</a></li>
	</ul>
	<c:if test="${bj_all.size() != 0}">
	    <table class="table table-bordered table-striped table-hover table-condensed">
			<tr>
				<td>班级</td><td>姓名</td><td>学号</td><td>性别</td><td>职务</td>
			</tr>
			<c:forEach items="${bj_all}" var="c">
				<tr>
					<td>${c.tbClass.name}</td>
					<td>${c.name}</td>
					<td>${c.username}</td>
					<td>${c.sex}</td>
					<td>${c.zw}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
