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
				<td>课程</td><td>上课时间</td>
			</tr>
			<c:forEach items="${course}" var = "c">
				<tr>
					<td>${c.name}</td>
					<td>${c.hour}</td>
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
		$("#home").load("course/main2?str="+str+"&hs="+hs);
	}



</script>