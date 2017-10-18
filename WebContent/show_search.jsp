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
    
    <title>搜索结果_四次元口袋</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="padding-top:50px">
    <jsp:include page="navBar/navBar.jsp"></jsp:include>
    <div class="container">
		<c:forEach items="${ItemList }" var="cart_item" varStatus="id"
			begin="${pageState.get(0) }" end="${pageState.get(1) }">
			<div class="row cartItem${id.count }"
				style="padding-top:20px;display:none"
				id="div${cart_item.getID() }">
				<div class="media">
					<div class="col-xs-2 col-xs-offset-2"
						style="background-color:#f5f5f5;padding-top:20px">
						<div class="media-left">
							<a itemID="<c:out value="${cart_item.getID() }"/>"
								class="thumbnail items"> <img class="media-object"
								src=<c:out value="${cart_item.getItemImgPath() }"/>
								id="<c:out value="${id.count }"/>">
							</a>
						</div>
					</div>
					<div class="col-xs-5" 
						style="background-color:#f5f5f5;padding-top:21px">
						<div class="media-body" style="padding-bottom:0px">
							<h4 class="media-heading">
								<a itemID="<c:out value="${cart_item.getID() }"/>"
									class="items"> ${cart_item.getName() } </a>
							</h4>
							<br>
							<h4 style="padding-bottom:57px">单价:￥${cart_item.getPrice()}</h4>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="raw">
			<div class="col-xs-4 col-xs-offset-2" style="padding-left:0px">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a aria-label="Previous" id="previous">
						<span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:choose>
						<c:when test="${ItemList.size()%4 == 0 }">
							<c:forEach begin="0" end="${ItemList.size()/4 - 1 }" varStatus="vs">
								<li><a class="pageNum" pageState="${vs.count }">${vs.count }</a></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach begin="0" end="${ItemList.size()/4 }" varStatus="vs">
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
    </div>
    <!-- 提交根据ID查询商品的表单 -->
	<form action="GetSearchResult" method="get" style="display:none"
		id="form_item">
		<input type="text" value="searchItem" name="type" id="form_item_type">
		<input type="text" value="" name="itemID" id="form_item_ID">
	</form>
 	<script src="js/jquery-3.2.1.min.js"></script>
 	<script src="js/localJs_navBar.js"></script>
  	<script src="js/localJs_showSearch.js"></script>
  	<script src="js/bootstrap.min.js"></script>
  </body>
</html>
