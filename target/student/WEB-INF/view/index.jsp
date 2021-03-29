<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生综合管理系统</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
<script src="webjars/jquery/3.3.1/dist/jquery.js"></script>
<script type="text/javascript" src="webjars/bootstrap/3.3.7-1/js/bootstrap.js"></script>

<script type="text/javascript" src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

<style type="text/css">
	.error {
		color: red;
		font-size: 14px;
	}
	#password {
		background: url(${pageContext.request.contextPath}/img/password.png) no-repeat left #fff;
		text-indent: 1em;
	}
	#account {
		background: url(${pageContext.request.contextPath}/img/username.png) no-repeat left #fff;
		text-indent: 1em;
	}
	#home{
		padding-top: 51px;
	}
	tr{
		text-align: center;
	}
	body{
		background: url(${pageContext.request.contextPath}/img/beijing.jpg)
	}
	#home .home_1{
		width: 70%;
		margin: 0px auto;
		margin-top: 30px;
		background: white;
		padding: 30px 30px;
	}
	
	#tail{
		width: 100%;
		height: 190px;
		background: #EAEAEA;
		font-family: "楷体";
		line-height: 28px;
		padding-top: 25px;
	}
	
	.tp{
		height: 128px;
		width: 100px;
		text-align: center;
		float: left;
		margin-right: 20px;
		display: block;
	}
	
	p{
		text-indent: 2em;
	}
	
	.container a:hover{
		opacity: 0.7;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-default">
		<div class = "container-fluid col-md-10 col-md-offset-1">
			<div class="navbar-header">
				<button type="button" class = "navbar-toggle" data-toggle = "collapse" data-target = "#menu">
					<span class = "sr-only">展开导航</span>
					<span class = "icon-bar"></span>
					<span class = "icon-bar"></span>
					<span class = "icon-bar"></span>
				</button>
				<a class = "navbar-brand" href="">学生综合管理系统</a>
			</div>
			<div class = "collapse navbar-collapse" id = "menu">
				<c:choose>
					<c:when test="${user == null}">
						<ul class="nav navbar-nav navbar-right">
							<li><a data-toggle="modal" data-target="#exampleModal"><span class="glyphicon glyphicon-user"></span>  登录</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav">
							<li><a>欢迎您：${user.name}</a></li>
						</ul>
						<c:choose>
							<c:when test="${user.sf == 1}">
								<ul class = "nav navbar-nav navbar-right mytab">
									<li class = "active" src = "home"><a href = ""><span class = "glyphicon glyphicon-home"></span>  首页</a></li>
									<li class="dropdown">
										<a href="" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>  设置<span class="caret"></span></a>
										<ul class="dropdown-menu dropdown-menu-left">
											<li src="student/main"><a href="">学生管理</a></li>
											<li src="tbClass/main"><a href="">班级管理</a></li>
											<li class="divider"></li>
											<li src="updata"><a href="">修改密码</a></li>
										</ul>
									</li>
									<li src="course/main"><a href="">课程管理</a></li>
									<li src="teacher/main"><a href="">老师管理</a></li>
									<li><a data-toggle="modal" href="" data-target="#exampleModal5"><span class="glyphicon glyphicon-duplicate"></span>  使用说明</a></li>
									<li data-toggle="modal" data-target="#exampleModal3"><a><span class = "glyphicon glyphicon-off"></span>  注销</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${user.sf == 0}">
										<ul class = "nav navbar-nav navbar-right mytab">
											<li class = "active" src = "home"><a href = ""><span class = "glyphicon glyphicon-home"></span>  首页</a></li>
											<li class="dropdown">
												<a href="" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>  设置<span class="caret"></span></a>
												<ul class="dropdown-menu dropdown-menu-left">
													<li src="grade/grcj?id=${user.id}"><a href="">查看个人成绩</a></li>
													<li src="grade/bj_all?id=${user.tbClass.id}"><a href="">查看班级成绩</a></li>
													<li class="divider"></li>
													<li src="updata"><a href="">修改密码</a></li>
												</ul>
											</li>
											<li src="course/main2"><a href="">查看课程</a></li>
											<li src="student/bj_all?id=${user.tbClass.id}"><a href="">查看班级成员</a></li>
											<li data-toggle="modal" data-target="#exampleModal3"><a><span class = "glyphicon glyphicon-off"></span>  注销</a></li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul class = "nav navbar-nav navbar-right mytab">
											<li class = "active" src = "home"><a href = ""><span class = "glyphicon glyphicon-home"></span>  首页</a></li>
											<li class="dropdown">
												<a href="" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>  设置<span class="caret"></span></a>
												<ul class="dropdown-menu dropdown-menu-left">
													<li src="student/main"><a href="">学生管理</a></li>
													<li class="divider"></li>
													<li src="updata"><a href="">修改密码</a></li>
												</ul>
											</li>
											<li src="course/main"><a href="">课程管理</a></li>
											<li src="grade/entering"><a href=""><span class="glyphicon glyphicon-file"></span>  录入成绩</a></li>
											<li src="grade/updata"><a href=""><span class="glyphicon glyphicon-pencil"></span>  修改成绩</a></li>
											<li><a href="" data-toggle="modal" data-target="#exampleModal5"><span class="glyphicon glyphicon-duplicate"></span>  使用说明</a></li>
											<li data-toggle="modal" data-target="#exampleModal3"><a><span class = "glyphicon glyphicon-off"></span>  注销</a></li>
										</ul>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
	
	<input type = "hidden" id = "ss_test" value="">
	<div id = "home"></div>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form class="form-horizontal bv-form cmxform" action="login" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="exampleModalLabel">登录</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">身份:</label>
							<div class="col-sm-8">
							<select class="form-control" name="identity">
		                    	<option>管理员</option>
		                    	<option>老师</option>
		                    	<option>学生</option>
		                    </select>
							</div>
						</div><br>
						<div class="form-group">
							<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">账号:</label>
							<div class="col-sm-8"><input type="text" name="account" id="account" class="form-control" placeholder="账号" required></div>
							<div><label id="account-error" class="error col-lg-offset-4" for="account"></label></div>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-sm-2 col-lg-offset-1 control-label">密码:</label>
							<div class="col-sm-8"><input type="password" name="password" id="password" class="form-control" placeholder="密码" required></div>
							<div><label id="password-error" class="error col-lg-offset-4" for="password"></label></div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">确定</button>
						<button type="reset" class="btn btn-default">重置</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">提示</h4>
				</div>
				<div class="modal-body">
					<center>是否确定退出！</center>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" id="tc" class="btn btn-primary">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="exampleModal5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<input type="hidden" id = "del_id">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">使用说明</h4>
				</div>
				<div class="modal-body">
					成绩管理系统分为三个层次：管理员，老师，学生<br>
					管理员：<br>
					<p>管理员主要功能：老师管理，班级管理，学生管理，课程管理，修改密码等功能</p>
					老师：<br>
					<p>老师主要功能：成绩录入和修改，课程管理，学生管理，修改密码等功能</p>
					学生：<br>
					<p>学生功能：查看班级成绩，查看课程，查看班级成员，查看个人成绩等功能</p>
					<b>管理员初始密码为admin，老师和学生初始密码为123456，老师可重置学生密码为初始密码123456，管理员可以重置学生和老师密码为123456。</b>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$("#home").load("home");
		$(".mytab a").click(function(e){
			e.preventDefault();
			$(this).tab("show");
		});
		
		$(".mytab li").click(function(){
			var obj = $(this).attr("src");
			$("#home").load(obj);
		});
		
		$("#tc").click(function(){
			window.location.href="tc";
		})
	</script>
</body>
</html>