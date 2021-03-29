<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="home_1">
	<ul class="breadcrumb">
		<li><span class="glyphicon glyphicon-home"></span>&emsp;当前位置：</li>
		<li><a>设置</a></li>
		<li><a class="active">学生管理</a></li>
	</ul>
	<dvi class="col-md-5">
		<div class="input-group">
			<span class="input-group-addon">请选择班级</span>
			<select id="tbClass_id" name="tbClass" class="form-control" onchange="fun()">
				<c:forEach items="${tbClass}" var = "b">
					<option value="${b.id}">${b.name}(${b.teacher})</option>
				</c:forEach>
			</select>
			<span id = "student" class = "input-group-addon btn btn-primary" data-toggle="modal" data-target="#exampleModal1"><span class="glyphicon glyphicon-plus"></span>添加学生</span>
		</div>
	</dvi>
	<!-- <div class="col-lg-5 col-lg-offset-2">
		<div class="col-md-12">
			<div class="input-group">
				<span class="input-group-addon">搜索   <span class="glyphicon glyphicon-search"></span></span>
				<input type="text" onblur="ss(this.value)" onchange="ss(this.value)" class="form-control" placeholder="请输入关键字" />
			</div>
		</div>
	</div> --><br><br><br>
	<div id = "studentAll"></div>
</div>

<script type="text/javascript">
	fun();

	$("#student").click(function(){
		var obj = $("#tbClass_id").val();
		$("#bj_id").val(obj);
		$("#mima").val(pwd);
		close();
		edit();
	})
	
	function ss(str){
		$("#studentAll").load("student/cz?str="+str);
	}
	
	function fun(){
		var str = $("#tbClass_id").val();
		$("#studentAll").load("student/all?id="+str);
	}
	
	function fun_1(username){
		$("#username-error").html("");
		$.post('student/username', {username: username}, function(data){
			$("#username-error").html(data.error);
		});
	}
	
	function close(){
		$("#name-error").html("");
		$("#username-error").html("");
	}
</script>
