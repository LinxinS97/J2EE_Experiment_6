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
    
    <title>四次元口袋</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/local.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    

  </head>
  
  <body style="padding-top:50px">
	  <jsp:include page="navBar/navBar.jsp"></jsp:include>
	  
	  <div class="jumbotron">
	  
		  <div class="container">
		     <div class="row">
		       <div class="col-xs-5">
		         <a class="thumbnail">
		           <img src=<c:out value="${Item.getItemImgPath() }"/> class="img-rounded img-responsive" id="item_img">
		         </a>
		       </div>
		       <div class="col-xs-6">
		         <h4>${Item.getName() }</h4>
		         <hr style="height:1px;border:none;border-top:1px ridge black;"/>
		         <h3>￥<c:out value="${Item.getPrice() }"/></h3>
		         <br>
		         <p style="font-size:15px;">类型：<c:out value="${Item.getType() }"/></p>
		         <p style="font-size:15px;">数量：<input type="text" name="num" style="width:50px;" value="1" id="itemNum">件&nbsp;&nbsp;&nbsp;（库存：<c:out value="${Item.getStock() }"/>）</p>
		         <br>
		         <a class="btn btn-default btn-lg" style="width:200px" id="p_btn" data-toggle="modal" data-target="#myModal_login" ItemID="${Item.getID() }">购买</a>
		         <button class="btn btn-primary btn-lg" style="width:200px" id="sc_btn" data-toggle="modal" data-target="#myModal_login" ItemID="${Item.getID() }" num="">
			         <span class="glyphicon glyphicon-shopping-cart" aira-hidden="true"></span>
			         加入购物车
		         </button>
		         <jsp:include page="modal.jsp"></jsp:include>
		       </div>
		     </div>
		  </div><!-- container -->
		  
	  </div><!-- jumbotron -->
	  <!-- 提交根据ID查询商品的表单 -->
	  <form action="GetSearchResult" method="get" style="display:none" id="form_item">
	    <input type="text" value="searchItem" name="type" id="form_item_type">
	    <input type="text" value="" name="itemID" id="form_item_ID">
	  </form>
  	  <script src="js/jquery-3.2.1.min.js"></script>
  	  <script src="js/localJs_show.js"></script>
  	  <script src="js/bootstrap.min.js"></script>
  </body>
</html>
