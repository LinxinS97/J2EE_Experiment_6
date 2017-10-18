<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>四次元口袋</title>
</head>


<body>
	<jsp:include page="navBar/navBar.jsp"></jsp:include>
	<br>
	<div class="jumbotron" id="login-jumbotron">
		<div class="container">
			<h2>登录の仪式</h2>
			<p>在这个古老的传送门前展现你真正的力量</p>
			<p>使用你的钥匙，打开四次元之门</p>
			<div class="row">
				<div class="col-xs-3 col-md-offset-8">
					<div class="form-group has-feedback" id="username-div">
						<label for="exampleInputEmail1" class="control-label">用户名</label>
						<div class="input-group">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-user"></span>
							</div>
							<input type="text" class="form-control" placeholder="请输入用户名"
								id="username" name="username"> <span
								class="glyphicon glyphicon-remove form-control-feedback"
								aria-hidden="true" style="display: none" id="username-span"></span>
						</div>
						<span id="helpBlock1" class="help-block" style="display: none">朋友，用户名不能没有啊</span>
						<span id="helpBlock4" class="help-block" style="display: none">朋友，口袋里没这个用户名</span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-3 col-md-offset-8">
					<div class="form-group has-feedback" id="psw-div">
						<label for="exampleInputPassword1" class="control-label">密码</label>
						<div class="input-group">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-lock"></span>
							</div>
							<input type="password" class="form-control" placeholder="请输入密码"
								id="psw" name="psw"> <span
								class="glyphicon glyphicon-remove form-control-feedback"
								aria-hidden="true" style="display: none" id="psw-span"></span>
						</div>
						<span id="helpBlock2" class="help-block" style="display: none">朋友，密码也不能没有啊</span>
						<span id="helpBlock3" class="help-block" style="display: none">朋友，你密码错了，再想想</span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-3 col-md-offset-8">
					<button type="submit" class="btn btn-primary btn-lg btn-block"
						id="bt-submit">登录</button>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/localJs_login.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
