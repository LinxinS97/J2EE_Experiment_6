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
    
    <title>My JSP 'userInfo.jsp' starting page</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">

  </head>
    <body>
      <ul class="nav navbar-nav navbar-right" style="display:block" id="nav_loginInfo_unLogin">
      	<li><a href="login.jsp">亲，请登录</a></li>
        <li><a href="register.jsp">马上注册</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right" style="display:none" id="nav_loginInfo_isLogin">
        <li>
      		<img src="${loginUser.getUserImgPath() }" class="img-circle" style="width:50px;height:50px">
      	</li>
      	<li>
          <a aria-hidden="true" href="myInfo.jsp">雷猴啊，${loginUser.getUsername() }</a>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="display:none">我的消息<span class="badge">0</span><span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">待付款<span class="badge">0</span></a></li>
            <li><a href="#">待收货<span class="badge">0</span></a></li>
            <li><a href="#">待评价<span class="badge">0</span></a></li>
          </ul>
        </li>
        <li>
          <a id="signOut">退出登录</a>
        </li>
      </ul>
  </body>
</html>
