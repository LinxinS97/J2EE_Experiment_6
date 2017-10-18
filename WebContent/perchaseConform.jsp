<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>确认订单</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">

  </head>
  
  <body style="padding-top:70px">
    <jsp:include page="navBar/navBar.jsp"></jsp:include>
    <div class="container">
    	<h5>确认收货地址</h5>
    	<hr style="height:1px;border:none;border-top:1px ridge black">
    	<div class="row" style="margin-left:0px;margin-right:0px">
    		<div class="col-xs-12" style="background:#f5f5f5">
    			<h4>我的地址：<input type="text">省&nbsp;&nbsp;<input type="text">市&nbsp;&nbsp;<input type="text">区</h4>
    			<h5>具体地址（详细到门户，例如几号楼几号房）:<input type="text" style="width:505px"></h5>
    		</div>
    	</div>
    	<br>
    	<h5>确认订单信息</h5>
    	<hr style="height:1px;border:none;border-top:1px ridge black">
    	<div class="row" style="margin-left:0px;margin-right:0px">
    		<center>
	    		<div class="col-xs-3" style="padding-left:2px;padding-right:2px">口袋商品<br><hr style="height:1px;border:none;border-top:1px ridge black"></div>
	    		<div class="col-xs-2" style="padding-left:2px;padding-right:2px">单价<br><hr style="height:1px;border:none;border-top:1px ridge black"></div>
	    		<div class="col-xs-2" style="padding-left:2px;padding-right:2px">数量<br><hr style="height:1px;border:none;border-top:1px ridge black"></div>
	    		<div class="col-xs-3" style="padding-left:2px;padding-right:2px">优惠方式<br><hr style="height:1px;border:none;border-top:1px ridge black"></div>
	    		<div class="col-xs-2" style="padding-left:2px;padding-right:2px">小计<br><hr style="height:1px;border:none;border-top:1px ridge black"></div>
    		</center>
    		<c:forEach items="${perchaseItems }" var="cart_item">
	    		<div class="row" style="padding-top:20px" style="background-color:#f5f5f5">
	    			<div class="col-xs-2" style="padding-left:20px;padding-right:2px">
			    		<div class="media">
			    			<div class="media-left" >
			    				<div class="thumbnail" style="margin-bottom:10px">
			    					<img class="media-object" src="${cart_item.getItemImgPath() }" id="imgPath${cart_item.getID() }">
			    				</div>
			    			</div>
			    		</div>
		    		</div>
		    		<div class="col-xs-1">
		    			<div class="media-body">
		    				<p><font size="1">${cart_item.getName() }</font></p>
		    			</div>
	    			</div>
		    		<center>
			    		<div class="col-xs-2" style="padding-top:40px;padding-left:2px;padding-right:2px">
			    			￥${cart_item.getPrice() }
			    		</div>
			    		<div class="col-xs-2" style="padding-top:40px;padding-left:2px;padding-right:2px">
			    			${cart_item.getNum() }
			    		</div>
			    		<div class="col-xs-3" style="padding-top:40px;padding-left:2px;padding-right:2px">
			    			无优惠
			    		</div>
			    		<div class="col-xs-2 totalPrice" style="padding-top:40px;padding-left:2px;padding-right:35px" value="${cart_item.getPrice() * cart_item.getNum() }">
			    			￥${cart_item.getPrice() * cart_item.getNum() }
			    		</div>
		    		</center>
	    		</div>
    		</c:forEach>
    	</div>
    	<div class="row">
    		<div class="col-xs-3 col-xs-offset-9" >
    			<h4 style="padding-left:70px">实付款：<span style="font-size:30" id="sumPrice">￥</span></h4>
    			<button type="button" class="btn btn-warning btn-lg" style="float:right" id="conform">确认购买</button>
    			<a href="myCart.jsp" type="button" class="btn btn-link btn-lg" style="float:right"><span class="glyphicon glyphicon-refresh"></span>返回购物车</a>
    		</div>
    	</div>
    </div>
    <jsp:include page="modal.jsp"></jsp:include>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/localJs_navBar.js"></script>
    <script src="js/localJs_perchaseConform.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
