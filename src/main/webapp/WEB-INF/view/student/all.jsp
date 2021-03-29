<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${student.size() != 0}">
    <table class="table table-bordered table-striped table-hover table-condensed">
		<tr>
			<td>id</td><td>姓名</td><td>学号</td><td>性别</td><td>职务</td><td>班级</td><td>操作</td>
		</tr>
		<c:forEach items="${student}" var="c">
			<tr>
				<td>${c.id}</td>
				<td>${c.name}</td>
				<td>${c.username}</td>
				<td>${c.sex}</td>
				<td>${c.zw}</td>
				<td>${c.tbClass.name}</td>
				<td>
				   	<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#exampleModal1" onclick="edit(${c.id})"><span class="glyphicon glyphicon-pencil"></span>修改</button>
				   	<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#exampleModal2" onclick="del(${c.id})"><span class="glyphicon glyphicon-trash"></span>删除</button>
				   	<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#exampleModal4" onclick="cz(${c.id})"><span class="glyphicon glyphicon-retweet"></span>重置密码</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</c:if>

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
				<button type="button" id="delete" data-dismiss="modal" class="btn btn-primary">确定</button>
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
					<h4 class="modal-title" id="exampleModalLabel">添加学生</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" name = "tbClass.id" id = "bj_id">
					<input type="hidden" name = "id" id = "xs_id">
					<input type="hidden" name = "password" value="123456" id = "mima">
					<input type="hidden" name = "sf" value="0">
					<div class="form-group">
						<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">姓名:</label>
						<div class="col-sm-8"><input type="text" name="name" id="name" class="form-control" placeholder="姓名" required></div>
						<div><label id="name-error" class="error col-lg-offset-4" for="name"></label></div>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">学号:</label>
						<div class="col-sm-8"><input type="text" name="username" id="username" class="form-control" placeholder="学号" onchange = "fun_1(this.value)" required></div>
						<div><label id="username-error" class="error col-lg-offset-4" for="username"></label></div>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">性别:</label>
						<div class="col-sm-8">
							<select class="form-control" name="sex">
		                    	<option id = "nan">男</option>
		                    	<option id = "nv">女</option>
		                    </select>
						</div>
					</div><br>
					<div class="form-group">
						<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">职务:</label>
						<div class="col-sm-8"><input type="text" name="zw" id="zw" class="form-control" placeholder="职务"></div>
						<div><label id="zw-error" class="error col-lg-offset-4" for="zw"></label></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id = "student_add" class="btn btn-primary">确定</button>
					<button type="reset" class="btn btn-default">重置</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	function del(id){
		$("#del_id").val(id);
	}
	
	function cz(id){
		$("#cz_id").val(id);
	}
	
	function edit(id){
		$("#nv").removeAttr("selected");
		close();
		$.post('student/edit', {id: id}, function(data){
			$('#name').val(data.student.name);
			$('#username').val(data.student.username);
			$('#zw').val(data.student.zw);
			$('#xs_id').val(data.student.id);
			if(data.student.password != null){
				$('#mima').val(data.student.password);
			}
			var obj = $("#tbClass_id").val();
			$("#bj_id").val(obj);
			if(data.student.sex == "女"){
				$("#nv").attr("selected", "selected");
			}
		});
	}
	
	$("#delete").click(function(){
		$(".modal-backdrop.in").remove();
		$(".modal-open").removeClass("modal-open");
		var id = $("#del_id").val();
		var bj_id = $("#tbClass_id").val();
		$("#studentAll").load("student/delete?id="+id+"&bj_id="+bj_id);
	})
	
	$("#cz").click(function(){
		$(".modal-backdrop.in").remove();
		$(".modal-open").removeClass("modal-open");
		var id = $("#cz_id").val();
		var bj_id = $("#tbClass_id").val();
		alert("重置成功！");
		$("#studentAll").load("student/cz?id="+id+"&bj_id="+bj_id);
	})

	$("#student_add").click(function(){
		var name = $("#name").val();
		var username = $("#username").val();
		var a = 1;
		if(name == ""){
			$("#name-error").html("请输入姓名");
			a = 0;
		}
		if(username == ""){
			$("#username-error").html("请输入学号");
			a = 0;
		}
		var obj = $("#username-error").html();
		if(obj != ""){
			a = 0;
		}
		var data = $("form").serialize();
		if(a == 1){
			$("#nv").removeAttr("selected");
			$(".modal-backdrop.in").remove();
			$(".modal-open").removeClass("modal-open");
	        $.ajax( {
	            type : 'POST',
	            url : 'student/save',
	            data : data,
	            success : function(msg) {
	            	$("#studentAll").html(msg);
	            }
	        });
		}
	})
</script>
	