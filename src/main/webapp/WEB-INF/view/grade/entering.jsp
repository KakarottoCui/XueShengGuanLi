<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="home_1">
	<ul class="breadcrumb">
		<li><span class="glyphicon glyphicon-home"></span>&emsp;当前位置：</li>
		<li><a class="active">录入成绩</a></li>
	</ul>
	<div class="input-group col-md-7">
		<span class="input-group-addon">请选择班级</span>
		<select id="tbClass_id" name="tbClass" style="margin-right: 10px;" class="form-control" onchange="fun()">
			<c:forEach items="${tbClass}" var = "b">
				<option value="${b.id}">${b.name}</option>
			</c:forEach>
		</select>
		<span class="input-group-addon">请选择课程</span>
		<select id="course_id" name="course" class="form-control" onchange="fun()">
			<c:forEach items="${course}" var = "b">
				<option value="${b.id}">${b.name}</option>
			</c:forEach>
		</select>
	</div><br>
	
	<div id="xs_all"></div>
</div>

<script type="text/javascript">
	fun();

	function fun(){
		var tbClass_id = $("#tbClass_id").val();
		var course_id = $("#course_id").val();
		$("#xs_all").load("grade/xs_all?tbClass_id="+tbClass_id+"&course_id="+course_id);
	}
	
</script>
