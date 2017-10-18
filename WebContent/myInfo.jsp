<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的口袋</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="padding-top:50px">
	<jsp:include page="navBar/navBar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<ol class="breadcrumb"
				style="margin-bottom:0px;padding-top:20px;padding-bottom:20px;font-size:20px">
				<li class="active">首页</li>
				<li><a href="#">账户设置</a></li>
			</ol>
		</div>
		<div class="row">
			<div class="col-xs-2"
				style="padding-left:0px;padding-right:0px;font-size:15px">
				<div class="list-group">
					<a href="myCart.jsp" class="list-group-item" style="border:0px">我的购物车</a>
					<a href="#" class="list-group-item" style="border:0px">已买到的宝贝</a> <a
						href="#" class="list-group-item" style="border:0px">修改我的信息</a>
				</div>
			</div>
			<div class="col-xs-10"
				style="padding-top:20px;padding-bottom:20px ;background-color:#b1d2e7">
				<div class="media">
					<div class="media-left">
						<img class="media-object img-circle"
							src="${loginUser.getUserImgPath() }" alt="userImg"
							style="width:81px;height:81px">
					</div>
					<div class="media-body">
						<h4 class="media-heading">欢迎你！${loginUser.getUsername() }</h4>
					</div>
				</div>
				<!-- media -->
			</div>
		</div>
		<!-- row -->
	</div>
	<!-- container -->
	<!-- 提交根据ID查询商品的表单 -->
	<form action="GetSearchResult" method="get" style="display:none"
		id="form_item">
		<input type="text" value="searchItem" name="type" id="form_item_type">
		<input type="text" value="" name="itemID" id="form_item_ID">
	</form>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/localJs_myInfo.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
