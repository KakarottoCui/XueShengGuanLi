<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class = "home_1">
	<ul class="breadcrumb">
		<li><span class="glyphicon glyphicon-home"></span>&emsp;当前位置：</li>
		<li><a class="active">课程管理</a></li>
	</ul>
	<div class="col-lg-3">
		<div class="input-group">
			<span class="input-group-addon">行数</span>
			<input type="text" class="form-control" id="hs" value="${size}" onchange="hs(this.value)" />
			<span id = "course" class = "input-group-addon" data-toggle="modal" data-target="#exampleModal1"><span class="glyphicon glyphicon-plus"></span>添加课程</span>			
		</div>
	</div>
	<div class="col-lg-5 col-lg-offset-4">
		<div class="col-md-12">
			<div class="input-group">
				<span class="input-group-addon">搜索   <span class="glyphicon glyphicon-search"></span></span>
				<input type="text" onblur="cz(this.value)" onchange="cz(this.value)" class="form-control" placeholder="请输入关键字" />
			</div>
		</div>
	</div><br><br><br>
	<c:if test="${course.size() != 0}">
		<table class="table table-bordered table-striped table-hover table-condensed">
			<tr>
				<td>课程</td><td>上课时间</td><td>操作</td>
			</tr>
			<c:forEach items="${course}" var = "c">
				<tr>
					<td>${c.name}</td>
					<td>${c.hour}</td>
					<td>
						<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#exampleModal1" onclick="edit(${c.id})"><span class="glyphicon glyphicon-pencil"></span>修改</button>
						<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#exampleModal2" onclick="del(${c.id})"><span class="glyphicon glyphicon-trash"></span>删除</button>
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
					<h4 class="modal-title" id="exampleModalLabel">添加课程</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" name = "id" id = "course_id">
					<div class="form-group">
						<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">课程名称:</label>
						<div class="col-sm-8"><input type="text" name="name" id="name" class="form-control" placeholder="课程名称" onchange = "fun(this.value)" required></div>
						<div><label id="name-error" class="error col-lg-offset-4" for="name"></label></div>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">上课时间:</label>
						<div class="col-sm-8"><input type="text" name="hour" id="hour" class="form-control" placeholder="上课时间" required></div>
						<div><label id="hour-error" class="error col-lg-offset-4" for="huor"></label></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" id = "course_add" class="btn btn-primary">确定</button>
					<button type="reset" class="btn btn-default">重置</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("#course").click(function(){
		close();
		edit();
	})
	
	function ys(ys){
		var str = $("#ss_test").val();
		var hs = $("#hs").val();
		$("#home").load("course/main?ys="+ys+"&hs="+hs+"&str="+str);
	}
	
	function hs(hs){
		var str = $("#ss_test").val();
		if(hs > 0){
			$("#home").load("course/main?hs="+hs+"&str="+str);			
		}
	}
	
	function cz(str){
		var hs = $("#hs").val();
		$("#ss_test").val(str);
		$("#home").load("course/main?str="+str+"&hs="+hs);
	}
	
	$("#delete").click(function(){
		$(".modal-backdrop.in").remove();
		$(".modal-open").removeClass("modal-open");
		var id = $("#del_id").val();
		$("#home").load("course/delete?id="+id);
	})
	
	function del(id){
		$("#del_id").val(id);
	}
	
	$(".aaa a").click(function(e){
		e.preventDefault();
		$(this).tab("show");
	});
	
	function edit(id){
		close();
		$.post('course/edit', {id: id}, function(data){
			$('#name').val(data.course.name);
			$('#hour').val(data.course.hour);
			$('#course_id').val(data.course.id);
		});
	}
	
	function fun(name){
		$("#name-error").html("");
		$.post('course/name', {name: name}, function(data){
			$("#name-error").html(data.error);
		});
	}
	
	function close(){
		$("#name-error").html("");
		$("#hour-error").html("");
	}
	
	$("#course_add").click(function(){
		var name = $("#name").val();
		var hour = $("#hour").val();
		var a = 1;
		if(name == ""){
			$("#name-error").html("请输入课程");
			a = 0;
		}
		if(hour == ""){
			$("#hour-error").html("请输入上课时间");
			a = 0;
		}
		var obj = $("#name-error").html();
		if(obj != ""){
			a = 0;
		}
		var data = $("form").serialize();
		if(a == 1){
			$(".modal-backdrop.in").remove();
			$(".modal-open").removeClass("modal-open");
	        $.ajax( {
	            type : 'POST',
	            url : 'course/save',
	            data : data,
	            success : function(msg) {
	            	$("#home").html(msg);
	            }
	        });
		}
	})
</script>