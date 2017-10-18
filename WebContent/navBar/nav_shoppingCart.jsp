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
    
    <title>My JSP 'nav_shoppingCart.jsp' starting page</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<c:choose>
  	  <c:when test="${!empty loginUser }">
	    <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的购物车<span class="badge">${cart.size() }</span><span class="caret"></span></a>
	  </c:when>
	</c:choose>
	  <ul class="dropdown-menu" id="myWidth">
	  <c:forEach items="${cart }" var="cart_item" begin="0" end="2">
	    <li>
	      <a class="media items" itemID=<c:out value="${cart_item.getID() }"/>>
	        <div class="media-left">
	          <img class="media-object" src=<c:out value="${cart_item.getItemImgPath() }"/> height="50px" width="50px" id=<c:out value="${id.count }"/>>
	        </div>
	        <div class="media-body">
	          <p class="dots">${cart_item.getName() }</p>
	        </div>
	      </a>
	    </li>
	  </c:forEach>
	  <li role="separator" class="divider"></li>
	  <c:choose>
	    <c:when test="${cart.size() == 0 }">
	      <li>亲，您的购物车空空如也...</li>
	    </c:when>
	    <c:when test="${cart.size() > 0 && cart.size() <= 3}">
	    </c:when>
	    <c:otherwise>
	      <li>购物车中还有${cart.size() - 3 }件商品</li>
	    </c:otherwise>
	  </c:choose>
	  <li><button type="button" class="btn btn-primary btn-xs"><a href="myCart.jsp"><font color="white">查看我的购物车</font></a></button></li>
	 </ul>
  </body>
</html>
