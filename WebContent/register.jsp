<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<div class="jumbotron">
		<div class="container">
			<form method="post" action="Register" enctype="multipart/form-data">
				<h2>契约の仪式</h2>
				<p>在这卷古老的羊皮纸下</p>
				<p>签订契约，进入四次元的世界</p>
				<div class="row">
					<div class="col-xs-3 col-md-offset-8">
						<div class="form-group has-feedback" id="username-div"> 
							<label class="control-label">用户名*</label>
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-user"></span>
								</div>
								<input type="text" class="form-control" placeholder="请输入用户名"
									id="username" name="username"> <span
									class="glyphicon glyphicon-remove form-control-feedback"
									aria-hidden="true" style="display: none" id="wrong1"></span>
							</div>
							<span id="helpBlock1" class="help-block" style="display: none">朋友，用户名不能忘啊</span>
							<span id="helpBlock7" class="help-block" style="display: none">朋友，用户名和别人重了</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-3 col-md-offset-8">
						<div class="form-group has-feedback" id="psw-div">
							<label for="exampleInputPassword1" class="control-label">密码*</label>
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-lock"></span>
								</div>
								<input type="password" class="form-control" placeholder="请输入密码"
									id="psw" name="psw"> <span
									class="glyphicon glyphicon-remove form-control-feedback"
									aria-hidden="true" style="display: none" id="wrong2"></span>
							</div>
							<span id="helpBlock2" class="help-block" style="display: none">朋友，密码忘不得啊</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-3 col-md-offset-8">
						<div class="form-group has-feedback" id="psw-conform-div">
							<label for="exampleInputPassword1" class="control-label">确认密码*</label>
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-lock"></span>
								</div>
								<input type="password" placeholder="再确认一次呗" class="form-control"
									id="psw-conform"> <span
									class="glyphicon glyphicon-remove form-control-feedback"
									aria-hidden="true" style="display: none" id="wrong3"></span>
							</div>
							<span id="helpBlock3" class="help-block" style="display: none">不确认一次怎么知道对不对呢？</span>
							<span id="helpBlock4" class="help-block" style="display: none">似乎和你原来的密码不太一样</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-3 col-md-offset-8">
						<div class="form-group has-feedback" id="tel-div">
							<label class="control-label">手机号码*</label>
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-phone"></span>
								</div>
								<input type="text" placeholder="请输入手机号码" class="form-control"
									id="tel" name="tel"> <span
									class="glyphicon glyphicon-remove form-control-feedback"
									aria-hidden="true" style="display: none" id="wrong4"></span>
							</div>
							<span id="helpBlock5" class="help-block" style="display: none">顺手填个手机号呗老哥</span>
							<span id="helpBlock6" class="help-block" style="display: none">手机号似乎不太符合地球标准啊</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-3 col-md-offset-8">
						<div class="form-group has-feedback" id="img-div">
							<label class="control-label">上传头像</label>
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-camera"></span>
								</div>
								<input type="file" id="img" name="img">
							</div>
							<img class="img-circle" src="" id="img-show" height="79px"
								width="79px">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-3 col-md-offset-8">
						<button type="submit" class="btn btn-primary btn-lg btn-block"
							id="bt-submit">注册</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/localJs_register.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>

