<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="home_1">
	<ul class="breadcrumb">
		<li><span class="glyphicon glyphicon-home"></span>&emsp;当前位置：</li>
		<li><a class="active">修改成绩</a></li>
	</ul>
	<div class="input-group col-md-7">
		<span class="input-group-addon">请选择班级</span>
		<select id="tbClass_id" name="tbClass" class="form-control" onchange="fun()">
			<c:forEach items="${tbClass}" var = "b">
				<option value="${b.id}">${b.name}</option>
			</c:forEach>
		</select>
		<span class="input-group-addon">请选择学生</span>
		<select id="student_id" name="student" class="form-control" onchange="fun_2()">
			
		</select>
	</div><br>
	
	<div id="xs_all"></div>
	
<script type="text/javascript">
	fun();
	
	function fun(){
		$("#xs_all").html("");
		var tbClass_id = $("#tbClass_id").val();
		$("#student_id").load("student/xs_all?id="+tbClass_id);
	}
	
	function fun_2(){
		var xs_id = $("#student_id").val();
		if(xs_id == "--请选择--"){
			$("#xs_all").html("");
		}else{
			$("#xs_all").load("grade/xg?id="+xs_id);
		}
	}
</script>
</div>
    