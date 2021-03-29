<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class = "home_1">
	<ul class="breadcrumb">
		<li><span class="glyphicon glyphicon-home"></span>&emsp;当前位置：</li>
		<li><a class="active">老师管理</a></li>
	</ul>
	<div class="col-lg-3">
		<div class="input-group">
			<span class="input-group-addon">行数</span>
			<input type="text" class="form-control" id="hs" value="${size}" onchange="hs(this.value)" />
			<span id = "teacher" class = "input-group-addon" data-toggle="modal" data-target="#exampleModal1"><span class="glyphicon glyphicon-plus"></span>添加老师</span>
		</div>
	</div>
	<div class="col-lg-5 col-lg-offset-4">
		<div class="col-md-12">
			<div class="input-group">
				<span class="input-group-addon">搜索   <span class="glyphicon glyphicon-search"></span></span>
				<input type="text" onblur="ss(this.value)" onchange="ss(this.value)" class="form-control" placeholder="请输入关键字" />
			</div>
		</div>
	</div><br><br><br>
	
	<c:if test="${teacher.size() != 0}">
		<table class="table table-bordered table-striped table-hover table-condensed">
			<tr>
				<td>老师姓名</td><td>用户名</td><td>操作</td>
			</tr>
			<c:forEach items="${teacher}" var = "c">
				<tr>
					<td>${c.name}</td>
					<td>${c.username}</td>
					<td>
						<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#exampleModal1" onclick="edit(${c.id})"><span class="glyphicon glyphicon-pencil"></span>修改</button>
						<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#exampleModal2" onclick="del(${c.id})"><span class="glyphicon glyphicon-trash"></span>删除</button>
						<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#exampleModal4" onclick="cz(${c.id})"><span class="glyphicon glyphicon-retweet"></span>重置密码</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	第${number}/${totalPages}页 &emsp;&emsp;总共${getTotalElements}条数据<br>
	<ul class="pagination">
		<c:forEach var="i" begin="1" end="${totalPages}" step="1">
			<li onclick="ys(this.value)" value="${i}" ${number == i ? "class='active'":""}><a>${i}</a></li>
		</c:forEach>
	</ul>
</div>

<div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<input type="hidden" id = "cz_id">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">警告</h4>
			</div>
			<div class="modal-body">
				<center>是否确定重置密码！</center>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="cz" class="btn btn-primary">确定</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<input type="hidden" id = "del_id">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">警告</h4>
			</div>
			<div class="modal-body">
				<center>是否确定删除！</center>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="delete" class="btn btn-primary">确定</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form class="form-horizontal bv-form cmxform" method="post" onsubmit="return false">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="exampleModalLabel">添加老师</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" name = "id" id = "teacher_id">
					<input type="hidden" name = "password" value="123456" id = "mima1">
					<div class="form-group">
						<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">老师姓名:</label>
						<div class="col-sm-8"><input type="text" name="name" id="name" class="form-control" placeholder="老师姓名" required></div>
						<div><label id="name-error" class="error col-lg-offset-4" for="name"></label></div>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">用户名:</label>
						<div class="col-sm-8"><input type="text" name="username" id="username" class="form-control" placeholder="用户名" onchange = "fun(this.value)" required></div>
						<div><label id="username-error" class="error col-lg-offset-4" for="username"></label></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" id = "teacher_add" class="btn btn-primary">确定</button>
					<button type="reset" class="btn btn-default">重置</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("#teacher").click(function(){
		close();
		edit();
	})
	
	function cz(id){
		$("#cz_id").val(id);
	}
	
	function ys(ys){
		var str = $("#ss_test").val();
		var hs = $("#hs").val();
		$("#home").load("teacher/main?ys="+ys+"&hs="+hs+"&str="+str);
	}
	
	function hs(hs){
		var str = $("#ss_test").val();
		if(hs > 0){
			$("#home").load("teacher/main?hs="+hs+"&str="+str);			
		}
	}
	
	function ss(str){
		var hs = $("#hs").val();
		$("#ss_test").val(str);
		$("#home").load("teacher/main?str="+str+"&hs="+hs);
	}
	
	$("#cz").click(function(){
		$(".modal-backdrop.in").remove();
		$(".modal-open").removeClass("modal-open");
		var id = $("#cz_id").val();
		alert("重置成功！");
		$("#home").load("teacher/cz?id="+id);
	})

	$("#delete").click(function(){
		$(".modal-backdrop.in").remove();
		$(".modal-open").removeClass("modal-open");
		var id = $("#del_id").val();
		$("#home").load("teacher/delete?id="+id);
	})
	
	function del(id){
		$("#del_id").val(id);
	}
	
	function edit(id){
		close();
		$.post('teacher/edit', {id: id}, function(data){
			$('#name').val(data.teacher.name);
			$('#username').val(data.teacher.username);
			$('#teacher_id').val(data.teacher.id);
			if(data.teacher.password != null){
				$('#mima1').val(data.teacher.password);
			}
		});
	}
	
	function fun(username){
		$("#username-error").html("");
		$.post('teacher/name', {username: username}, function(data){
			$("#username-error").html(data.error);
		});
	}
	
	function close(){
		$("#name-error").html("");
		$("#username-error").html("");
	}
	
	$("#teacher_add").click(function(){
		var name = $("#name").val();
		var username = $("#username").val();
		var a = 1;
		if(name == ""){
			$("#name-error").html("请输入姓名");
			a = 0;
		}
		if(username == ""){
			$("#username-error").html("请输入用户名");
			a = 0;
		}
		var obj = $("#username-error").html();
		if(obj != ""){
			a = 0;
		}
		var data = $("form").serialize();
		if(a == 1){
			$(".modal-backdrop.in").remove();
			$(".modal-open").removeClass("modal-open");
	        $.ajax( {
	            type : 'POST',
	            url : 'teacher/save',
	            data : data,
	            success : function(msg) {
	            	$("#home").html(msg);
	            }
	        });
		}
	})
</script>
