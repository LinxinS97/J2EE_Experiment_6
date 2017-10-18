<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath%>">
	
		<title>My JSP 'modal.jsp' starting page</title>
		
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	
	</head>

	<body>
		<!-- 模态框 -->
		<div class="modal fade bs-example-modal-sm" id="myModal_login"
			tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">请先登录</h4>
					</div>
					<div class="modal-body">
	
						<div class="row">
							<div class="col-xs-8 col-xs-offset-2">
								<div class="form-group has-feedback" id="username-div">
									<label class="control-label">用户名</label>
									<div class="input-group">
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-user"></span>
										</div>
										<input type="text" class="form-control" placeholder="请输入用户名"
											id="username"> <span
											class="glyphicon glyphicon-remove form-control-feedback"
											aria-hidden="true" style="display:none" id="username-span"></span>
									</div>
									<span id="helpBlock1" class="help-block" style="display:none">朋友，用户名不能没有啊</span>
									<span id="helpBlock4" class="help-block" style="display:none">朋友，口袋里没这个用户名</span>
								</div>
							</div>
						</div><!-- row -->
						<div class="row">
							<div class="col-xs-8 col-xs-offset-2">
								<div class="form-group has-feedback" id="psw-div">
									<label for="exampleInputPassword1" class="control-label">密码</label>
									<div class="input-group">
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-lock"></span>
										</div>
										<input type="password" class="form-control" placeholder="请输入密码"
											id="psw"> <span
											class="glyphicon glyphicon-remove form-control-feedback"
											aria-hidden="true" style="display:none" id="psw-span"></span>
									</div>
									<span id="helpBlock2" class="help-block" style="display:none">朋友，密码也不能没有啊</span>
									<span id="helpBlock3" class="help-block" style="display:none">朋友，你密码错了，再想想</span>
								</div>
							</div>
						</div>
						<!-- row -->
					</div>
					<!-- modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="bt-submit">登录</button>
						<a href="register.jsp" type="button" class="btn btn-primary">注册</a>
					</div>
				</div>
			</div>
		</div><!-- modal -->
	
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" id="myModal_addSuccess">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-body">确实添加进购物车了！</div>
				</div>
			</div>
		</div><!-- modal -->
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" id="myModal_itemExist">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-body">这个宝贝已经在你的购物车里了！</div>
				</div>
			</div>
		</div><!-- modal -->
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" id="myModal_perchaseSuccess">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-body">购买成功！</div>
				</div>
			</div>
		</div><!-- modal -->
	</body>
</html>
