<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/local.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>四次元口袋</title>
</head>


<body class="bodycss">
	<jsp:include page="navBar/navBar.jsp"></jsp:include>
	<div class="container">
		<!-- 网页左部分 -->
		<div class="row">
			<div class="col-xs-2"
				style="padding-left:0px;padding-right:0px;font-size:15px">
				<div class="list-group">
					<a class="list-group-item main_tr" value="女装" style="border:0px"><span
						class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;女装</a>
					<a class="list-group-item main_tr" value="手机" style="border:0px"><span
						class="glyphicon glyphicon-phone" aria-hidden="true"></span>&nbsp;&nbsp;手机</a>
					<a class="list-group-item main_tr" value="家电" style="border:0px"><span
						class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;家电</a>
					<a class="list-group-item main_tr" value="数码" style="border:0px"><span
						class="glyphicon glyphicon-camera" aria-hidden="true"></span>&nbsp;&nbsp;数码</a>
					<a class="list-group-item main_tr" value="游戏" style="border:0px"><span
						class="glyphicon glyphicon-blackboard" aria-hidden="true"></span>&nbsp;&nbsp;游戏</a>
					<a class="list-group-item main_tr" value="动漫" style="border:0px"><span
						class="glyphicon glyphicon-music" aria-hidden="true"></span>&nbsp;&nbsp;动漫</a>
					<a class="list-group-item main_tr" value="影视" style="border:0px"><span
						class="glyphicon glyphicon-film" aria-hidden="true"></span>&nbsp;&nbsp;影视</a>
					<a class="list-group-item main_tr" value="美食" style="border:0px"><span
						class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>&nbsp;&nbsp;美食</a>
					<a class="list-group-item main_tr" value="办公" style="border:0px"><span
						class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>&nbsp;&nbsp;办公</a>
					<a class="list-group-item main_tr" value="学习" style="border:0px"><span
						class="glyphicon glyphicon-education" aria-hidden="true"></span>&nbsp;&nbsp;学习</a>
					<a class="list-group-item main_tr" value="卡券" style="border:0px"><span
						class="glyphicon glyphicon-usd" aria-hidden="true"></span>&nbsp;&nbsp;卡券</a>
				</div>
				<!-- 提交根据类型查询商品的表单 -->
				<form method="get" action="GetSearchResult" style="display:none"
					id="form_type">
					<input type="text" value="searchType" name="type">
					<input type="text" value="" name="form_type_key" id="form_type_key">
				</form>
			</div>
			<!-- 这里用jstl标签拿出list中存储的最新产品的图片和商品信息 -->
			<div class="col-xs-7" style="padding-right:0px;padding-left:0px">
				<!-- 图片轮播效果 -->
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel" data-pause="hover">
					<!-- 小圆点 -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						<li data-target="#carousel-example-generic" data-slide-to="3"></li>
						<li data-target="#carousel-example-generic" data-slide-to="4"></li>
					</ol>
					<!-- 轮播图片 -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="picSource/a1.JPG" alt="First IMG"
								style="width:739px;height:440px">
							<div class="carousel-caption">
								<h3>四次元口袋</h3>
								<p>想象，是发现的本质</p>
							</div>
						</div>
						<c:forEach items="${carouselItem }" var="img">
							<div class="item">
								<a class="items" ItemID=<c:out value="${img.getID() }"/>>
								<img
									src=<c:out value="${img.getItemImgPath() }"/>
									style="width:739px;height:440px"></a>
							</div>
						</c:forEach>
					</div>

					<!-- 左右两侧的控制按钮 -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div><!-- carousel-example-generic -->

			</div><!-- col-md-7 -->


			<!-- 网页右边部分 -->
			<div class="col-xs-3"
				style="padding-left:5px;padding-right:0px;padding-bottom:80px;background-color:#fff">
				<jsp:include page="main_loginInfo.jsp"></jsp:include>
			</div>
		</div><!-- row -->

		<div class="row">
			<div class="col-xs-5">
				<hr style="height:1px;border:none;border-top:1px ridge black;" />
			</div>
			<div class="col-xs-2" style="padding-top:8px;">
				<center>
					<p>最新商品</p>
				</center>
			</div>
			<div class="col-xs-5">
				<hr style="height:1px;border:none;border-top:1px ridge black;" />
			</div>
		</div>
		<!-- 下方商品展示区 -->
		<div class="row">
			<c:forEach items="${latestItem }" var="item" varStatus="id">
				<div class="col-xs-3">
					<a class="thumbnail items" itemID=<c:out value="${item.getID() }"/>>
						<img src=<c:out value="${item.getItemImgPath() }"/>
						class="img-rounded img-responsive" alt="商品图片"
						id=<c:out value="${id.count }"/>>
						<div class="caption">
							<h3>
								￥
								<c:out value="${item.getPrice() }" />
							</h3>
							<p>
								<c:out value="${item.getName() }" />
							</p>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>

	</div>
	<!-- container -->
	<!-- 提交根据ID查询商品的表单 -->
	<form action="GetSearchResult" method="get" style="display:none"
		id="form_item">
		<input type="text" value="searchItem" name="type" id="form_item_type">
		<input type="text" value="" name="itemID" id="form_item_ID">
	</form>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/localJs_main.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
