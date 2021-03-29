<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class = "col-md-6 col-md-offset-3">
		<div style="margin: 0px auto; margin-top: 130px;">
			<ul class="breadcrumb">
				<li><span class="glyphicon glyphicon-home"></span>&emsp;当前位置：</li>
				<li><a>设置</a></li>
				<li><a class="active">修改密码</a></li>
			</ul>
			<div class="input-group">
				<span class="input-group-addon">请输入原密码：</span>
				<input type="text" class="form-control" id="pad" placeholder="原密码">
			</div>
			<div class="col-md-offset-2"><label id="pad-error" class="error" for="pad"></label></div><br>
			<div class="input-group">
				<span class="input-group-addon">请输入新密码：</span>
				<input type="text" class="form-control" id="pad1" placeholder="新密码">
			</div>
			<div class="col-md-offset-2"><label id="pad1-error" class="error" for="pad1"></label></div><br>
			<div class="input-group">
				<span class="input-group-addon">请确认密码：</span>
				<input type="text" class="form-control" id="pad2" placeholder="确认密码">
			</div>
			<div class="col-md-offset-2"><label id="pad2-error" class="error" for="pad2"></label></div><br>
			<input type="hidden" id = "pass" value="${user.password}">
			<input type="hidden" id = "sf" value="${user.sf}">
			<input type="hidden" id = "id" value="${user.id}">
			<center><button type="button" id = "btn_1" class="btn btn-primary" style="width:200px;">确定</button></center>
		</div>
</div>

<script type="text/javascript">
	$("#btn_1").click(function(){
		$("#pad-error").html("");
		$("#pad1-error").html("");
		$("#pad2-error").html("");
		var pad = $("#pad").val();
		var pad1 = $("#pad1").val();
		var pad2 = $("#pad2").val();
		var password = $("#pass").val();
		var sf = $("#sf").val();
		var id = $("#id").val();
		var a = 1;
		if(pad == ""){
			$("#pad-error").html("请输入原密码！");
			a = 0;
		}else if(pad != password){
			$("#pad-error").html("原密码输入错误！");
			a = 0;
		}
		if(pad1 == ""){
			$("#pad1-error").html("请输入新原密码！");
			a = 0;
		}
		if(pad2 == ""){
			$("#pad2-error").html("请再次输入新原密码！");
			a = 0;
		}else if(pad1 != pad2){
			$("#pad2-error").html("两次密码不一致！");
			a = 0;
		}
		if(a != 0){
			alert("修改成功！");
			window.location.href="xg?pad="+pad1+"&sf="+sf+"&id="+id;
		}
	})
</script>
    