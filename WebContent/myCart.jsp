<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的购物车</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>

<body style="padding-top:50px;padding-bottom:50px">
	<jsp:include page="/navBar/navBar.jsp"></jsp:include>
	<div class="container">
		<c:choose>
			<c:when test="${cart.size() == 0 }">
				<h1>购物车空空如也噢……</h1>
			</c:when>
			<c:otherwise>
				<c:forEach items="${cart }" var="cart_item" varStatus="id"
					begin="${pageState.get(0) }" end="${pageState.get(1) }">
					<div class="row cartItem${id.count }"
						style="padding-top:20px;display:none"
						id="div${cart_item.getID() }">
						<div class="media">
							<div class="col-xs-2 col-xs-offset-2"
								style="background-color:#f5f5f5;padding-top:20px"id="divLeft${cart_item.getID() }">
								<div class="media-left">
									<a itemID="<c:out value="${cart_item.getID() }"/>"
										class="thumbnail items"> <img class="media-object"
										src=<c:out value="${cart_item.getItemImgPath() }"/>
										id="<c:out value="${id.count }"/>">
									</a>
								</div>
							</div>
							<div class="col-xs-5" 
								style="background-color:#f5f5f5;padding-top:21px" id="divRight${cart_item.getID() }">
								<div class="media-body" style="padding-bottom:0px">
									<h4 class="media-heading">
										<a itemID="<c:out value="${cart_item.getID() }"/>"
											class="items"> ${cart_item.getName() } </a>
									</h4>
									<br>
									<p>单价:￥${cart_item.getPrice()}</p>
									<p>数量:<input type="text" class="itemNum"
											value="${cart_item.getNum() }"
											onePrice="${cart_item.getPrice() }"
											itemID="${cart_item.getID() }" 
											style="width:50px">
											<span class="stock" id="stock${cart_item.getID() }" value="${cart_item.getStock() }" itemID="${cart_item.getID() }">(库存：${cart_item.getStock() })</span>
									</p>
									<p>
										<span id="totalPrice${cart_item.getID() }"
											totalPrice="${cart_item.getPrice()*cart_item.getNum() }">
											总价:￥${cart_item.getPrice()*cart_item.getNum() } 
										</span> 
										<input type="checkbox" 
											value="${cart_item.getID() }" 
											style="float:right" 
											class="itemIDList" 
											name="itemIDList">
										<a class="deleteCart" itemID="${cart_item.getID() }"
											style="float:right;margin-right:15px">删除</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<div class="raw">
			<div class="col-xs-4 col-xs-offset-2" style="padding-left:0px">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a aria-label="Previous" id="previous">
						<span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:choose>
						<c:when test="${cart.size()%4 == 0 }">
							<c:forEach begin="0" end="${cart.size()/4 - 1 }" varStatus="vs">
								<li><a class="pageNum" pageState="${vs.count }">${vs.count }</a></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach begin="0" end="${cart.size()/4 }" varStatus="vs">
								<li><a class="pageNum" pageState="${vs.count }">${vs.count }</a></li>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<li><a aria-label="Next" id="next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
				</nav>
			</div>
		</div>
		<nav class="navbar navbar-default navbar-fixed-bottom">
			<div class="container" style="padding-left:200px;padding-right:300px">
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a>全选<input type="checkbox" class="checkAll"></a></li>
						<li><a id="deleteCheckedCart">删除</a></li>
						<li><a>总共<span id="sum">0</span>个商品
						</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a id="sumPrice">总价:￥0.00</a></li>
						<li><a id="perchaseGo">结算</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div><!-- container -->

	<!-- 提交根据ID查询商品的表单 -->
	<form action="GetSearchResult" method="get" style="display:none"
		id="form_item">
		<input type="text" value="searchItem" name="type" id="form_item_type">
		<input type="text" value="" name="itemID" id="form_item_ID">
	</form>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/localJs_navBar.js"></script>
	<script src="js/localJs_myCart.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
